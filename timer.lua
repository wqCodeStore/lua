local qiu = script.Parent.qiu
--��x�ƶ�len��λ��
function XMove(temPart,len)
	return function ()
--		print(temPart.Name)
		local pos = tostring(temPart.Position)
		print("��ַ�����ǣ�",pos)
		local yIndex = string.find(pos,',',1)
		local zIndex = string.find(pos,',',yIndex+1)
		local x = string.sub(pos,2,yIndex-1)
		local y = string.sub(pos,yIndex+1,zIndex-1)
		local z = string.sub(pos,zIndex+1,#pos-1)
	--	print('x��ֵ�ǣ�',x)
	--	print('y��ֵ�ǣ�',y)
	--	print('z��ֵ�ǣ�',z)
		x = tonumber(x)
		y = tonumber(y)
		z = tonumber(z)
		temPart.Position = Vector3.New(x+len,y,z)
	end
end
local timer1 = RWTimer:Create(XMove(qiu,1),1,5)
timer1:Start()
--Stop()
