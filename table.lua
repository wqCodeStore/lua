-- 表的操作  表的索引从1开始，牛逼？！

local obj = {
    name = "zs",
    age = 23
}
local table = {4,'second',obj}
print("table[1]是:",table[1])
print("table[2]是:",table[2])
print("table[3]是:",table[3].name)
local table1 = table
table1[2] = 'change'
print("table1[2]是:",table1[2])
print("table[2]是:",table[2])
table1 = nil
print("table1是:",table1)
print("table[2]是:",table[2])
