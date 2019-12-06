use db50;
/* 1. 查询 "01" 课程比 "02" 课程成绩高的学生的信息及课程分数
    1.1 查询同时存在 "01" 课程和 "02" 课程的情况
    1.2 查询存在 "01" 课程但可能不存在 "02" 课程的情况 (不存在时显示为 null)
    1.3 查询不存在 "01" 课程但存在 "02" 课程的情况 */


/* 1. 查询 "01" 课程比 "02" 课程成绩高的学生的信息及课程分数
 注：这应该是 针对同一名学生：比较其"01" 课程比 "02" 课程成绩，
 若 此学生的 "01" 课程比 "02" 课程成绩高，就选出此学生的 信息及课程分数
 不会做！
*/

-- 参考答案！
-- 思路：不是先选出某个学生sid，而是用 选出中间结果作为表，
-- 然后在中间结果的表中进行(比较)操作

-- SELECT *
-- FROM 
--     (SELECT * FROM  SC WHERE SC.cid="01") AS biao01,    -- 取出 所有01课程 作为表1
--     (SELECT * FROM  SC WHERE SC.cid="02") AS biao02     -- 取出 所有02课程 作为表2
-- WHERE 
--     biao01.score > biao02.score AND 
--     biao01.sid = biao02.sid;

select *
from Student
where sid in(   -- 这里子查询返回的结果不只有1行，而是 一个集合
    select biao01.sid
        from
            (select * from SC where SC.cid="01") as biao01,
            (select * from SC where SC.cid="02") as biao02
        where
            biao01.score > biao02.score and
            biao01.sid = biao02.sid
)
