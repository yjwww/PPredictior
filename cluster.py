import numpy
from sklearn.cluster import DBSCAN
import numpy as np
from scipy.spatial import distance


class DynamicDBSCANClustering:
    def __init__(self, eps=0.5, min_samples=5, merge_threshold=0.1):
        self.eps = eps
        self.min_samples = min_samples
        self.merge_threshold = merge_threshold
        self.clusters = []
        self.labels = []
        self.data = []
        self.new_data_num = 0

    def initCluster(self, datas):
        data = []
        for new_data_point in datas:
            # 添加新数据点到数据集中
            self.data.append(new_data_point)

            # 使用DBSCAN进行聚类
            dbscan = DBSCAN(eps=self.eps, min_samples=self.min_samples)
            dbscan.fit(data)

            # 获取聚类标签
            cluster_labels = dbscan.labels_

            # 计算聚类的数量
            unique_labels = np.unique(cluster_labels)

            # 如果聚类数量超过10个，则进行合并操作
            if len(unique_labels) > 10:
                # 计算聚类中心
                cluster_centers = []
                for label in unique_labels:
                    cluster_points = data[cluster_labels == label]
                    cluster_center = np.mean(cluster_points, axis=0)
                    cluster_centers.append(cluster_center)

                # 计算聚类中心之间的距离
                distances = distance.cdist(cluster_centers, cluster_centers)

                # 找到距离小于合并阈值的聚类
                merge_indices = np.where(distances < self.merge_threshold)

                # 合并聚类
                merged_labels = np.copy(cluster_labels)
                for i, j in zip(merge_indices[0], merge_indices[1]):
                    if i != j:
                        merged_labels[cluster_labels == unique_labels[j]] = unique_labels[i]

                self.labels = merged_labels
            else:
                self.labels = cluster_labels

            # 更新聚类信息
            self.clusters.append(data)

        print(self.labels)
        return self.labels

    def fit_stream(self, new_data_point):
            self.new_data_num += 1
            data = []
            # 添加新数据点到数据集中
            data.append(new_data_point)

            # 使用DBSCAN进行聚类
            dbscan = DBSCAN(eps=self.eps, min_samples=self.min_samples)
            dbscan.fit(data)

            # 获取聚类标签
            cluster_labels = dbscan.labels_

            # 计算聚类的数量
            unique_labels = np.unique(cluster_labels)

            # 如果聚类数量超过10个，则进行合并操作
            if len(unique_labels) > 10:
                # 计算聚类中心
                cluster_centers = []
                for label in unique_labels:
                    cluster_points = data[cluster_labels == label]
                    cluster_center = np.mean(cluster_points, axis=0)
                    cluster_centers.append(cluster_center)

                # 计算聚类中心之间的距离
                distances = distance.cdist(cluster_centers, cluster_centers)

                # 找到距离小于合并阈值的聚类
                merge_indices = np.where(distances < self.merge_threshold)

                # 合并聚类
                merged_labels = np.copy(cluster_labels)
                for i, j in zip(merge_indices[0], merge_indices[1]):
                    if i != j:
                        merged_labels[cluster_labels == unique_labels[j]] = unique_labels[i]

                self.labels = merged_labels
            else:
                self.labels = cluster_labels

            # 更新聚类信息
            self.clusters.append(data)

            print(self.labels)
            return self.labels

import json

# 定义函数来读取文件并提取特定键的值
def read_and_extract_values(file_path, key):
    values = []
    with open(file_path, 'r') as f:
        for line in f:
            data = json.loads(line)  # 解析每行的 JSON 数据
            value = data.get(key)  # 获取指定键的值
            if value is not None:
                values.append(np.mean(np.array(value), axis=0))  # 将值添加到列表中
    return np.stack(values)

def getSampleDat(file_path, save_file):
    X = read_and_extract_values(file_path,"code")
    from sklearn.cluster import DBSCAN
    from sklearn.preprocessing import StandardScaler

    # 假设你有一个名为 X 的数组，其中包含你的所有向量，维度为 (2000, 72)
    # 先进行数据标准化
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    # 设置DBSCAN的参数
    eps = 0.5  # 邻域半径
    min_samples = 5  # 最小样本数

    dbscan = DBSCAN(eps=eps, min_samples=min_samples)
    clusters = dbscan.fit_predict(X_scaled)

    # 检查聚类的结果
    num_clusters = len(set(clusters)) - (1 if -1 in clusters else 0)  # 获得聚类的数量
    print(f"总共有 {num_clusters} 个簇")

    import numpy as np

    # 选择1000个距离簇中心最近的向量
    num_samples_per_cluster = 1000 // num_clusters  # 每个簇应选择的样本数

    selected_indices = []
    for cluster_label in range(num_clusters):
        if cluster_label == -1:  # 如果有噪声点，跳过
            continue

        # 找出当前簇的所有向量
        cluster_indices = np.where(clusters == cluster_label)[0]
        cluster_vectors = X_scaled[cluster_indices]

        # 计算当前簇的中心
        cluster_center = np.mean(cluster_vectors, axis=0)

        # 计算每个向量到中心的距离
        distances_to_center = np.linalg.norm(cluster_vectors - cluster_center, axis=1)

        # 根据距离排序，选择最近的样本
        closest_indices = cluster_indices[np.argsort(distances_to_center)[:num_samples_per_cluster]]
        selected_indices.extend(closest_indices)

    selected_vectors = X[selected_indices]

    # 指定保存文件的路径和文件名
    #save_file = 'selected_vectors.txt'

    # 将向量保存到文本文件
    with open(save_file, 'w') as f:
        for vector in selected_vectors:
            vector_str = ' '.join(map(str, vector))
            f.write(vector_str + '\n')

    print(f"已将选择的向量保存到 {save_file}")

from collections import Counter
def getSampledatakmeans(file_path, save_path):
    import numpy as np
    from sklearn.cluster import KMeans

    # 生成示例数据，这里假设已经有了2000个72维的向量
    vectors =  read_and_extract_values(file_path,"node_matrix")
    num_vectors = len(vectors)

    # 定义DBSCAN的参数
    eps = 10.8  # 邻域半径
    min_samples = 5  # 最小样本数

    # 使用DBSCAN进行聚类
    dbscan = DBSCAN(eps=eps, min_samples=min_samples)
    cluster_indices = dbscan.fit_predict(vectors)

    # 统计每个簇的向量数量
    counter = Counter(cluster_indices)

    # 筛选出每个簇中的向量
    selected_vectors = []
    total_selected = 0
    flag = 0
    for cluster_index, count in counter.items():

        if cluster_index == -1:
            if 1000 >= num_vectors - count:
                flag = 1
            continue  # 跳过噪声点

        cluster_vectors = vectors[cluster_indices == cluster_index]
        if flag == 1:
            num_to_select = count
        else:
            num_to_select = min(int(1000 * count / num_vectors), count)  # 按比例选取向量
        selected_indices = np.random.choice(cluster_vectors.shape[0], num_to_select, replace=False)
        selected_vectors.extend(cluster_vectors[selected_indices])
        total_selected += num_to_select

        if total_selected >= 1000:
            break

    selected_vectors = np.array(selected_vectors)

    with open(file_path, 'r') as f, open(save_path, 'w') as output_file:
        for line in f:
            data = json.loads(line)  # 解析每行的 JSON 数据
            value = data.get("node_matrix")  # 获取指定键的值
            item = {}
            if any(np.array_equal(np.mean(np.array(value),axis=0), arr) for arr in selected_vectors):
                #保存到文件
                json.dump(data, output_file)
                output_file.write('\n')

    # 打印选取的向量数量
    print(f"Selected {len(selected_vectors)} vectors out of {num_vectors} total vectors.")


import collections


def select_largest_clusters(data, n):
    # 统计每个子集的数据量
    clusters = collections.Counter(data)

    # 对数据量进行排序，选取前面的数据量最多的子集
    largest_clusters = sorted(clusters.items(), key=lambda x: x[1], reverse=True)[:n]

    # 返回选取出的子集
    return [x[0] for x in largest_clusters]

def main():
    # 创建动态聚类对象
    dc = DynamicDBSCANClustering(eps=0.5, min_samples=5, merge_threshold=0.1)


    # 初始化聚类
    X_init = np.random.randn(100, 2)
    y = dc.initCluster(X_init)
    print(y)

    # 动态接收新数据流
    for i in range(10000):
        X_new = np.random.randn(1, 2)
        dc.fit_stream(X_new)



if __name__ == '__main__':
    #getSampleDat("./data/incremental/feature/train.txt", "./data/incremental/feature/train1000.txt")
    getSampledatakmeans("./data/incremental/graph/train1.txt", "./data/incremental/graph/train1.txt")


