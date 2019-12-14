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


-- 6. 查询学过「张三」老师授课的同学的信息
-- select tid
-- from Teacher
-- where tname="张三";  -- 输出tid=01

-- selct cid
-- from Course
-- where tid="01";  -- 输出cid=02；cname为数学

-- select sid
-- from SC
-- where cid="02";

-- select biao04.*
-- from
--     (select tid from Teacher  where tname="张三") as biao01,
--     (select cid, Course.tid   from Course ) as biao02,
--     (select sid, SC.cid       from SC) as biao03,
--     (select * from Student) as biao04
-- where
--     -- 没啥大问题。特别要注意where中的条件(属性)，是否在上面的select...from中选取出来了？需留意
--     biao01.tid=biao02.tid and   
--     biao02.cid=biao03.cid and
--     biao04.sid=biao03.sid

/* 2019-12-13 16:52:19
7. 查询没有学全所有课程的同学的信息 */
/* select cid
from Course;  -- 取出所有的cid：01、02、03 */

-- 按sid分组 选取出 “统计课程数量count(sid)” ！！关键来了！
-- select SC.sid, count(sid) as rst
-- from SC
-- group by SC.sid

/* 2019-12-14 09:37:42
 注意到：学全所有课程的同学，其 count(cid)=3
 没有学全，则 count(cid) 不等于3
 注意，在数据库中，不等号 的写法！！
 ▲ mysql中用 <> 与 != 都是可以的，
 但 SQLserver 中不识别 !=, 所以建议用 <>
*/

-- select *
-- from
--     (select SC.sid, count(cid) as rst from SC group by SC.sid ) as biao01,
--     (select * from Student) as biao02
-- where
--     biao01.rst<>3 and   -- 选课数量biao01.rst不等于3
--     biao01.sid=biao02.sid

/* 2019-12-14 09:39:43
8.查询 至少 有一门课与学号为 "01" 的同学所学相同的同学的信息 
*/
-- 查看01同学学了啥课
-- select sid,cid
-- from SC
-- where sid="01";

-- 选出 至少 有一门课与学号为 "01" 的同学 【的学号】
-- select distinct(biao01.sid)
-- from
--     (select sid,cid from SC where sid<>"01") as biao01  -- 选出不是"01"的同学
-- where
--     biao01.cid="01" or
--     biao01.cid="02" or
--     biao01.cid="03"

/* select *
from
    (select distinct(biao01.sid) 
    from (select sid,cid from SC where sid<>"01") as biao01
    where biao01.cid="01" or biao01.cid="02" or biao01.cid="03")   as biao02, -- 表的中间结果
    -- biao02 选出 至少 有一门课与学号为 "01" 的同学 【的学号】

    -- biao03 选出所有同学的学号
    (select * from Student) as biao03
where
    biao02.sid=biao03.sid;  -- 然后 biao02与biao03通过学号相等来连接
 */


/* 2019-12-14 12:20:17 
2019-12-14 20:35:30
9. 查询和 "01" 号同学——学习的课程 完全相同的其他同学的信息
*/

-- 查看 01同学上了啥课
/* select cid
from SC
where sid="01"; */

-- 01同学的上课数量
/* select count(cid) as rst from SC where sid="01"; */


-- 查看 除去01同学的其他同学 上了啥课
/* select sid,cid
from SC
where sid<>"01" */


-- 01同学的 选课数量 
/* select count(cid) as rst3 from SC where sid="01" */

/* 
 已知：01同学选了 01课02课与03课
 构造一张“理想的表”——名为biao_ideal，(如何构造？通过 多表查询 做 笛卡尔积)
 此表中，假设除01外的都是所有同学都选了3门课：01课02课与03课
 然后让 理想表biao_ideal(左，作为主表) 与 真实选课表(右) 左连接；
    ▲ 注意选取出来的列要起“别名”，否则原列名被null占据，而阻碍下一步查询！！
 这样 在理想表中就会出现null的行，就能找出哪些人和01同学不一样了！
*/



-- “理想表” 与 真实选课表 进行左外连接

/* 搞清楚谁是主表，哪个表该出现null值？ 主表出现null值

 左外连接（left join /left outer join）: 
 满足 on 条件表达式，左外连接是以左表为准，返回左表所有的数据；
 右表中将出现null：仅显示右表中符合条件的行，右表中不合条件的行将显示null
 通常，我们需要【手动地】把右表的所有属性(.*) 选取 显示出来，找到那些显示null的特殊行，等待下一步的查询

 右外连接（right join /right outer join）：
 满足 on 条件表达式，右外连接是以右表为准，返回右表所有的数据，
 左表中将出现null：仅显示左表中符合条件的行，左表中不合条件的行将显示null
 通常，我们需要【手动地】把左表的所有属性(.*) 选取 显示出来，找到那些显示null的特殊行，等待下一步的查询

 
*/

-- 构造“理想表” biao_ideal
-- select *
-- from
--     (select distinct(sid) from SC where sid<>"01") as biao01,
--     (select cid from SC where sid="01") as biao02;

-- select *
-- from Student
-- where Student.sid not in(
--     -- 右表中 biao_real.sid 和 biao_real.cid 可能出现空字段，选取时要起别名
--     -- 左表中 biao_ideal.sid 不出现空字段
--     select biao_ideal.sid 
--     from
--         (select *
--         from
--             -- 最后的结果是要从Student表中选出最终结果，所以biao01还是要从 Student表中选取，然后搞笛卡尔积！
--             (select sid from Student where sid<>"01") as biao01,
--             (select cid from SC where sid="01") as biao02
--         )
--         as biao_ideal  -- 通过笛卡尔积构造出来的 “理想表”
        
--         left join

--         -- 右表中 biao_real.sid 和 biao_real.cid 可能出现空字段，选取时要起别名
--         (select sid as SID, cid as CID from SC where sid<>"01")
--         as biao_real
        
--         on
--             biao_ideal.sid = biao_real.sid and
--             biao_ideal.cid = biao_real.cid

--     where
--         -- 真实表中的SID 为空者，就是与01不同课的同学
--         biao_real.SID is null
-- )
-- and Student.sid <> "01";  -- 排除掉01同学本身



/* 2019-12-14 20:36:33
 10. 查询没学过 "张三" 老师讲授的任一门课程的学生姓名
*/

-- select tid from Teacher where tname="张三";  -- 输出 tid为01
-- select cid from Course where tid="01"; -- 输出 cid为02

-- 子查询: 张三老师教授的课程号为 02
/* select cid
from Course
where tid = (select tid from Teacher where tname="张三"); */

/* 2019-12-14 23:46:04
 血的教训：在做多重嵌套子查询时，每个子查询要加小括号！！
*/

-- 选了02课的同学萌，没选02课的同学，就 not in
/* select sid
from SC
where 
  cid= ( select cid from Course where tid= (select tid from Teacher where tname="张三") ); */

-- 如果在做多重嵌套子查询时，有个子查询 忘了加小括号，就会疯狂报错！！如下：
/* select sid
from SC
where 
  cid=  select cid from Course where tid= (select tid from Teacher where tname="张三") ; */

select *
from Student
where sid not in
                ( select sid 
                  from SC 
                  where cid= ( select cid 
                               from Course 
                               where tid= ( select tid 
                                             from Teacher 
                                             where tname="张三" )  
                            ) 
                )
