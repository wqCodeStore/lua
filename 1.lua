-- -- �ַ���
-- local string1 = [[
-- ��ģ���ַ��� �ո�Ҳ�ᱻ��¼
-- ]]
-- print("�ַ�����:",string1)
-- local lowerStr = 'zfc'
-- local uperStr = string.upper(lowerStr)
-- print("ת��д",uperStr)
-- lowerStr = string.lower(uperStr)
-- print("תСд",lowerStr)
-- -- �滻
-- local rePre = 'acab'
-- local reOver =  string.gsub(rePre,'a','z')
-- print("�滻����ַ����ǣ�",reOver)
-- -- ����
-- print("b���ַ����е�λ����:",string.find(reOver,'b'))
-- print("czb���ַ����е�λ����:",string.find(reOver,'czb'))
-- -- �����ַ���
-- print("���ַ�����������",string.rep(reOver..'\t',3))
-- -- #�ŵ�����
-- print("#�ŵ����� ��ȡ���length",#{100,200,300})
-- -- ������
-- assert(type(reOver)=='string',"����Ĳ���һ���ַ���")
-- assert(type(reOver)=='number',"����Ĳ���һ������")
-- local a= {
--     hp = "��ɫ"
-- }
-- if a.hp
-- then
--     print("ֵΪ��")
-- else
--     print("ֵΪ��")
-- end
-- local a = {
--     part = {
--         name = 'test'
--     }
-- }
-- local b = {
--     test = "[]ʹ�óɹ�"
-- }
-- print(b[a.part.name])
local function printParams(res)
    print(res)
end 
local function reSetAttr(attrs)
	return printParams(attrs)
end
reSetAttr("�հ�ʹ�óɹ�")()