# -*-coding:utf-8-*-

seq_file = "../data/2475523.csv"

# seq = []
# label = []
# with open(seq_file, "r") as f:
#     for i in f.readlines():
#         seq.append(i[:-3].split(","))
#         label.append(int(i[-2]))
list1 = ["S475", "S476", "S477", "S478", "S479", "S480", "S481", "S482", "S484", "S485", "S486", "S487", "S488", "S490",
         "S491", "S492", "S493", "S495", "S497", "S498", "S501", "S502", "S503", "S504", "S506", "S507", "S508", "S509",
         "S513", "S514", "S515", "S516", "S517", "S518", "S519", "S520", "S521", "S522", "S523"]
list2 = []
for i in list1:
    list2.append(" + i + ")
print(list2)
