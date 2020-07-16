-- 字符串
local string1 = [[
类模板字符串 空格也会被记录
]]
print("字符串是:",string1)
local lowerStr = 'zfc'
local uperStr = string.upper(lowerStr)
print("转大写",uperStr)
lowerStr = string.lower(uperStr)
print("转小写",lowerStr)