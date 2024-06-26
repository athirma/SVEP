import numpy as np
import pandas as pd
from sklearn import metrics
from sklearn import neighbors
from sklearn import ensemble
from sklearn import tree
from sklearn import linear_model
from sklearn import svm
from sklearn.naive_bayes import  GaussianNB,MultinomialNB
from sklearn.model_selection import train_test_split

import modelTrain2 as modelTrain

import torch
import torch.nn as nn
import torch.optim as optim
from torch.autograd import Variable

classifiers = {
    'Logistic':linear_model.LogisticRegression(),
    'KNN':neighbors.KNeighborsClassifier(),
    'DecisionTree':tree.DecisionTreeClassifier(),
    'GradientBoosting':ensemble.GradientBoostingClassifier(),
    'RandomForest':ensemble.RandomForestClassifier(),
    'SVC-linear':svm.SVC(kernel='linear'),
    'SVC-poly':svm.SVC(kernel='poly'),
    'SVC-rbf':svm.SVC(kernel='rbf'),
    'SVC-sigmoid':svm.SVC(kernel='sigmoid'),
    'NaiveBayes':GaussianNB(),
    'MultinomialNaiveBayes':MultinomialNB(),
}
# classifiers = {'Logistic':linear_model.LogisticRegression(),'KNN':neighbors.KNeighborsClassifier(),}

#读取文件，构建矩阵
def readData():
    # 读取2149688.csv文件
    df_csv = pd.read_csv('2149688.csv', header=None)
    df_csv.columns = ['A', 'B', 'Y']
    # 读取Word2Index2149688.log文件
    word_to_index = {}
    with open('Word2Index2149688.log', 'r') as file:
        for line in file:
            key, value = line.strip().split(':')
            word_to_index[key] = int(value)

    # 匹配AB字符串对应的X值，并生成新数组
    new_array = []
    for index, row in df_csv.iterrows():
        key_A = row['A']
        key_B = row['B']
        if key_A in word_to_index and key_B in word_to_index:
            X_A = word_to_index[key_A]
            X_B = word_to_index[key_B]
            Y = row['Y']
            new_row = [X_A, X_B, Y]
            new_array.append(new_row)

    df_new = pd.DataFrame(new_array, columns=['X_A', 'X_B', 'Y'])

    # df_new = df_new.drop_duplicates() #【可选项】去除冗余行
    df_new.to_csv('Mdata.csv', index=False)
    numpy_array = df_new.to_numpy()
    return numpy_array



def nn_model_train_pred_eva(X_train,Y_train,X_test):
    input_batch, target_batch = Variable(torch.LongTensor(X_train)), Variable(torch.LongTensor(Y_train))
    model = modelTrain.BiLSTM()
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    # 训练
    for epoch in range(100): #5000
        pred = model(input_batch)
        loss = criterion(pred, target_batch)
        if (epoch + 1) % 1000 == 0:
            print('Epoch:', '%04d' % (epoch + 1), 'cost =', '{:.6f}'.format(loss))
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
    # print('Train success')
    # print(X_train.shape,X_test.shape)
    test_batch = torch.LongTensor(X_test)
    out = model(test_batch)

    out_np = out.detach().numpy()
    row_diffs = np.abs(np.round(out_np[:, 1] - out_np[:, 0])) #np.abs
    diff_vector_float = row_diffs.flatten()
    diff_vector=diff_vector_float.astype(np.int64)
    print(set(diff_vector))
    # predict_label = (float(out[:,1] - out[:,0]))
    return diff_vector


def KFoldTrainCF(numpy_array):
    X = numpy_array[:, :2]
    Y = numpy_array[:, 2]
    score_matrixlist=[]

    X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.5, shuffle=True) #, random_state=42
    #### print(X_train,X_test,y_train,y_test)
    for clf_name, clf in classifiers.items():
        print(clf_name)
        clf.fit(X_train, y_train) #分类器训练
        y_pred=clf.predict(X_test) #分类器测试
        p=metrics.accuracy_score(y_test,y_pred)
        r=metrics.recall_score(y_test,y_pred)
        f=metrics.f1_score(y_test,y_pred)
        score_matrixlist.append([p,r,f])

    #外接神经网络的训练与测试
    print('LSTM_NET')
    classifiers_list=list(classifiers.keys())
    classifiers_list.append('LSTM_NET')
    y_pred=nn_model_train_pred_eva(X_train,y_train,X_test) #分类器训练+测试###########################################################
    print((y_test.shape),'::',(y_pred.shape))
    p=metrics.accuracy_score(y_test,y_pred)
    r=metrics.recall_score(y_test,y_pred)
    f=metrics.f1_score(y_test,y_pred)
    score_matrixlist.append([p,r,f])

    #汇总输出结果
    data = {"Model": classifiers_list, #list(classifiers.keys()),
            "Accuracy": [scores[0] for scores in score_matrixlist],
            "Recall": [scores[1] for scores in score_matrixlist],
            "F1score": [scores[2] for scores in score_matrixlist]}
    df = pd.DataFrame(data)
    df.to_csv('Mscore.csv', index=False)


def caller():
    ##预处理XY数据，输出csv
    numpy_array=readData()

    #加载XY数据
    data = pd.read_csv('Mdata.csv')
    data_values = data.values
    numpy_array = np.array(data_values)

    #测试
    KFoldTrainCF(numpy_array)


if __name__ == '__main__':
    caller()
