-- -- 字符串
-- local string1 = [[
-- 类模板字符串 空格也会被记录
-- ]]
-- print("字符串是:",string1)
-- local lowerStr = 'zfc'
-- local uperStr = string.upper(lowerStr)
-- print("转大写",uperStr)
-- lowerStr = string.lower(uperStr)
-- print("转小写",lowerStr)
-- -- 替换
-- local rePre = 'acab'
-- local reOver =  string.gsub(rePre,'a','z')
-- print("替换后的字符串是：",reOver)
-- -- 查找
-- print("b在字符串中的位置是:",string.find(reOver,'b'))
-- print("czb在字符串中的位置是:",string.find(reOver,'czb'))
-- -- 拷贝字符串
-- print("将字符串拷贝三次",string.rep(reOver..'\t',3))
-- -- #号的作用
-- print("#号的作用 获取表的length",#{100,200,300})
-- -- 错误处理
-- assert(type(reOver)=='string',"传入的不是一个字符串")
-- assert(type(reOver)=='number',"传入的不是一个数字")
-- local a= {
--     hp = "黑色"
-- }
-- if a.hp
-- then
--     print("值为真")
-- else
--     print("值为假")
-- end
-- local a = {
--     part = {
--         name = 'test'
--     }
-- }
-- local b = {
--     test = "[]使用成功"
-- }
-- print(b[a.part.name])
local function printParams(res)
    print(res)
end 
local function reSetAttr(attrs)
	return printParams(attrs)
end
reSetAttr("闭包使用成功")()