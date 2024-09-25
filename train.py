import model_graph_old as model
import torch


class BaoTrainingException(Exception):
    pass


def train_and_save_model(fn, verbose=True, emphasize_experiments=0):


    reg = model.BaoRegression(have_cache_data=True, verbose=verbose)

    #reg.fit('./data/trainall.txt', "./data/testall.txt", fn)
    reg.fit('./data/tpch/graph/train_time.txt', "./data/tpch/graph/test_time.txt", fn)
    #reg.save(fn)

    return reg

if __name__ == "__main__":
    allocated = torch.cuda.memory_allocated()
    print(f"Current GPU memory allocated: {allocated} bytes")
    train_and_save_model("./model/model_tpch_time_4layer_datatpch")
    max_allocated = torch.cuda.max_memory_allocated()
    print(f"Max GPU memory allocated: {max_allocated} bytes")
    print("Model saved, attempting load...")
    #model_plansql.to('cuda:0') # 移动模型到cuda gp_max_packet_size

    reg = model.BaoRegression(have_cache_data=True)
    reg.load("./model/model_tpch_time_4layer_datatpch") #model_all_time_test_old_002 16863 s  tpch:6/2 tpcds:20/3  imdb:4/0.9
    #reg.load("./model/model_imdb_time_4layer_gpu")

    reg.predict("./data/tpch/graph/test_time.txt")
