use db50;

/* 2019-12-15 22:54:46
 11. 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
*/

-- 按学号分组，查询：统计count不及格(分数小于60)科目数量
/* select sid, count(score) as rst
from SC
-- 注意：在where语句中，不能直接使用 “列的别名” 参与 条件的筛选；
-- 即：在这里不能使用 rst>=2 的写法！！
-- where score<60 and rst>=2  -- 报错：Unknown column 'rst' in 'where clause'
where score<60 
group by sid; */


-- 第一次子查询：选出：不及格门数大于等于2门的同学的学号
/* select biao01.sid
from
    -- 学号、统计count不及格门数 作为中间结果
    (select SC.sid, count(score) as rst from SC where score<60 group by sid ) as biao01;
where biao01.rst>=2; */

-- 最终的子查询
select *
from Student
where sid in(
    
    select biao01.sid
    from
           ( select SC.sid,  count(score) as rst 
             from SC 
             where score<60 group by sid
           ) 
           as biao01
);