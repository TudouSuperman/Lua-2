---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 86176.
--- DateTime: 2022/12/6 15:43
---

testString_1 = "双引号字符串";
testString_2 = '单引号字符串';
testString_3 = "AbCdEfG";

-- 获取字符串长度（一个汉字占用3个长度，一个英文字母占用1个长度）。
print(#testString_1)
print(#testString_3)

-- lua 中也是支持转义字符的。
print("ABC\n123")

-- lua 多行打印字符串。
testString_3 = [[
ABC
123
DEF
456
]]
print(testString_3)

print([[
ABC
123
DEF
456
]])

-- 字符串拼接。
print("ABC" .. "123");
s1 = "abc";
s2 = 123;
print(s1 .. s2);

-- %d 与数字拼接。
-- %a 与任何字符拼接。
-- %s 与字符配对。
print(string.format("ABC%dEFG", 4));

-- 别的类型转换为字符串。
b = true;
print(type(tostring(b)))

print("字符串提供的公共方法。")
testString = "A1b2C3d4E5f6G7";
-- 小写转化为大写。
print(string.upper(testString));
-- 大写转化为小写。
print(string.lower(testString));
-- 翻转字符串。
print(string.reverse(testString));
-- 字符串索引查找（lua 索引是从 0 开始）。
print(string.find(testString, "A1b"));
-- 截取字符串。
print(string.sub(testString, 1, 3));
-- 字符串重复叠加。
print(string.rep(testString, 2));
-- 字符串修改（将 A1b 修改为 * 并返回修改了几次）。
print(string.gsub(testString, "A1b", "*"));
-- 字符串转化为 ASCII 码（开始的位置到结束的位置）。
print(string.byte(testString, 1, 14));
-- ASCII 码转化为字符串（开始的位置到结束的位置）。
print(string.char(string.byte(testString, 1, 14)));