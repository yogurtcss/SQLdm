use db50;
/* 1. 查询 "01" 课程比 "02" 课程成绩高的学生的信息及课程分数
    1.1 查询同时存在' 01' 课程和 '02' 课程的学生信息
    1.2 查询存在 "01" 课程但可能不存在 "02" 课程的学生情况 (不存在时显示为 null)
    1.3 查询不存在 "01" 课程但存在 "02" 课程的学生情况 */


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

/* select *
from Student
where sid in(   -- 这里子查询返回的结果不只有1行，而是 一个集合
    select biao01.sid
         from
            (select * from SC where SC.cid="01") as biao01,
             (select * from SC where SC.cid="02") as biao02
        where
             biao01.score > biao02.score and
             biao01.sid = biao02.sid
); */



-- 1.1 查询同时存在' 01' 课程和 '02' 课程的学生信息
/* select *
from Student
where sid in(
    select biao01.sid
    from
        (select sid,cid from SC where cid="01") as biao01,
        (select sid,cid from SC where cid="02") as biao02
    where
        biao01.sid=biao02.sid
); */



-- 1.2 查询存在 "01" 课程但可能不存在 "02" 课程的学生情况 (不存在时显示为 null)
-- 中间结果作左连接
/* select *
from
    (select sid,cid from SC where cid="01") as biao01
    left join
        (select sid,cid from SC where cid="02") as biao02
    on biao01.sid=biao02.sid */



-- 1.3 查询不存在 "01" 课程但存在 "02" 课程的学生情况 */

-- 先从SC中：分别观察 选了01课、02课 的集合
/* select * from SC where cid="01";
select * from SC where cid="02"; */

-- select SC.sid
-- from SC
-- where 
--     cid="02" and
--     SC.sid not in (select SC.sid from SC where cid="01")



-- 2. 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
-- 分步写的过程，先查一下这个，不要一上来就写子查询！！
-- select sid, avg(score)
-- from SC
-- group by sid;

-- 正解：一般的连接，通过 中间结果biao01.sid=biao02.sid进行连接
-- select biao01.sid, biao02.sname, biao01.rst
-- from
--     (select sid,avg(score) as rst  from SC group by sid) as biao01, -- 以sid分组，计算平均分
--     (select sid,sname from Student) as biao02
-- where rst>=60 and biao01.sid=biao02.sid;


-- select biao02.sid, biao02.sname, rst
-- from
--     -- 以sid分组，计算平均分
--     (select sid,avg(score) as rst  from SC group by sid) as biao01
--     left join
--         (select sid,sname from Student) as biao02
--     on 
--         biao01.sid=biao02.sid and
--         rst>60
-- 不该用左外连接！！


-- 3. 查询在 SC 表存在成绩的学生信息

-- select * from student; -- 没有成绩的学生：09至13号
-- select * from SC;

-- 选出所有学号+姓名
-- select sid, sname from Student; 
-- 选出所有 不重复的学号，已知SC表中的学号，都是有成绩的，不在SC表中都是没成绩的
-- select distinct(sid) from SC; 

-- select biao01.sid, biao01.sname, biao01.sage, biao01.ssex
-- from
--     (select * from Student) as biao01,
--     (select distinct(sid) from SC) as biao02
-- where biao01.sid=biao02.sid

-- 从这第3题开始，渐入佳境了


-- 4. 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩 (没成绩的显示为 null)

-- 某同学的选课总数
/* select count(cid)
from SC
where sid="13";

select sum(score)
from SC
where sid="13";

select Student.sid, Student.sname
from Student; */

/* select biao01.sid, biao01.sname, biao02.rstCount, biao03.rstSum
from
    (select Student.sid, Student.sname from Student) as biao01
    left join
        (select count(cid) as rstCount, SC.sid from SC  group by sid) as biao02
    on biao01.sid=biao02.sid
    left join
        (select sum(score) as rstSum, SC.sid from SC group by sid) as biao03
    on biao02.sid=biao03.sid  -- on的条件是传递地写：上一个左外连接的on条件与下一个左外连接的公共部分
    -- 在这里，公共部分是 biao02.sid */

/* 多个表进行左外连接时：串联写法，
 1.一个左外连接紧跟着一个on；
 2.on的条件是传递地写：一个左外连接的on条件与下一个左外连接的公共部分
   在这里，公共部分是 biao02.sid
*/

-- 4.1 查有成绩的学生信息
/* select distinct(SC.sid) from SC */

/* select biao02.*
from
    (select distinct(SC.sid) from SC) as biao01,
    (select * from Student) as biao02
where
    biao01.sid=biao02.sid */


-- 5. 查询「李」姓老师的数量
-- 忘记了 模糊查询，不是用等号啦！ Teacher.tname = "李_"; 
/* select count(*)  -- count(*)或count(tid)都是可以的
from Teacher
where
    Teacher.tname like "李_";  -- 单下划线_ 表示单个任意字符 */

/* select count(tid)
from Teacher
where
    tname like "李%"; */