import os
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
import collections
import torch.utils.data as Data
import random
from torch.autograd import Variable
import json

_index = "22269496"
seq_file = "D:/test/bil/data/22269496.csv"
seq = []
label = []
with open(seq_file, "r") as f:
    for i in f.readlines():
        seq.append(i[:-3].split(","))
        label.append(int(i[-2]))
modelIndex = 'model22269496.pt'

# 分词
seq_cut = []
seq_cut_list = []
for i in seq:
    cut_res = i
    seq_cut = seq_cut + cut_res
    seq_cut_list.append(cut_res)
word2num = sorted(collections.Counter(seq_cut).items(), key=lambda item: item[1], reverse=True)
# 所有词
vocab = list(set(seq_cut))
# 词对应索引
word2index = {w[0]: i + 1 for i, w in enumerate(word2num)}
word2index["PAD"] = 0
# 词典大小
vocab_size = len(word2index)
seq_size = len(seq)
seq_length = max([len(i) for i in seq_cut_list])
batch_size = 3
embedding_size = 3
num_classes = 2
n_hidden = 5


def seed_everything(seed_value):  # 固定随机数种子
    random.seed(seed_value)
    np.random.seed(seed_value)
    torch.manual_seed(seed_value)
    os.environ['PYTHONHASHSEED'] = str(seed_value)

    if torch.cuda.is_available():
        torch.cuda.manual_seed(seed_value)
        torch.cuda.manual_seed_all(seed_value)
        torch.backends.cudnn.deterministic = True
        torch.backends.cudnn.benchmark = True


seed = 42
seed_everything(seed)


def make_data(seq, label):
    inputs = []
    for i in seq:
        seq_index = [word2index[word] for word in i]
        # 补全保持句子长度一致
        if len(seq_index) != seq_length:
            seq_index = seq_index + [0] * (seq_length - len(seq_index))
        inputs.append(seq_index)
    targets = [i for i in label]
    return inputs, targets


input_batch, target_batch = make_data(seq_cut_list, label)
input_batch, target_batch = Variable(torch.LongTensor(input_batch)), Variable(torch.LongTensor(target_batch))


# dataset = Data.TensorDataset(input_batch, target_batch)
# loader = Data.DataLoader(dataset, batch_size, shuffle=True)

# 建立模型
class BiLSTM(nn.Module):
    def __init__(self):
        super(BiLSTM, self).__init__()
        self.word_vec = nn.Embedding(vocab_size, embedding_size)
        # bidirectional双向LSTM
        self.bilstm = nn.LSTM(embedding_size, n_hidden, 1, bidirectional=True)
        self.fc = nn.Linear(n_hidden * 2, num_classes)

    def forward(self, input):
        embedding_input = self.word_vec(input)
        # 调换第一维和第二维度
        embedding_input = embedding_input.permute(1, 0, 2)
        output, (h_n, c_n) = self.bilstm(embedding_input)
        # 使用正向LSTM与反向LSTM最后一个输出做拼接
        encoding1 = torch.cat([h_n[0], h_n[1]], dim=1)  # dim=1代表横向拼接
        # 使用双向LSTM的输出头尾拼接做文本分类
        encoding2 = torch.cat([output[0], output[-1]], dim=1)
        fc_out = self.fc(encoding1)
        return fc_out


model = BiLSTM()

criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# 训练
for epoch in range(5000):
    pred = model(input_batch)
    loss = criterion(pred, target_batch)
    if (epoch + 1) % 1000 == 0:
        print('Epoch:', '%04d' % (epoch + 1), 'cost =', '{:.6f}'.format(loss))
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

# 保存model
torch.save(model.state_dict(), 'data/' + modelIndex)
# 加载model
# model = torch.load('data/testModel')
# 测试
# 生成modelindex
with open('data/model_index.json', 'r+') as f:
    #model_index = {_index: [seq, label, modelIndex]}
    _json = json.load(f)
    _json[_index] = [seq, label, modelIndex]
    f.seek(0)
    json.dump(_json, f)
