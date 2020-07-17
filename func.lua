-- 函数
-- 可变参数
function Increase(...)
    local agrs = {...} -- 表示一个由所有变长参数构成的数组  
    local result = 0
    for i,v in ipairs(agrs) do
        -- print(v)
        result = result + v
    end
    return result
end
local funres =  Increase(1,2,5,6,4,8,9)
print("相加的结果是",funres)
-- select?????
-- local arr = {0,2,3,4,5,6,7}
function SelectHandle(...)
    print("可选参数的个数有:",select("#",...))
    
    print("索引2到末尾的个数有:",select(2,...))
end
SelectHandle(1,2,5,6,4,8,9)