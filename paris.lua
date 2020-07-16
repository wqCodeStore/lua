-- 关于迭代器
local array = {"Google","Runoob"}

for key,value in ipairs(array) do
    print("key",key)
    print("value",value)
end
    print("========无状态迭代器========")

function square(iteratorMaxCount,currentNumber)
    -- 如果当前数小于迭代数 就让当前数 +1 并算出他的平方
    if currentNumber<iteratorMaxCount
    then
        currentNumber = currentNumber+1
        return currentNumber, currentNumber*currentNumber
    end
end

for i,n in square,3,0
    do
        print(i,n)
end
print("========多状态迭代器========")
