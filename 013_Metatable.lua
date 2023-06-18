---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 86176.
--- DateTime: 2022/12/10 13:39
---

-- 元表 概念
-- 任何表变量都可以作为另一个表变量的元表
-- 任何表变量都可以有自己的元表
-- 当子表中进行一些特殊操作时，会执行元表中的内容

-- 元表 设置
local mMetaTable = {};
local mTable = {};
-- 给子表 mTable 设置元表 mMetaTable
setmetatable(mTable, mMetaTable);

-- 元表 特定操作 __tostring
local mMetaTable2 = {
    -- 当调用时，会自动把自己传进来可以用 t 接受到，并调用其中字段 name
    __tostring = function(t)
        -- 这里调用 name 前提是知道表里有 name 字段
        return t.name;
    end
};
local mTable2 = {
    name = "当子表被当作字符串使用时，会默认调用元表中的 __tostring 方法";
};
-- 给子表 mTable2 设置元表 mMetaTable2
setmetatable(mTable2, mMetaTable2);
print(mTable2);

-- 元表 特定操作 __call
local mMetaTable3 = {
    -- 当调用时，会自动把自己传进来第一个参数默认是调用者自己
    __call = function(a, b)
        print(a, b);
    end
};
local mTable3 = {
    name = "当子表被当作函数使用时，会默认调用元表中的 __call 方法";
};
-- 给子表 mTable3 设置元表 mMetaTable3
setmetatable(mTable3, mMetaTable3);
mTable3("第二个参数");

-- 元表 特定操作 运算符重载
local mMetaTable4 = {
    -- 加法 __add
    __add = function(a, b)
        return a.number * b.number;
    end,
    -- 减法 __sub
    __sub = function(a, b)
        return a.number / b.number;
    end,
    -- 乘法 __mul
    __mul = function(a, b)
        return a.number + b.number;
    end,
    -- 除法 __div
    __div = function(a, b)
        return a.number - b.number;
    end,
    -- 取模 __mul
    __mod = function(a, b)
        return a.number ^ b.number;
    end,
    -- 取幂 __pow
    __pow = function(a, b)
        return a.number % b.number;
    end,
    -- 等于 __eq
    __eq = function(a, b)
        return true;
    end,
    -- 小于 __lt
    __lt = function(a, b)
        return true;
    end,
    -- 小于等于（没有大于或大于等于只能自己取反） __le
    __le = function(a, b)
        return false;
    end,
    -- 拼接（..） __concat
    __concat = function(a, b)
        return a.number .. b.number;
    end,
};
local mTableAdd1 = { number = 2 };
local mTableAdd2 = { number = 3 };
setmetatable(mTableAdd1, mMetaTable4);
print(mTableAdd1 + mTableAdd2);
print(mTableAdd1 - mTableAdd2);
print(mTableAdd1 * mTableAdd2);
print(mTableAdd1 / mTableAdd2);
print(mTableAdd1 % mTableAdd2);
print(mTableAdd1 ^ mTableAdd2);

-- 如果使用条件运算符比较两个对象，需要这两个对象元表一致才能准确调用
setmetatable(mTableAdd2, mMetaTable4);
print(mTableAdd1 == mTableAdd2);
print(mTableAdd1 < mTableAdd2);
print(mTableAdd1 <= mTableAdd2);
print(mTableAdd1 .. mTableAdd2);

-- 元表 特定操作 __index 和 __newIndex
local mMetaTable5 = {
    __index = {
        name = "未知";
        age = "0";
    }
};

local mTable5 = {
    name = "张三";
    age = "18";
};
setmetatable(mTable5, mMetaTable5);
-- __index 当子表中找不到某一属性时，会到元表中 __index 指定的表中找索引
print(mTable5.name, mTable5.age);

local mMetaTable6Father = {
    name = "未知";
    age = "0";
};
mMetaTable6Father.__index = mMetaTable6Father;
-- __index 的赋值尽量写在元表的外面来初始化避免出问题
local mMetaTable6 = {
    name = "元表";
    age = "0";
};
mMetaTable6.__index = mMetaTable6;
local mTable6 = {};
-- 这里元表也可以设置元表自己的元表类似 C# 里的继承
setmetatable(mMetaTable6, mMetaTable6Father);
setmetatable(mTable6, mMetaTable6);
print(mTable6.name, mTable6.age);

-- __newIndex 当赋值时，如果赋值一个不存在的索引，那么会把这个值赋值到 __newIndex 所指的表中，不会修改自己
-- __newIndex 和 __index 很像 类似 C# 中的继承
local mMetaTable7 = {
    age = 11;
};
mMetaTable7.__index = mMetaTable7;
mMetaTable7.__newIndex = {};
local mTable7 = {};
mTable7.name = "王二";
setmetatable(mTable7, mMetaTable7);
print(mTable7.name);

-- setmetatable 是设置一个表的元表
-- getmetatable 得到一个表的元表
print(getmetatable(mTable7));
-- mTable7.age 的方式会从元表里找
print(mTable7.age);

-- rawget(mTable7, "age") 方式只会从当前自己表里找类似 C# this.xxx
print(rawget(mTable7, "age"));

-- rawset(mTable7, "age", 2) 方法会忽略 __newIndex 的设置，只会改自己的变量
rawset(mTable7, "age", 2);
print(mTable7.age);