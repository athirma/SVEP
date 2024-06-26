# -*-coding:utf-8-*-
import json
import os
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
import collections
import torch.utils.data as Data
import random
from torch.autograd import Variable
import jieba


def wordidnex(seq, label):
    seq_cut = []
    seq_cut_list = []
    for i in seq:
        cut_res = i
        seq_cut = seq_cut + cut_res
        seq_cut_list.append(cut_res)
    word2num = sorted(collections.Counter(seq_cut).items(), key=lambda item: item[1], reverse=True)

    vocab = list(set(seq_cut))

    word2index = {w[0]: i + 1 for i, w in enumerate(word2num)}
    word2index["PAD"] = 0

    vocab_size = len(word2index)
    seq_size = len(seq)
    seq_length = max([len(i) for i in seq_cut_list])
    word2index = word2index
    seq_length = seq_length
    return word2index, seq_length

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


def make_data(seq, label, word2index, seq_length):
    inputs = []
    for i in seq:
        seq_index = []
        for word in i:
            if word in word2index:
                # seq_index= [word2index[word] for word in i]
                seq_index.append(word2index[word])
            else:
                seq_index.append(0)
        if len(seq_index) != seq_length:
            seq_index = seq_index + [0] * (seq_length - len(seq_index))
        inputs.append(seq_index)
    targets = [i for i in label]
    return inputs, targets


# def bilTrain(train_text1, train_text2, model_index):
def bilTrain(model_index, *args):
    with open('d:/test/bil/data/model_index.json', 'r+') as f:
        _json = json.load(f)
        seq = _json[model_index][0]
        label = _json[model_index][1]
        model_index = _json[model_index][2]
    word2index, seq_length = wordidnex(seq, label)
    seed = 42
    seed_everything(seed)
    model = BiLSTM(seq, label)
    # model = torch.load(r'data/testModel')
    model.load_state_dict(torch.load("d:/test/bil/data/" + model_index))

    model.eval()
    # model = self.model

    test_text = [_t for _t in args]
    # test_text = [train_text1, train_text2]

    test_cut = test_text

    test_batch, _ = make_data([test_cut], [1], word2index, seq_length)
    test_batch = torch.LongTensor(test_batch)
    out = model(test_batch)
    predict = torch.max(out, 1)[1]
    # print(test_cut)
    return float(out[0][1] - out[0][0])


class BiLSTM(nn.Module):
    def __init__(self, seq, label):
        super(BiLSTM, self).__init__()
        batch_size = 3
        embedding_size = 3
        num_classes = 2
        n_hidden = 5


        seq_cut = []
        seq_cut_list = []
        for i in seq:
            cut_res = i
            seq_cut = seq_cut + cut_res
            seq_cut_list.append(cut_res)
        word2num = sorted(collections.Counter(seq_cut).items(), key=lambda item: item[1], reverse=True)

        vocab = list(set(seq_cut))

        word2index = {w[0]: i + 1 for i, w in enumerate(word2num)}
        word2index["PAD"] = 0

        vocab_size = len(word2index)

        self.word_vec = nn.Embedding(vocab_size, embedding_size)
        # bidirectional Bi-LSTM
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


if __name__ == '__main__':
    print(bilTrain('419423', 'A', 'S', 'N'))
