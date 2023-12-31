---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 86176.
--- DateTime: 2022/12/7 21:57
---

-- 迭代器遍历主要是用来遍历表的
-- # 得到的长度其实并不准确，一般不要用 # 来遍历表

testTable = { 1, [2] = 2, 3, [4] = 4, [0] = 5, 6, 7, [-1] = 10 };

-- 迭代器 ipairs
-- 从 1 开始往后遍历，小于 0 的索引无法获取
-- 只能找到连续索引的 key 如果中间断序了，它也无法遍历出后面的内容
for key, value in ipairs(testTable) do
    print("ipairs ：" .. key .. "-" .. value);
end

for key in ipairs(testTable) do
    print("ipairs key ：" .. key);
end

-- 迭代器 pairs（推荐使用这个比较强大）
-- 能获取到所有键，通过键可以得到值
for key, value in pairs(testTable) do
    print("pairs ：" .. key .. "-" .. value);
end

for key in pairs(testTable) do
    print("pairs key ：" .. key);
end