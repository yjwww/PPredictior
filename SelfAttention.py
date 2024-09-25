import torch
import torch.nn as nn
import numpy as np
import torch.nn.functional as F
from torch_geometric.data import Data, DataLoader


class SelfAttention(nn.Module):
    def __init__(self, in_channels):
        super(SelfAttention, self).__init__()
        self.pool = nn.AvgPool1d(512)
        self.fc1 = nn.Linear(768, 256)  # 第一层全连接层
        self.fc2 = nn.Linear(256, 16)  # 第二层全连接层

        self.fc3 = nn.Linear(150, 64)  # 第一层全连接层
        self.fc4 = nn.Linear(64, 16)  # 第二层全连接层

        self.relu = nn.ReLU()  #激活函数

    def encondingGraph(self, graph):
        num_vertices = 108
        num_features = 10
        model = VGAE(num_features=num_features, hidden_dim=16, latent_dim=16)
        model.load_state_dict(torch.load('VGAE_model_new.pth'))

        # 对新数据进行预测
        vertex_features, adjacency_matrix = graph.vertex_matrix, graph.edge_matrix
        normadjacency_matrix = (adjacency_matrix - adjacency_matrix.min()) / (
                adjacency_matrix.max() - adjacency_matrix.min())
        normvertex_features = (vertex_features - vertex_features.min()) / (
                vertex_features.max() - vertex_features.min())
        new_edge_index = normadjacency_matrix.nonzero().t()

        new_data = Data(x=normvertex_features, edge_index=new_edge_index)

        z, adj_recon, _, _ = model(new_data.x, new_data.edge_index)
        z = torch.mean(z, axis=0)
        return z

    def forward11(self, x):
        a,  new_feature, graphs = x

        #b = self.pool(new_feature)
        #b = b.view(-1, 100)
        b = self.fc1(new_feature)
        b = self.relu(b)
        b = self.fc2(b)
        b = b.reshape(new_feature.shape[0], 16)
        b = torch.nn.functional.normalize(b, p=2, dim=1)  # 归一化

        graphsCode = [self.encondingGraph(graph) for graph in graphs]
        val = torch.tensor([item.cpu().detach().numpy() for item in graphsCode])

        c = torch.nn.functional.normalize(val, p=2, dim=1)  # 归一化
        # embedding = torch.max(graph, dim=0)[0]

        device = torch.device("cuda:0")
        device = torch.device("cpu")

        d = torch.cat((a.to(device), b.to(device), c.to(device)), dim=1)
        return d

    def forward(self, x):
        a,  new_feature, graphs = x

        '''
        #b = self.pool(new_feature)
        #b = b.view(-1, 100)
        b = self.fc1(new_feature)
        b = self.relu(b)
        b = self.fc2(b)
        b = b.reshape(new_feature.shape[0], 16)
        b = torch.nn.functional.normalize(b, p=2, dim=1)  # 归一化
        '''

        c = self.fc3(graphs)
        c = self.relu(c)
        c = self.fc4(c)
        c = torch.nn.functional.normalize(c, p=2, dim=1)  # 归一化
        # embedding = torch.max(graph, dim=0)[0]


        device = torch.device("cuda:0")
        device = torch.device("cpu")

        d = torch.cat((a.to(device), c.to(device)), dim=1)
        return d


