import os
import sys
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(BASE_DIR)
import numpy as np
import torch
import torch.nn as nn

#from SelfAttention  import SelfAttention
from gnn import GraphEncoder


class BaoNet(nn.Module):
    def __init__(self,  selection_graph_vertex, hidden_dim):
        #in_channels = 14
        super(BaoNet, self).__init__()

        self.__cuda = True
        self.__selection_graph_vertex = selection_graph_vertex
        self.__hidden_dim = hidden_dim
        self.Cnn = GraphEncoder(13, 64, 72, 4) #todo
        self.cn1 = nn.Linear(72, 36)
        self.cn2 = nn.Linear(36, 1)
        self.Rule = nn.LeakyReLU()

        self.tree_conv = nn.Sequential(

            #GNN(selection_graph_vertex, hidden_dim, selection_graph_vertex),
            GraphEncoder(selection_graph_vertex, hidden_dim, 72, 4),#todo
            # SelfAttention(32),
            #e2e_model(32,8)
            #CBAM(32),
            nn.Linear(72, 16),
            nn.LeakyReLU(),
            nn.Linear(16, 1),
            #nn.Sigmoid()
            #nn.Softmax(dim=1)
        )

    def in_channels(self):
        return self.__in_channels

    def forward(self, item, y):
        #graphs = [x['graph'] for x in graphdata]
        x = self.Cnn(item["Vnode"], item["Vedge"], y)
        x = self.cn1(x)
        x = self.Rule(x)
        x = self.cn2(x)

        device = torch.device("cuda:0")
        return x

    def cuda(self):
        self.__cuda = True
        return super().cuda()


class BaoNet_inctemental(nn.Module):
    def __init__(self,  selection_graph_vertex, hidden_dim):
        #in_channels = 14
        super(BaoNet_inctemental, self).__init__()

        self.__cuda = True
        self.__selection_graph_vertex = selection_graph_vertex
        self.__hidden_dim = hidden_dim
        self.Cnn = GraphEncoder(13, 64, 72, 4)  # todo
        self.cn1 = nn.Linear(72, 36)
        self.cn2 = nn.Linear(36, 1)
        self.Rule = nn.LeakyReLU()

        self.tree_conv = nn.Sequential(

            #GNN(selection_graph_vertex, hidden_dim, selection_graph_vertex),
            GraphEncoder(selection_graph_vertex, hidden_dim, 72, 4),
            # SelfAttention(32),
            #e2e_model(32,8)
            #CBAM(32),
            nn.Linear(72, 16),
            nn.LeakyReLU(),
            nn.Linear(16, 1),
            #nn.Sigmoid()
            #nn.Softmax(dim=1)
        )

    def in_channels(self):
        return self.__in_channels

    def forward(self, item):
        #graphs = [x['graph'] for x in graphdata]
        #x = self.Cnn(item["Vnode"], item["Vedge"])
        x = self.cn1(item)
        x = self.Rule(x)
        x = self.cn2(x)

        device = torch.device("cuda:0")
        return x

    def cuda(self):
        self.__cuda = True
        return super().cuda()
