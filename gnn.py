import json

import numpy as np
import torch
import torch.nn as nn
from torch_geometric.nn import GATConv
import torch.nn.functional as F



feaitionpath = "./data/incremental/feature/feature10.txt"
class GNN(nn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim):
        super(GNN, self).__init__()

        self.output_dim = output_dim
        # Initialize layers
        self.W = nn.Parameter(torch.Tensor(input_dim, hidden_dim))
        self.W_self = nn.Parameter(torch.Tensor(input_dim, hidden_dim))
        self.W_output = nn.Parameter(torch.Tensor(hidden_dim, output_dim))
        
        # Initialize Chebyshev coefficients
        self.num_coeffs = min(2,int(hidden_dim/2)) # truncated expansion order
        self.cheby_coeffs = nn.Parameter(torch.Tensor(self.num_coeffs, 1, hidden_dim))
        
        # Initialize biases
        self.bias_hidden = nn.Parameter(torch.Tensor(hidden_dim))
        self.bias_output = nn.Parameter(torch.Tensor(output_dim))
        
        # Initialize activation function
        #self.activation = nn.ReLU()
        
        # Initialize normalization matrix
        self.identity = nn.Parameter(torch.eye(input_dim))

        self.reset_parameters()        

    def reset_parameters(self):
        # Initialize parameters
        nn.init.xavier_uniform_(self.W)
        nn.init.xavier_uniform_(self.W_self)
        nn.init.xavier_uniform_(self.W_output)
        nn.init.uniform_(self.cheby_coeffs, -1, 1)

        nn.init.normal_(self.bias_hidden, mean=0, std=0.1)
        nn.init.normal_(self.bias_output, mean=0, std=0.1)

    def encondingGraph(self, vertex_matrix, edge_matrix):
        #vertex_matrix, edge_matrix = self.padding_graph_matrcies(vertex_matrix, edge_matrix)

        # Extract vertex features
        V = vertex_matrix

        joined_columns = edge_matrix

        # Construct edge matrix
        E = torch.ones(joined_columns.size(0), joined_columns.size(0))
        E = torch.where(torch.eye(joined_columns.size(0)).bool(), E, E * 0.1)
        E += torch.eye(joined_columns.size(0))
        E /= E.sum(dim=0, keepdim=True)

        # Compute neighborhood matrix
        D = E.T @ V

        # Compute spectral filter
        cheby_inputs = [D]  # Initialize with neighborhood matrix D

        for i in range(1, self.num_coeffs):
            if len(cheby_inputs) < 2:
                cheby_inputs.append(2 * (E @ cheby_inputs[-1]))
            else:
                cheby_inputs.append(2 * (E @ cheby_inputs[-1]) - cheby_inputs[-2])

        cheby_coeffs = self.cheby_coeffs.view(self.num_coeffs, -1)
        cheby_outputs = torch.zeros_like(D)
        for coeff, input in zip(cheby_coeffs, cheby_inputs):
            coeff_expanded = coeff.unsqueeze(0).repeat(input.size(0), 1)
            cheby_outputs += coeff_expanded[:, :input.size(1)] * input

        bias_hidden_expanded = self.bias_hidden[:cheby_outputs.size(1)].unsqueeze(0)
        # V = self.activation(cheby_outputs + bias_hidden_expanded)
        V = cheby_outputs + bias_hidden_expanded

        # Compute output
        output = V @ self.W_output[:V.size(-1), :] + self.bias_output
        out = torch.max(output, dim=0).values
        return out


    def forward(self, item):

        #graphsCode = [self.encondingGraph(vertex_matrix, edge_matrix) for graph in graphs]
        #val = torch.tensor([item.cpu().detach().numpy() for item in graphsCode])
        graphsCode = self.encondingGraph(item["Vnode"], item["Vedge"])

        tensor_2d = graphsCode.view(1, -1)
        with open(feaitionpath, 'a') as file:
            for row in tensor_2d:
                for item in row:
                    file.write(str(item.item()) + ' ')
                file.write('\n')

        val = torch.tensor(graphsCode.cpu().detach().numpy())

        return val



class GraphAttentionLayer(nn.Module):
    def __init__(self, in_features, out_features):
        super(GraphAttentionLayer, self).__init__()
        self.in_features = in_features
        self.out_features = out_features
        self.dropout = 0.8
        self.alpha = 0.3

        self.W = nn.Parameter(torch.zeros(size=(in_features, out_features)))
        nn.init.xavier_uniform_(self.W.data, gain=1.414)

        self.a = nn.Parameter(torch.zeros(size=(2 * out_features, 1)))
        nn.init.xavier_uniform_(self.a.data, gain=1.414)

        self.leakyrelu = nn.LeakyReLU(self.alpha)
        self.dropout = nn.Dropout(self.dropout)

    def forward(self, h, adj):
        Wh = torch.mm(h, self.W)
        a_input = self._prepare_attention_input(Wh)
        e = self.leakyrelu(torch.matmul(a_input, self.a).squeeze(2))
        e = e * adj
        zero_vec = -9e15 * torch.ones_like(e)
        attention = torch.where(adj > 0, e, zero_vec)

        attention = F.softmax(attention, dim=1)
        attention = self.dropout(attention)

        h_prime = torch.matmul(attention, Wh)
        return F.elu(h_prime)

    def _prepare_attention_input(self, Wh):
        N = Wh.size(0)
        Wh_repeated_in_chunks = Wh.repeat_interleave(N, dim=0)
        Wh_repeated_alternating = Wh.repeat( N, 1)
        all_combinations_matrix = torch.cat([Wh_repeated_in_chunks, Wh_repeated_alternating], dim=1)
        return all_combinations_matrix.view(N, N, 2 * self.out_features)


class MultiLayerGraphAttention(nn.Module):
    def __init__(self, in_features, hidden_dim, out_features, num_layers):
        super(MultiLayerGraphAttention, self).__init__()
        self.gat_layers = nn.ModuleList()
        self.num_layers = num_layers

        self.gat_layers.append(GraphAttentionLayer(in_features, hidden_dim))
        for _ in range(num_layers - 2):
            self.gat_layers.append(GraphAttentionLayer(hidden_dim, hidden_dim))
        self.gat_layers.append(GraphAttentionLayer(hidden_dim, out_features))

    def forward(self, h, adj):
        for layer in self.gat_layers:
            h = layer(h, adj)
        return h


class GraphEncoder(nn.Module):
    def __init__(self, in_features, hidden_dim, out_features, num_layers):
        super(GraphEncoder, self).__init__()
        self.gat_model = MultiLayerGraphAttention(in_features, hidden_dim, out_features, num_layers)

    def forward(self, X, adj, y):
        graph_embedding = self.gat_model(X, adj)
        # Pooling operation to obtain a fixed-size vector representation of the graph
        pooled_embedding = torch.mean(graph_embedding, dim=0)  # You can use other pooling operations as well


        '''
        tensor_2d = pooled_embedding.view(1, -1)
        with open(feaitionpath, 'a') as file:
            for row in tensor_2d:
                data = {
                    "code": row.detach().numpy().tolist(),
                    "y": y.detach().numpy().tolist()
                }
                json.dump(data, file)
                file.write('\n')
        '''
        return pooled_embedding


# Example Usage
# Define your graph data: X (node features), adj (adjacency matrix)
# X should be of shape (num_nodes, num_features)
# adj should be of shape (num_nodes, num_nodes)
'''
if __name__ == '__main__':

    num_nodes = 10
    num_features = 32
    hidden_dim = 64
    out_features = 16
    num_layers = 3
    dropout = 0.5
    alpha = 0.2

    X = torch.randn(num_nodes, num_features)
    adj = torch.randn(num_nodes, num_nodes)

    encoder = GraphEncoder(num_features, hidden_dim, out_features, num_layers, dropout, alpha)
    graph_embedding = encoder(X, adj)
    print(graph_embedding.shape)  # Output shape: (out_features,)
'''