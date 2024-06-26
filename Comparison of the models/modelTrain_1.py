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
from sklearn import metrics


# _index = "6970"
# seq = [['H', 'A'], ['H', 'F'], ['H', 'I'], ['H', 'V'], ['L', 'I'], ['Y', 'V']]
# label = [0, 0, 0, 1, 0, 0]
# modelIndex = 'model7172.pt'
_index = '2149688_3'
with open('data/2149688_3.csv', 'r') as f:
    _lines = f.readlines()
    seq = []
    label = []
    random.shuffle(_lines)
    for line in _lines:
        line = line.strip().split(',')
        seq.append([line[0], line[1]])
        label.append(int(line[2]))

# max_seq = len(seq)
# max_label = len(label)
# seq_test = seq[int(max_seq * 0.01):]
# label_test = label[int(max_label * 0.01):]
# seq = seq[:int(max_seq* 0.01)]
# label = label[:int(max_label* 0.01)]
modelIndex = '2149688_3.pt'

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


def seed_everything(seed_value):
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

input_batch, target_batch = input_batch[:int(len(input_batch) * 0.8)], target_batch[:int(len(target_batch) * 0.8)]
input_batch_test, target_batch_test = input_batch[int(len(input_batch) * 0.8):], target_batch[int(len(target_batch) * 0.8):]




class BiLSTM(nn.Module):
    def __init__(self):
        super(BiLSTM, self).__init__()
        self.word_vec = nn.Embedding(vocab_size, embedding_size)

        self.bilstm = nn.LSTM(embedding_size, n_hidden, 1, bidirectional=True)
        self.fc = nn.Linear(n_hidden * 2, num_classes)

    def forward(self, input):
        embedding_input = self.word_vec(input)
        embedding_input = embedding_input.permute(1, 0, 2)
        output, (h_n, c_n) = self.bilstm(embedding_input)
        encoding1 = torch.cat([h_n[0], h_n[1]], dim=1)
        encoding2 = torch.cat([output[0], output[-1]], dim=1)
        fc_out = self.fc(encoding1)
        return fc_out


model = BiLSTM()

criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)


for epoch in range(2000):
    pred = model(input_batch)
    loss = criterion(pred, target_batch)
    if (epoch + 1) % 100 == 0:
        print('Epoch:', '%04d' % (epoch + 1), 'cost =', '{:.6f}'.format(loss))
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()


torch.save(model.state_dict(), 'data/' + modelIndex)




model.eval()
with torch.no_grad():
    test_pred = model(input_batch_test)
    test_pred = test_pred.data.max(1, keepdim=True)[1]

    # row_diffs = test_pred.detach().numpy()
    # diff_vector_float = row_diffs.flatten()
    # diff_vector=diff_vector_float.astype(np.int64)
    # out_np = test_pred.detach().numpy()
    # row_diffs = np.abs(np.round(out_np[:, 1] - out_np[:, 0]))
    # _d = np.round(out_np[:, 1] - out_np[:, 0])
    # diff_vector_float = row_diffs.flatten()
    # diff_vector = diff_vector_float.astype(np.int64)
    # print(row_diffs)
    # print(_d)
    # print(diff_vector)
    # print(diff_vector_float)
    # print(test_pred.data.max(1, keepdim=True))

    correct = test_pred.eq(target_batch_test.data.view_as(test_pred)).sum()
    print('correct:', correct)
    print('Test Accuracy: {:.5f}%'.format(100. * correct / len(input_batch_test)))

    precision = correct / len(input_batch_test)
    recall = correct / len(target_batch_test)
    f1 = 2 * precision * recall / (precision + recall)
    y_pred = test_pred.data.numpy()
    y_test = target_batch_test.data.numpy()
    p = metrics.accuracy_score(y_test, y_pred)
    r = metrics.recall_score(y_test, y_pred)
    f = metrics.f1_score(y_test, y_pred)
    print('Test F1: {:.5f}%'.format(100. * f1))
    print('Test Precision: {:.5f}%'.format(100. * precision))
    print('Test Recall: {:.5f}%'.format(100. * recall))
    print('Test Accuracy: {:.5f}%'.format(100. * correct / len(input_batch_test)))

    print('Test Accuracy: {:.5f}%'.format(100. * p))
    print('Test Recall: {:.5f}%'.format(100. * r))
    print('Test F1: {:.5f}%'.format(100. * f))




with open('data/model_index.json', 'r+') as f:
    # model_index = {_index: [seq, label, modelIndex]}
    _json = json.load(f)
    _json[_index] = [seq, label, modelIndex]
    # print(_json)
    f.seek(0)
    json.dump(_json, f)
