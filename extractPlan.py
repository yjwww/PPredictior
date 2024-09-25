# 解析处理日志文件

# 1.去除无用行parseplantxt，2 全局替换无用元素，规范格式， 3   getsliceandplan生成log+plan格式
# 打开原始文件和新文件
def parseplantxt(infile, outfile):
    with open(infile, 'r') as f, open(outfile, 'w') as new_f:
        # 逐行读取原始文件
        for line in f:
            # 判断如果行中存在 '+' 或 'state'，则写入新文件
            if '+' in line or 'Interconnect State' in line:
                new_f.write(line)

def getsliceandplan(infile, outfile):
    # 解析内容
    with open(infile, 'r') as f, open(outfile, 'w') as new_f:
        # 逐行读取原始文件
        message = []
        plan = ""
        for line_number, line in enumerate(f, start=1):
            if "isSender" in line:
                if plan != "":
                    new_f.write(plan + "\n")
                    plan = ""
                if "(" in line:
                    tmp = line.split("(")
                    items = tmp[0].split()
                    kv_pairs = {items[i]: items[i + 1] for i in range(0, len(items), 2)}
                    kv_pairs["seg"] = tmp[1].split()[0]
                    kv_pairs["slice"] = tmp[1].split()[1]
                else:
                    items = line.split()
                    kv_pairs = {items[i]: items[i + 1] for i in range(0, len(items), 2)}
                print(kv_pairs)
                message.append(kv_pairs)
            else:
                # 保存执行计划
                plan += line.rstrip('\n') + " "
                # 保存message，晴空
                if message != []:
                    new_f.write(message.__str__() + "\n")
                    message = []

import yaml

def parseYaml(yamlpath):
    # 读取包含多个 YAML 数据块的 TXT 文件
    with open(yamlpath, "r") as file:
        # 逐行读取文件内容
        yaml_blocks = file.read().split('(1 row)')  # 使用 '---' 分割不同的 YAML 数据块

    # 解析每个 YAML 数据块
    for block in yaml_blocks:
        # 去除多余的空格和换行符
        # block = block.strip()
        if block:
            # 解析 YAML 格式的数据
            data = yaml.safe_load(block)
            # 处理解析后的数据，这里可以根据需要进行其他操作
            print(data)


if __name__ == '__main__':
    # parseplantxt('./data/tpch/plan/tpchplan.txt','./data/tpch/plan/tpchplan.txt')
    # getsliceandplan("./data/tpch/plan/tpchplan.txt",'./data/tpch/plan/tpchplan_end.txt')
    parseYaml('./data/incremental/plan2/part3.txt')