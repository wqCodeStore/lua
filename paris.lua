-- ���ڵ�����
local array = {"Google","Runoob"}

for key,value in ipairs(array) do
    print("key",key)
    print("value",value)
end
    print("========��״̬������========")

function square(iteratorMaxCount,currentNumber)
    -- �����ǰ��С�ڵ����� ���õ�ǰ�� +1 ���������ƽ��
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
print("========��״̬������========")


function elementIterator (collection)
   local index = 0
   local count = #collection
   -- �հ�����
   return function ()
      index = index + 1
      if index <= count
      then
         --  ���ص������ĵ�ǰԪ��
         return collection[index]
      end
   end
end

for element in elementIterator(array)
do
   print(element)
end