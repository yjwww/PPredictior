import math
import os
import json
import time
import torch
#os.environ['KMP_DUPLICATE_LIB_OK'] = True

import numpy as np

mp_optype = {'Aggregate': 0, 'Nested Loop': 1, 'Index Scan': 2, 'Hash Join': 3, 'Seq Scan': 4, 'Hash': 5, 'Update': 6}


distrubute_policy = {"hash":"1000", "randonly":"0100","replicated":"0010","range":"0001"}
tpch_tables = {"part":{"id":1,"records":[22288,22240,22229,22078,22223,22389,22103,22185,22265],"distribute":1000},
                "supplier":{"id":2,"records":[1144,1127,1141,1081,1090,1067,1086,1140,1123],"distribute":1000},
               "partsupp":{"id":3,"records":[91520,90160,91360,86480,87200,85360,86880,91200,89840],"distribute":1000},
               "customer":{"id":4,"records":[16675,16678,16744,16592,16648,16755,16630,16589,16689],"distribute":1000},
               "orders":{"id":5,"records":[166260,166371,166628,166758,167010,166444,166148,166548,167833],"distribute":1000},
               "lineitem":{"id":6,"records":[857015,0,643287,0,1500000,214621,429070,1071394,1285828],"distribute":1000},
               "nation":{"id":7,"records":[25,25,25,25,25,25,25,25,25],"distribute":10},
               "region":{"id":8,"records":[5,5,5,5,5,5,5,5,5],"distribute":10},
               "root":{"id":0,"records":[0,0,0,0,0,0,0,0,0],"distribute":0}}

tpcds_tables = {
                "catalog_sales":{"id":1,"records":[160066,160083,160066,160261,160280,160005,150809,161083,159895],"distribute":1000},
               "catalog_returns":{"id":2,"records":[15892,15939,15996,16344,16133,15916,15793,16135,15919],"distribute":1000},
               "store_sales":{"id":3,"records":[319612,319972,320403,319714,320261,319351,320120,320506,320465],"distribute":1000},
               "store_returns":{"id":4,"records":[31850, 31812, 32257, 31782, 31907, 31968, 31917, 31897, 32124],"distribute":1000},
                "web_sales":{"id":5,"records":[80037, 79521, 79834, 79909, 80298, 79978, 80114, 79824, 79869],"distribute":1000},
               "web_returns":{"id":6,"records":[8099, 8001, 7889, 7997, 7906, 8001, 7957, 7932, 7981],"distribute":1000},
               "inventory":{"id":7,"records":[1304746, 1304914, 1305343, 1303250, 1303195, 1305112, 1306278, 1305075, 1307087],"distribute":10},
               "call_center":{"id":8,"records":[1,0, 1,0, 1, 0,1, 1, 1],"distribute":10},
                "catalog_page":{"id":9,"records":[1330, 1337, 1326, 1273, 1264, 1278, 1266, 1329, 1315],"distribute":1000},
                "customer":{"id":10,"records":[11087, 11031, 11171, 10961, 11127, 11213, 11069, 11116, 11225],"distribute":1000},
                "customer_address":{"id":11,"records":[5572, 5519, 5670, 5499, 5550, 5555, 5480, 5553, 5602],"distribute":1000},
                "customer_demographics":{"id":12,"records":[213349, 213496, 213893, 213171, 213162, 213085, 213352, 213264, 214028],"distribute":1000},
                "date_dim":{"id":13,"records":[8012, 8087, 8124, 8018, 8284, 8244, 8014, 8203, 8063],"distribute":1000},
                "household_demographics":{"id":14,"records":[823, 778, 862, 767, 785, 776, 772, 841, 796],"distribute":1000},
                "income_band":{"id":15,"records":[2, 1, 3,0, 3, 1, 5, 3, 2],"distribute":1000},
                "item":{"id":16,"records":[2019, 2014, 2037, 2001, 1992, 1965, 1970, 2026, 1976],"distribute":1000},
                "promotion":{"id":17,"records":[33, 38, 28, 32, 33, 34, 29, 37, 36],"distribute":1000},
                "reason":{"id":18,"records":[3, 3, 5,0, 5, 2, 6, 3, 8],"distribute":1000},
                "ship_mode":{"id":19,"records":[2, 1, 3,0, 3, 1, 5, 3, 2],"distribute":1000},
                "store":{"id":20,"records":[2,0, 3,0, 1, 1, 1, 2, 2],"distribute":1000},
                "time_dim":{"id":21,"records":[9666, 9534, 9688, 9529, 9571, 9623, 9571, 9558, 9660],"distribute":1000},
                "warehouse":{"id":22,"records":[1,0, 1,0, 1,0, 1,0, 1],"distribute":1000},
                "web_page":{"id":23,"records":[8, 7, 7, 3, 9, 3, 7, 6, 10],"distribute":1000},
                "web_site":{"id":24,"records":[2,2,4,0, 5,2,5,3,7],"distribute":1000},
                "dbgen_version":{"id":25,"records":[],"distribute":1000},
               "root":{"id":0,"records":[0,0,0,0,0,0,0,0,0],"distribute":0}}

imdb_tables = {
                "aka_name":{"id":1,"records":[299994, 301092, 301527, 300399, 300351, 300042, 301047, 298791, 300786],"distribute":1000},
               "aka_title":{"id":2,"records":[120588, 120918, 120291, 119985, 120075, 121146, 119547, 120894, 120972],"distribute":1000},
               "cast_info":{"id":3,"records":[214413, 214901, 215252, 214759, 214042, 214416, 214588, 214571, 214650],"distribute":1000},
               "char_name":{"id":4,"records":[348009, 349165, 350181, 348686, 348324, 348277, 349000, 348763, 349934],"distribute":1000},
                "comp_cast_type":{"id":5,"records":[1,0,0,0,1,0,0,1,1],"distribute":1000},
               "company_name":{"id":6,"records":[26135, 26085, 26083, 25925, 26153, 26246, 26041, 26124, 26205],"distribute":1000},
               "company_type":{"id":7,"records":[1,0,0,0,1,0,0,1,1],"distribute":10},
               "complete_cast":{"id":8,"records":[14973, 14980, 15114, 14946, 15012, 15061, 14986, 14966, 15048],"distribute":1000},
                "info_type":{"id":9,"records":[18, 13, 10, 4, 15, 9, 13, 16, 15],"distribute":1000},
                "keyword":{"id":10,"records":[14877, 14897, 15032, 14831, 14919, 14949, 14870, 14854, 14941],"distribute":1000},
                "kind_type":{"id":11,"records":[1, 0,1,0, 1, 1, 1, 1, 1],"distribute":1000},
                "link_type":{"id":12,"records":[2, 1, 3,0, 2, 1, 4, 3, 2],"distribute":1000},
                "movie_companies":{"id":13,"records":[289399, 290239, 290594, 289630, 289682, 289290, 289729, 289926, 290640],"distribute":1000},
                "movie_info":{"id":14,"records":[1634453, 1632623, 1632762, 1634712, 1633425, 1632865, 1634448, 1632746, 1634814],"distribute":1000},
                "movie_info_idx":{"id":15,"records":[153156, 153619, 153921, 153452, 153321, 153034, 153110, 152747, 153675],"distribute":1000},
                "movie_keyword":{"id":16,"records":[501907, 503065, 503477, 502163, 502245, 501449, 502905, 502485, 504234],"distribute":1000},
                "movie_link":{"id":17,"records":[3333, 3335, 3418, 3301, 3306, 3316, 3308, 3348, 3332],"distribute":1000},
                "name":{"id":18,"records":[462240, 463192, 464155, 462660, 462699, 462129, 463285, 462736, 464395],"distribute":1000},
                "person_info":{"id":19,"records":[328384, 329514, 330372, 328924, 328907, 328587, 329444, 329192, 330340],"distribute":1000},
                "role_type":{"id":20,"records":[2,0, 3,0, 1, 1, 1, 2, 2],"distribute":1000},
                "title":{"id":21,"records":[280400, 281115, 281679, 280711, 280720, 280314, 280758, 281026, 281589],"distribute":1000},
               "root":{"id":0,"records":[0,0,0,0,0,0,0,0,0],"distribute":0}}

tpchtables = ["part","supplier", "partsupp","customer", "orders", "lineitem", "nation", "region"]

tpcdstables = ["catalog_sales", "catalog_returns", "store_sales", "store_returns", "web_sales", "web_returns", "inventory","call_center",
               "catalog_page","customer","customer_address","customer_demographics","date_dim","household_demographics","income_band",
               "item","promotion","reason","ship_mode","store","time_dim","warehouse","web_page","web_site","dbgen_version"]

imdbtables = ["aka_name","aka_title","cast_info","char_name","comp_cast_type","company_name","company_type","complete_cast","info_type",
              "keyword","kind_type","link_type","movie_companies","movie_info","movie_info_idx","movie_keyword","movie_link",
              "name","person_info","role_type","title"]
master_host = [11,111,11,11] # CPU cores, memory size, disk pool size, and network bandwidth.
seg_host = {"231":[11,111,11,11],"233":[11,111,11,11],"235":[11,111,11,11]}
operator = [ "Seq Scan","Hash","Hash Join","Aggregate", "Result","Sort","Nested Loop"] # greenplum's operators
motion = ["Redistribute Motion", "Broadcast Motion"]
# shared_buffers , work_mem , gp_max_packet_size, max_connections , random_page_cost and seq_page_cost
parameter = {0:[1,1,1,1,1,1],1:[1,1,1,1,1,1],2:[1,1,1,1,1,1],3:[1,1,1,1,1,1]} # segment_id:[paraemter_value]
# actual runtime:  actuall executed (training data) / estimated by our model
# operators in the same plan can have data conflicts (parallel)
def compute_cost(node):
    return (float(node["Total Cost"]) - float(node["Startup Cost"])) / 1e6


def compute_time(node):
    # return float(node["Actual Total Time"]) - float(node["Actual Startup Time"])
    return float(node["Actual Total Time"])  # mechanism within pg


def get_used_tables(node):
    tables = []

    stack = [node]
    while stack != []:
        parent = stack.pop(0)

        if "Relation Name" in parent:
            tables.append(parent["Relation Name"])

        if "Plans" in parent:
            for n in parent["Plans"]:
                stack.append(n)

    return tables


# 执行计划中用到的表
def get_tables(tree):
    tables = []

    def recurse(n):
        if "Relation Name" in n:
            tables.append(n["Relation Name"])

        if "Plans" in n:
            for child in n["Plans"]:
                recurse(child)

    if "Plan" in tree:
        recurse(tree["Plan"])
    return list(set(tables))



def get_nodes_from_tables(tables, type):
    # segment_table: 1.属于哪个表（表的属性） 2.属于哪个服务器（服务器的属性） 3.segment的配置 4。分区表的属性（分区方法，行数）

    n = 18
    nodes_matrix =  {}

    Vtable_root = type.get("root").get("id")
    VrecordCount_root = type.get("root").get("records")[0]
    Vdistribute_root = type.get("root").get("distribute")
    root_matrix = [0, Vtable_root,VrecordCount_root, Vdistribute_root]+ [0] * len(operator) + master_host
    # 添加root节
    nodes_matrix[0] = root_matrix

    # 添加segment节点
    for table in tables:
        for i in range(1, n + 1):
            Vtable = type.get(table).get("id")
            if i >= n-8:
                VrecordCount = type.get(table).get("records")[0]
            else:
                VrecordCount = type.get(table).get("records")[i-1]
            Vdistribute = type.get(table).get("distribute")

            if i < 4:
                Yhost = seg_host.get("231")
            if i > 6:
                Yhost = seg_host.get("235")
            else:
                Yhost = seg_host.get("233")

            node_id = Vtable * 10 + i
            operators = [0] * len(operator)
            node_matrix = [Vtable, i, VrecordCount, Vdistribute]+ operators + Yhost
            nodes_matrix[node_id] = node_matrix

    return nodes_matrix


def get_edge_extract_plan(tree,  edge_matrix, nodes_matrix, tables, type):
    Y = tree["Execution Time"]
    Y1 = tree["Statement statistics"]["Memory used"]

    nodes_list = list(nodes_matrix.keys())
    topology = ["001","010","100"] # 备份、同一个表、同一服务器
    adjacency_matrix = []
    num = 18
    # 静态关系
    for node1 in nodes_matrix.keys():
        index1 = nodes_list.index(node1)
        tableid1 = math.floor(node1 / 10)
        numid1 = node1 % 10
        for node2 in nodes_matrix.keys():
            index2 = nodes_list.index(node2)
            if node1 != node2 and node1 != 0 and node2 != 0:
                tableid2 = math.floor(node2 / 10)
                numid2 = node2 % 10
                if numid1 == numid2:
                    edge_matrix[index1][index2] = 1

    # 通过执行计划构建动态关系
    if tree["Plan"]["Node Type"] == "Gather Motion":
        Outputlist = tree["Plan"]["Output"]
        AllstatList = tree["Plan"]["Plans"][0]["Allstat"]

        for table in tables:
            Vtable = type.get(table).get("id")
            if table in Outputlist[0]:
                index0 = nodes_list.index(0)
                for i in range(num):
                    index3 = nodes_list.index(Vtable*10+i+1)
                    edge_matrix[index0][index3] = 1
                    for stat in AllstatList:
                        if stat["Segment index"] == i:
                            edge_matrix[index0][index3] = stat["Tuples"]

    def recurse(n):
        # 添加node操作
        print(n)
        if (n["Node Type"] in operator) and ("Allstat" in n) and ("Output" in n) and (n["Allstat"] is not None):
            Outputlist = n["Output"]
            AllstatList = n["Allstat"]
            max_index = max(AllstatList, key=lambda x: float(x['Time To First Result']) + float(x['Time To Total Result']))['Segment index']
            tuples = max(AllstatList, key=lambda x: float(x['Time To First Result']) + float(x['Time To Total Result']))['Time To Total Result'] #todo
            for table in tables:
                for output in Outputlist:
                    if table in output:
                        Vtable = type.get(table).get("id")
                        operator_index = operator.index(n["Node Type"])
                        nodes_matrix[Vtable*10 + max_index+1][operator_index+4] = float(tuples) + nodes_matrix[Vtable*10 + max_index+1][operator_index+4]

        # 添加edge数据传输
        if n["Node Type"] == "Redistribute Motion":
            if ("Hash Key" in n) and ("Allstat" in n) and (n["Allstat"] is not None):
                print(n["Hash Key"])
                table = n["Hash Key"].split(".")[0]
                if "_" in table or "(" in table:
                    for tablename in tpchtables:
                        if tablename in table:
                            table = tablename
                            break

                if type.get(table) != None:

                    Vtable = type.get(table).get("id")
                    AllstatList = n["Allstat"]
                    for index1, stat1 in enumerate(AllstatList):
                        if Vtable * 10 + index1 + 1 in nodes_list:

                            index4 = nodes_list.index(Vtable * 10 + index1 + 1)
                            for index2, stat2 in enumerate(AllstatList):
                                index5 = nodes_list.index(Vtable * 10 + index2 + 1)
                                if index2 > index1:
                                    edge_matrix[index4][index5] = stat1["Tuples"] + stat2["Tuples"] + edge_matrix[index4][index5]

        if n["Node Type"] == "Broadcast Motion":
            child = n["Plans"]
            if ("Relation Name" in child) and ("Allstat" in n) and (n["Allstat"] is not None):
                broadtable = child["Relation Name"]
                Vtable = type.get(broadtable).get("id")
                AllstatList = n["Allstat"]

                for index1, stat1 in enumerate(AllstatList):
                    index4 = nodes_list.index(Vtable * 10 + index1 + 1)
                    for index2, stat2 in enumerate(AllstatList):
                        index5 = nodes_list.index(Vtable * 10 + index2 + 1)
                        if index2 > index1:
                            edge_matrix[index4][index5] = stat1["Tuples"] + stat2["Tuples"] + edge_matrix[index4][
                                index5]

        if "Plans" in n:
            for child in n["Plans"]:
                recurse(child)
    if "Plan" in tree:
        for child in tree["Plan"]["Plans"]:
            recurse(child)

    return  nodes_matrix, edge_matrix, Y, Y1

def init_adjacant_matrix(size):
        return np.array([[0]*size]*size)

def traverse_tree(node, n):
    if isinstance(node, dict):
        print("Node:", node.get("Node Type"))  # 打印当前节点的名称（假设节点有"name"属性）
        children = node.get("Plans")  # 获取当前节点的子节点列表



        if children["Total Cost"] == n["Total Cost"] and children["Actual Total Time"] == n["Actual Total Time"] and \
                        node["Node Type"] == "Hash Join":
                cond = node["Hash Cond"]  # (orders.o_custkey = customer.c_custkey)
                condtable = cond.replace(" ", "").split("=")[1].split(".")[0]
                return condtable

        if "Plans" in children:
            traverse_tree(children)  # 对每个子节点递归调用 traverse_tree
    elif isinstance(node, list):
        for item in node:
            traverse_tree(item)  # 对列表中的每个元素递归调用 traverse_tree



def generate_graph(planpath, graphpath, type):

    node_matrix = []
    edge_matrix = []

    trees = parseYaml(planpath)
    for tree in trees:
        # 使用表构建node
        tables = get_tables(tree)
        # 每个分区表提取特征为node
        node_matrix = get_nodes_from_tables(tables, type)

        edge_matrix = init_adjacant_matrix(len(node_matrix))

        # 通过执行计划构建边关系 邻接矩阵和边特征,标签y
        nodes_matrix_dict, edge_matrix, Y ,Y1 = get_edge_extract_plan(tree, edge_matrix, node_matrix, tables, type)
        # 后处理
        for i in range(len(nodes_matrix_dict)):
            for j in range(len(nodes_matrix_dict)):
                if edge_matrix[i][j] != 0:
                    edge_matrix[j][i] = edge_matrix[i][j]
        #edge_matrix = torch.tensor(edge_matrix, dtype=torch.float32)

        nodes_matrix = []
        for key in nodes_matrix_dict.keys():
            nodes_matrix.append(nodes_matrix_dict.get(key))
        #nodes_matrix = torch.tensor(nodes_matrix, dtype=torch.float32)

        #Y = torch.tensor(Y, dtype=torch.float32)
        #Y1 = torch.tensor(Y1, dtype=torch.float32)
        # 保存到文件json格式
        data = {
           "node_matrix": nodes_matrix,
           "edge_matrix": edge_matrix.tolist(),
           "y": Y,
           "y1": Y1
        }

        print(data)
        with open(graphpath, "a") as file:
            json.dump(data, file)
            file.write("\n")

def output_file():
    from performance_graphembedding_checkpoint import data_path
    start_time = time.time()
    num_graphs = 3000
    # notation: oid may be unused.
    for wid in range(num_graphs):
        st = time.time()
        vmatrix, ematrix, mergematrix, oid, min_timestamp = generate_graph(wid, data_path)
        # optional: merge
        # vmatrix, ematrix = merge.mergegraph_main(mergematrix, ematrix, vmatrix)
        print("[graph {}]".format(wid),
              "time:{}; #-vertex:{}, #-edge:{}".format(time.time() - st, len(vmatrix), len(ematrix)))

        with open(os.path.join(data_path, "graph", "sample-plan-" + str(wid) + ".content"), "w") as wf:
            for v in vmatrix:
                wf.write(str(v[0]) + "\t" + str(v[1]) + "\t" + str(v[2]) + "\t" + str(v[3]) + "\t" + str(v[4]) + "\n")
        with open(os.path.join(data_path, "graph", "sample-plan-" + str(wid) + ".cites"), "w") as wf:
            for e in ematrix:
                wf.write(str(e[0]) + "\t" + str(e[1]) + "\t" + str(e[2]) + "\n")

    end_time = time.time()
    print("Total Time:{}".format(end_time - start_time))


def openreadtxt(file_name):
    trees = []
    with open(file_name, "r", encoding='utf-8') as f:  #打开文本
        data = f.read()   #读取文本
        trees = data.split(';')
        print(len(trees))
    return trees

import yaml
def parseYaml(yamlpath):
    # 读取包含多个 YAML 数据块的 TXT 文件
    with open(yamlpath, "r") as file:
        # 逐行读取文件内容
        yaml_blocks = file.read().split('(1 row)')  # 使用 '---' 分割不同的 YAML 数据块

    trees = []
    # 解析每个 YAML 数据块
    for block in yaml_blocks:
        # 去除多余的空格和换行符
        # block = block.strip()
        if block:
            # 解析 YAML 格式的数据
            #print(block)
            data = yaml.safe_load(block)
            trees.append(data)
            # 处理解析后的数据，这里可以根据需要进行其他操作
            #print(data)
    return trees

def loadjson(jsonpath):
    plans = json.load(jsonpath)

if __name__ == '__main__':
    trees = generate_graph("./data/compare/tpch1.5.10.20/tpch20plan.txt", "./data/compare/tpch1.5.10.20/graph/tpch20plan_time.txt", tpch_tables)

