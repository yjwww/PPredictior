import model_graph_old as model
import torch


class BaoTrainingException(Exception):
    pass


def train_and_save_model(fn, verbose=True, emphasize_experiments=0):


    reg = model.BaoRegression(have_cache_data=True, verbose=verbose)

    reg.load("./model/model_imdb_time_4layer_gpu")
    reg.incremental_train("./data/incremental/graph/train000.txt", "./data/incremental/graph/part0.txt", fn)

    #reg.save(fn)

    return reg

if __name__ == "__main__":
    allocated = torch.cuda.memory_allocated()
    print(f"Current GPU memory allocated: {allocated} bytes")
    train_and_save_model("./model/model_incremental_feature_test")
    max_allocated = torch.cuda.max_memory_allocated()
    print(f"Max GPU memory allocated: {max_allocated} bytes")

    print("Incremental training, attempting load...")
    # model_plansql.to('cuda:0') # 移动模型到cuda

    reg = model.BaoRegression(have_cache_data=True, verbose=True)
    #reg.load("./model/model_incremental_feature0andtrain")
    #reg.load("./model/model_imdb_time_4layer_gpu")

    #reg.incremental_train("./data/incremental/feature/feation000.txt", "./data/incremental/feature/feature1.txt", "./model/model_incremental_feature1")
    #10-2000 20-1000 30- -0.002 25-2000 8-4000
