import csv
import json
import math

import numpy as np
import scipy.sparse as sp
import torch
import torch.optim
import joblib
import os
from sklearn import preprocessing
from sklearn.pipeline import Pipeline
from torch_geometric.data import DataLoader
import net_graph as net_encoding
from scipy.stats import pearsonr
from torch_geometric.data import Data
import torch.nn.functional as F

#from graphNet.GCN import padding_graph_matrcies

CUDA = torch.cuda.is_available()

def _nn_path(base):
    return os.path.join(base, "nn_weights")

def _x_transform_path(base):
    return os.path.join(base, "x_transform")

def _y_transform_path(base):
    return os.path.join(base, "y_transform")

def _channels_path(base):
    return os.path.join(base, "channels")

def _n_path(base):
    return os.path.join(base, "n")


def _inv_log1p(x):
    return np.exp(x) - 1

def unnormalize(vecs, mini, maxi):
    return torch.exp(vecs * (maxi - mini) + mini)

def qerror_loss(preds, targets, mini, maxi):
    # TODO:
    qerror = []
    preds = unnormalize(preds, mini, maxi)
    targets = unnormalize(targets, mini, maxi)
    for i in range(len(targets)):
        if (preds[i] > targets[i]).cpu().data.numpy()[0]:
            qerror.append(preds[i] / targets[i])
        else:
            qerror.append(targets[i] / preds[i])
    return torch.mean(torch.cat(qerror)), torch.median(torch.cat(qerror)), torch.max(torch.cat(qerror)), \
           torch.argmax(torch.cat(qerror))

def normalize_label(labels, mini, maxi):
    labels_norm = (np.log(labels) - mini) / (maxi - mini)
    labels_norm = np.minimum(labels_norm, np.ones_like(labels_norm))
    labels_norm = np.maximum(labels_norm, np.zeros_like(labels_norm))
    print(labels_norm)
    return labels_norm


def unnormalize(vecs, mini, maxi):
    return torch.exp(vecs * (maxi - mini) + mini)

#device = torch.device('cuda:0')


def padding_graph_matrcies(vertex_matrix, edge_matrix):
    # vertex_matrix = torch.tensor(vertex_matrix, dtype=torch.float32)

    current_size = vertex_matrix.size(0)
    target_size = 200

    if current_size < target_size:
        pad_size = target_size - current_size
        padding = torch.zeros((pad_size,) + vertex_matrix.shape[1:], dtype=torch.float32)
        padded_vertex_matrix = torch.cat((vertex_matrix, padding), dim=0)

        padding = torch.zeros((pad_size, current_size), dtype=torch.float32)
        padded_edge_matrix = torch.cat([edge_matrix, padding], dim=0)
        padding = torch.zeros((target_size, pad_size), dtype=torch.float32)
        padded_edge_matrix = torch.cat([padded_edge_matrix, padding], dim=1)

    else:
        # raise an alart
        print("The number of the dataset columns is larger than the maximium threshold!")
        exit(1)

    return padded_vertex_matrix, padded_edge_matrix


class BaoRegression:
    np.set_printoptions(precision=6, suppress=True)  # 去掉科学技术法显示结果


    def __init__(self, verbose=False, have_cache_data=False):
        self.__net = None
        self.__verbose = verbose
        log_transformer = preprocessing.FunctionTransformer(
            np.log1p, _inv_log1p,
            validate=True)
        scale_transformer = preprocessing.MinMaxScaler()

        self.__pipeline = Pipeline([("log", log_transformer),
                                    ("scale", scale_transformer)])
        self.__have_cache_data = have_cache_data
        self.__in_channels = None
        self.__n = 0
        self.selection_graph_vertex = 72
        self.hidden_dim = self.get_hidden_dimension(self.selection_graph_vertex)
    def __log(self, *args):
        if self.__verbose:
            print(*args)

    def num_items_trained_on(self):
        return self.__n
            
    def load(self, path):
        with open(_n_path(path), "rb") as f:
            self.__n = joblib.load(f)
        with open(_channels_path(path), "rb") as f:
            self.__in_channels = joblib.load(f)

        self.__net = net_encoding.BaoNet( self.selection_graph_vertex,self.hidden_dim)
        self.__net.load_state_dict(torch.load(_nn_path(path), map_location=torch.device('cpu')))
        self.__net.eval()
        
        with open(_y_transform_path(path), "rb") as f:
            self.__pipeline = joblib.load(f)
        #with open(_x_transform_path(path), "rb") as f:
        #    self.__tree_transform = joblib.load(f)

    def save(self, path):
        # try to create a directory here
        os.makedirs(path, exist_ok=True)

        #print(self.__net.to('cuda:0'))
        torch.save(self.__net.state_dict(), _nn_path(path))

        with open(_y_transform_path(path), "wb") as f:
            joblib.dump(self.__pipeline, f)
        #with open(_x_transform_path(path), "wb") as f:
        #    joblib.dump(self.__tree_transform, f)
        with open(_channels_path(path), "wb") as f:
            joblib.dump(self.__in_channels, f)
        with open(_n_path(path), "wb") as f:
            joblib.dump(self.__n, f)
            # 导出为onnx格式

    def incremental_train(self, xpath, ypath,  fn):


        device = torch.device('cuda:0')
        #device = torch.device('cpu')

        # 打开文件并逐行读取
        dataset = []  # data数据对象的list集合
        xlist = []
        Y = []
        with open(xpath, 'r') as file:
            for line in file:
                # 解析 JSON 格式数据
                data = json.loads(line)
                xdata = {}

                vertex_matrix = torch.tensor(data["node_matrix"], dtype=torch.float32)
                edge_matrix = torch.tensor(data["edge_matrix"], dtype=torch.float32)
                y = torch.tensor(data["y"], dtype=torch.float32)
                #vertex_matrix, edge_matrix = padding_graph_matrcies(vertex_matrix, edge_matrix)
                xdata['Vnode'] = vertex_matrix.to(device)
                xdata['Vedge'] = edge_matrix.to(device)
                xdata['y'] = y
                xlist.append(xdata)
                Y.append(y)

        pairs = list(zip(xlist,Y))
        dataset = DataLoader(pairs,
                             batch_size=1,
                             shuffle=True, drop_last=True) #,collate_fn=collate

        self.__net = net_encoding.BaoNet(self.selection_graph_vertex, self.hidden_dim)


        # 冻结所有层的参数
        for param in self.__net.parameters():
            param.requires_grad = False

        # 解冻（全连接层）的参数
        for param in self.__net.cn1.parameters():
            param.requires_grad = True
        for param in self.__net.cn2.parameters():
            param.requires_grad = True
        for param in self.__net.Rule.parameters():
            param.requires_grad = True


        self.__net = self.__net.to(device)

        loss_fn = torch.nn.MSELoss()

        optimizer = torch.optim.Adam(self.__net.parameters(), lr=0.0002)  # 优化器，参数优化计算
        scheduler = torch.optim.lr_scheduler.StepLR(optimizer, 20, 0.7)
        #optimizer = torch.optim.SGD(self.__net.parameters(), lr=0.001)

        losses = []
        import time

        e_min = 9999

        start_time = time.time()
        for epoch in range(5):

            cost_predss = np.empty(0)
            loss_accum = 0
            loss_all = 0
            # 一轮epoch优化的内容
            for data in xlist:  # 每次提取训练数据集一批20张data图片数据赋值给data

                optimizer.zero_grad()  # 梯度清零
                output = self.__net(data, data["y"])  # 前向传播，把一批训练数据集导入模型并返回输出结果，输出结果的维度是[20,2]
                label = data["y"].to(device)  # 20张图片数据的标签集合，维度是[20]
                # print(label)
                 # 损失函数计算，原理是把output的数值根据Label对应的那个值拿出来，比如lable为[1,1,1]，那就把output中的第一二三维的第二个元素取出，然后去掉负号，再求和之后取均值。

                output = output.to(torch.float32).to(device)
                output = torch.squeeze(output)
                loss = loss_fn(output, label)
                loss.backward()  # 反向传播
                # card_pred = card_pred.to(torch.float32).to(device)

                loss_all = loss_all+loss.item()  # 将最后的损失值汇总
                cost_predss = np.append(cost_predss, output.detach().cpu().numpy())

                optimizer.step()  # 更新模型参数
            tmp = (loss_all / len(dataset))  # 算出损失值或者错误率
            if epoch % 1 == 0:
                end_time = time.time()  # 程序结束时间
                run_time = end_time - start_time  # 程序的运行时间，单位为秒
                print("Epoch", epoch, "training loss:", tmp, "time:", run_time)
                #print_qerror(cost_predss, Y, True)
            scheduler.step()

            if epoch > 30:
                e_mean , e_50 = self.predict(ypath)
                if e_mean < e_min and e_mean > 0 and e_50 > 0:
                    e_min = e_mean
                    self.save(fn)
        else:
            self.__log("Stopped training after max epochs")
        # 获取代码执行前的时间戳
        end_time = time.time()
        execution_time = end_time - start_time
        print("代码执行花费的时间：", execution_time, "秒")


    def fit(self, xpath, ypath,  fn):

        device = torch.device('cuda:0')
        device = torch.device('cpu')

        # 打开文件并逐行读取
        dataset = []  # data数据对象的list集合
        xlist = []
        Y = []
        with open(xpath, 'r') as file:
            for line in file:
                # 解析 JSON 格式数据
                data = json.loads(line)
                xdata = {}

                vertex_matrix = torch.tensor(data["node_matrix"], dtype=torch.float32)
                edge_matrix = torch.tensor(data["edge_matrix"], dtype=torch.float32)
                y = torch.tensor(data["y"], dtype=torch.float32)
                #vertex_matrix, edge_matrix = padding_graph_matrcies(vertex_matrix, edge_matrix)
                xdata['Vnode'] = vertex_matrix.to(device)
                xdata['Vedge'] = edge_matrix.to(device)
                xdata['y'] = y
                xlist.append(xdata)
                Y.append(y)

        pairs = list(zip(xlist,Y))
        dataset = DataLoader(pairs,
                             batch_size=1,
                             shuffle=True, drop_last=True) #,collate_fn=collate

        self.__net = net_encoding.BaoNet(self.selection_graph_vertex, self.hidden_dim)

        '''
        # 冻结所有层的参数
        for param in self.__net.parameters():
            param.requires_grad = False

        # 解冻（全连接层）的参数
        for param in self.__net.cn1.parameters():
            param.requires_grad = True
        for param in self.__net.cn2.parameters():
            param.requires_grad = True
        for param in self.__net.Rule.parameters():
            param.requires_grad = True
        '''

        self.__net = self.__net.to(device)

        loss_fn = torch.nn.MSELoss()

        optimizer = torch.optim.Adam(self.__net.parameters(), lr=0.0002)  # 优化器，参数优化计算
        scheduler = torch.optim.lr_scheduler.StepLR(optimizer, 20, 0.7)
        #optimizer = torch.optim.SGD(self.__net.parameters(), lr=0.001)

        losses = []
        import time

        e_min = 9999

        start_time = time.time()
        for epoch in range(100):

            cost_predss = np.empty(0)
            loss_accum = 0
            loss_all = 0
            # 一轮epoch优化的内容
            for data in xlist:  # 每次提取训练数据集一批20张data图片数据赋值给data

                optimizer.zero_grad()  # 梯度清零
                output = self.__net(data, data["y"])  # 前向传播，把一批训练数据集导入模型并返回输出结果，输出结果的维度是[20,2]
                label = data["y"].to(device)  # 20张图片数据的标签集合，维度是[20]
                # print(label)
                 # 损失函数计算，原理是把output的数值根据Label对应的那个值拿出来，比如lable为[1,1,1]，那就把output中的第一二三维的第二个元素取出，然后去掉负号，再求和之后取均值。

                output = output.to(torch.float32).to(device)
                output = torch.squeeze(output)
                loss = loss_fn(output, label)
                loss.backward()  # 反向传播
                # card_pred = card_pred.to(torch.float32).to(device)

                loss_all = loss_all+loss.item()  # 将最后的损失值汇总
                cost_predss = np.append(cost_predss, output.detach().cpu().numpy())

                optimizer.step()  # 更新模型参数
            tmp = (loss_all / len(dataset))  # 算出损失值或者错误率
            if epoch % 1 == 0:
                end_time = time.time()  # 程序结束时间
                run_time = end_time - start_time  # 程序的运行时间，单位为秒
                print("Epoch", epoch, "training loss:", tmp, "time:", run_time)
                #print_qerror(cost_predss, Y, True)
            scheduler.step()

            if epoch > 90:
                e_mean , e_50 = self.predict(ypath)
                if e_mean < e_min and e_mean > 0 and e_50 > 0:
                    e_min = e_mean
                    self.save(fn)
        else:
            self.__log("Stopped training after max epochs")
        # 获取代码执行前的时间戳
        start_time = time.time()
        execution_time = end_time - start_time
        print("代码执行花费的时间：", execution_time, "秒")


    def get_hidden_dimension(self, graph_vertex):
        return max(math.ceil(2 * math.sqrt(graph_vertex * graph_vertex)), 10)

    def predict(self, xpath):
        device = torch.device('cpu')
        #device = torch.device('cuda:0')
        np.set_printoptions(precision=6, suppress=True) #去掉科学技术法显示结果
        #self.__net = self.load("./model_plansql")
        self.__net = self.__net.to(device)

        xlist = []
        Y = []
        dataset = []
        with open(xpath, 'r') as file:
            for line in file:
                # 解析 JSON 格式数据
                data = json.loads(line)
                xdata = {}

                vertex_matrix = torch.tensor(data["node_matrix"], dtype=torch.float32)
                edge_matrix = torch.tensor(data["edge_matrix"], dtype=torch.float32)
                y = torch.tensor(data["y"], dtype=torch.float32)
                vertex_matrix, edge_matrix = padding_graph_matrcies(vertex_matrix, edge_matrix)
                xdata['Vnode'] = vertex_matrix.to(device)
                xdata['Vedge'] = edge_matrix.to(device)
                xlist.append(xdata)
                Y.append(y)
        cost_predss = np.empty(0)
        i = 0
        for item in xlist:
            self.__net.eval()
            cost_pred = self.__net(item, Y[i])
            # print(cost_pred)
            cost_pred = cost_pred.to(torch.float32).to(device)
            cost_pred = torch.squeeze(cost_pred)

            cost_predss = np.append(cost_predss, cost_pred.detach().cpu().numpy())
            i = i+1
        mse = np.mean((Y - cost_predss) ** 2)
        #print("mse",mse)
        e_mean, e_50 = print_qerror(cost_predss, Y, True)
        return e_mean, e_50
        #print_qerror(card_pred, cardlist, card_norm, True)

    def predict_increament(self, xpath):
        device = torch.device('cpu')
        #device = torch.device('cuda:0')
        np.set_printoptions(precision=6, suppress=True) #去掉科学技术法显示结果
        #self.__net = self.load("./model_plansql")
        self.__net = self.__net.to(device)

        xlist = []
        Y = []
        dataset = []
        with open(xpath, 'r') as file:
            for line in file:
                # 解析 JSON 格式数据
                data = json.loads(line)
                xdata = {}

                vertex_matrix = torch.tensor(data["code"], dtype=torch.float32)
                y = torch.tensor(data["y"], dtype=torch.float32)

                xlist.append(vertex_matrix)
                Y.append(y)


        cost_predss = np.empty(0)
        i = 0
        for item in xlist:
            self.__net.eval()
            cost_pred = self.__net(item)
            # print(cost_pred)
            cost_pred = cost_pred.to(torch.float32).to(device)
            cost_pred = torch.squeeze(cost_pred)

            cost_predss = np.append(cost_predss, cost_pred.detach().cpu().numpy())
            i = i+1
        mse = np.mean((Y - cost_predss) ** 2)
        #print("mse",mse)
        e_mean, e_50 = print_qerror(cost_predss, Y, True)
        return e_mean, e_50
        #print_qerror(card_pred, cardlist, card_norm, True)

def get_corr(ps, ls):  # unnormalised
    ps = np.array(ps)
    ls = np.array(ls)
    corr, _ = pearsonr(np.log(ps), np.log(ls))

    return corr

def print_qerror(preds_unnorm, labels_unnorm, prints=True):


    #print(preds_unnorm)
    #print(labels_unnorm)
    qerror = []
    for i in range(len(preds_unnorm)):
        if preds_unnorm[i] > float(labels_unnorm[i]):
            qerror.append(preds_unnorm[i] / float(labels_unnorm[i]))
        else:
            if float(preds_unnorm[i]) != 0:
                qerror.append(float(labels_unnorm[i]) / float(preds_unnorm[i]))
    e_max = np.max(qerror)
    #print(e_max)
    #qerror.remove(e_max)
    e_50, e_90 ,e_95, e_99= np.median(qerror), np.percentile(qerror, 90), np.percentile(qerror, 95),np.percentile(qerror, 99)
    e_max = np.max(qerror)
    e_mean = np.mean(qerror)

    # print(qerror)
    if prints:
        print("Mean: {}".format(e_mean))
        print("Median: {}".format(e_50))
        print("90th: {}".format(e_90))
        print("95th: {}".format(e_95))
        #print("99th: {}".format(e_99))
        print("max: {}".format(e_max))
        ##print("Median: {}".format(e_50))

    from sklearn.metrics import mean_squared_error
    val_mse = np.sqrt(mean_squared_error(preds_unnorm, labels_unnorm))
    print("val_mse", val_mse)

    #print(get_corr(preds_unnorm, labels_unnorm))
    res = {
        'q_median': e_50,
        'q_90': e_90,
        'q_mean': e_mean,
    }

    #corr = get_corr(preds_unnorm, labels_unnorm)
    #print("corr: {}".format(corr))
    return e_mean, e_50


def get_corr(ps, ls):  # unnormalised
    ps = np.array(ps)
    ls = np.array(ls)
    corr, _ = pearsonr(np.log(ps), np.log(ls))

    return corr
