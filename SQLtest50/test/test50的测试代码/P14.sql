/* 2019-12-21 10:33:30
 测试 case when then end
*/

use db50;

select
    -- 注: case when score>60 then 1 else 0 end 这是对 大于60分的那些行 【做标记】
    -- 括号里的返回值是：判断score>60后的值，返回 1或0 (我们自定义的标记值)
    -- 表示 当分数大于60分时，记为1，否则 记为0
    (case when score>60 then 1 else 0 end) as mark
from SC
where cid="01";  -- 固定cid为01 



select

    -- 注: case when score>60 then 1 else 0 end 这是对 大于60分的那些行 【做标记】
    -- 表示 当分数大于60分时，记为1，否则 记为0

    sum(case when score>60 then 1 else 0 end) as rstSum,  
    -- 括号里的返回值是：判断score>60后的值，返回 1或0 (我们自定义的标记值)
    
    -- sum() 对 标记后的值(无论1还是0，都算是“做了标记”) 求和 1+1+1+1+0+0 = 4
    
    -- 对大于60分的人标记为1，小于60分的人标记为0，
    -- 通过 sum( 1+1+1+1+...+0+0 )对标记求和，1+1+1+1+0+0 = 4
    -- 这样，就是【间接地 统计出】 大于60分的有多少人了！

    count(case when score>60 then 1 else 0 end) as rstCount,
    -- count() 统计 所有做了标记的行(无论1还是0，都算是“做了标记”) 共有多少行？
    -- 这句话基本没用。直接 count(*) 也是等效的！

    max(case when score>60 then 1 else 0 end) as rstMax
    -- max() 求最大值
    -- 这里括号里的要么是1，要么是0。若返回最大值是 1，说明是 存在score>60 这行记录！！
    -- 可用来判断【是否存在】 score>60 的记录。



from SC
where cid="01";  -- 固定cid为01