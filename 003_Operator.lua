---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 86176.
--- DateTime: 2022/12/6 18:20
---

-- 运算符
-- lua 只有 + - * / %
-- lua 没有 ++ --
-- lua 没有 += -= *= /= %=
-- 字符串可以进行算数运算符操作，只要字符串为数字组成就会自动转化成值类型。

-- 算数运算符（lua 中 ^ 符号是幂运算，取一个数的 N 次方）
print("加法运算 ：" .. "123" + 7);
print("减法运算 ：" .. "123" - 7);
print("乘法运算 ：" .. "123" * 7);
print("除法运算 ：" .. "123" / 7);
print("取余预算 ：" .. "123" % 7);
print("求幂运算 ：" .. "123" ^ 7);

-- 条件运算符
print("大于 ：" .. tostring(1 > 2));
print("小于 ：" .. tostring(1 < 2));
print("大于等于 ：" .. tostring(1 >= 2));
print("小于等于 ：" .. tostring(1 <= 2));
print("等于 ：" .. tostring(1 == 2));
print("不等于 ：" .. tostring(1 ~= 2));

-- 逻辑运算符（&& = and || = or ! = not）
print(true and false);
print(true or false);
print(not false);
print(true and print("lua 中 and 和 or 符号是支持短路规则的。"))

-- 位运算符
print("lua 中不支持位运算符，需要自己实现 & |。")

-- 三元运算符
print("lua 中不支持三元运算符 ？ :。")
print("但是可以通过表达式自己写个三元运算符")
print(true and true or 1);