-- ����
-- �ɱ����
function Increase(...)
    local agrs = {...} -- {...} ��ʾһ�������б䳤�������ɵ�����  
    local result = 0
    for i,v in ipairs(agrs) do
        -- print(v)
        result = result + v
    end
    return result
end
local funres =  Increase(1,2,5,6,4,8,9)
print("arr����Ԫ����ӵĽ���ǣ�",funres)
-- select��ʹ��
-- local arr = {0,2,3,4,5,6,7}
function SelectHandle(...)
    print("�ɱ�����ĳ���:",select("#",...))
    
    print(" n �� select('#',��) �Ĳ���:",select(2,...))
end
SelectHandle(1,2,5,6,4,8,9)