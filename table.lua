-- ��Ĳ���  ���������1��ʼ��ţ�ƣ���

local obj = {
    name = "zs",
    age = 23
}
local table = {4,'second',obj}
print("table[1]��:",table[1])
print("table[2]��:",table[2])
print("table[3]��:",table[3].name)
local table1 = table
table1[2] = 'change'
print("table1[2]��:",table1[2])
print("table[2]��:",table[2])
table1 = nil
print("table1��:",table1)
print("table[2]��:",table[2])
