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

-- 中间结果：学号、平均分的表
/* select sid, avg(score)
from SC
group by sid; */


-- 最终的子查询

-- 多次反复打开VS code，可使得 ctrl + / 的多行注释样式 在 -- 和 /* 之间变换！！
-- 最好是：当  ctrl + / 的多行注释为 /* 时，再进入真正的打码！ 多行的 -- 真的太难受了！

/* select Student.*, avg(score) as avgRst  -- 平均成绩
from SC,  Student   -- 在SC、Student表中选
where SC.sid in(

            -- 选出不及格的同学的学号
            ( select biao01.sid
              from
                  ( select SC.sid,  count(score) as rst 
                    from SC 
                    where score<60 
                    group by sid
                  ) 
                  as biao01
            )

) and SC.sid = Student.sid  -- SC、Student表通过sid列来连接
group by sid;
 */


-- 12. 检索 "01" 课程分数小于 60，按分数降序排列的学生信息

-- 第一个子查询：从SC中 查询 01课程 小于60分、按分数降序排序 的sid、cid和score列
-- “降序”的语句忘记怎么写了： order by <列名> [ asc升序 |  desc降序 ]
/* select *
from SC
where cid="01" and score<60
order by score desc; -- 降序desc，升序asc */

/* select *
from Student
where sid in( -- sid in ( ...这里面查询的结果只能是包含一列的sid！！ )

  -- 注意，这里查询出来的 * 结果不是一列，而是多列！！
  -- 这样会报错:Operand should contain 1 column(s)
  -- 因为 in后面只能接  “一列”的查询结果
  -- select * from SC where cid="01" and score<60
  -- order by score desc

  -- 这是正确的，查询的结果只有 sid这“一列”
  select SC.sid from SC where cid="01" and score<60
  order by score desc

); */



-- 13. 按平均成绩从高到低显示所有学生的【所有课程的成绩】以及平均成绩

-- 第一个子查询：从高到低显示所有学生的所有课程成绩
/* select sid, avg(score) as avgRst
from SC
group by sid
order by avgRst desc; -- order by <列名> 可以使用 列的“别名”！！ */

-- 题目的意思：先选出所有学生的所有成绩，然后把这【所有成绩】 按【各人平均成绩高低】 降序排序！！
/* select *
from
  
  SC,
  
  (select sid, avg(score) as avgRst 
   from SC 
   group by sid 
   order by avgRst desc) 
   as biao01

where SC.sid=biao01.sid
order by biao01.avgRst desc;  -- 在外部还要按 平均成绩来 降序排序 */


/* 14. 查询各科成绩最高分、最低分和平均分：
 以如下形式显示：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
 及格为 >=60，中等为：70-80，优良为：80-90，优秀为：>=90

 要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
*/

-- 以各cid分组，查询各cid下的最高分、最低分和平均分
/* select cid, max(score) as maxRst, min(score) as minRst, avg(score) as avgRst
from SC
group by cid; */


/* 查询范围 用 between ..a.. and ..b.. ，表示的范围是 闭区间 [a,b]
 
 或者 >= 及 <= 语句  
*/
/* select cid, count(score) as jiGe -- 及格
from SC
where score>=60
group by cid */

/* select cid, count(score) as zhongDeng -- 中等
from SC
where score>=70 and score<=80
group by cid; */


/* select *
from
  ( select cid, max(score) as maxRst, min(score) as minRst, avg(score) as avgRst from SC group by cid ) as biao01, -- 最高分、最低分、平均分
  ( select cid, count(score) as jiGe from SC where score>=60 group by cid ) as biao02,  -- 大于等于60分
  ( select cid, count(score) as zhongDENG from SC where score>=70 and score<=80 group by cid ) as biao03, -- 70-80分
  ( select cid as CID, count(score) as youLiang from SC where score>=80 and score<=90 group by cid ) as biao04  -- 80-90分
  left join
  ( select cid as CID, count(score) as youXiu from SC where score>90 group by cid ) as biao05 -- 90分以上
  on biao04.CID=biao05.CID
where
  biao01.cid = biao02.cid and 
  biao01.cid = biao03.cid and
  biao01.cid = biao04.cid;
 */

-- 要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
/* select cid, count(cid) as num
from SC
group by cid
order by num desc; */

-- 参考答案
/* select sc.CId ,max(sc.score)as 最高分,min(sc.score)as 最低分,AVG(sc.score)as 平均分,count(*)as 选修人数,sum(case when sc.score>=60 then 1 else 0 end )/count(*)as 及格率,sum(case when sc.score>=70 and sc.score<80 then 1 else 0 end )/count(*)as 中等率,sum(case when sc.score>=80 and sc.score<90 and sc.score<80 then 1 else 0 end )/count(*)as 优良率,sum(case when sc.score>=90 then 1 else 0 end )/count(*)as 优秀率 
from sc
GROUP BY sc.CId
ORDER BY count(*)DESC,sc.CId asc; */



-- 15. 按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺
/* select sc.SId,sc.CId ,case when @pre_parent_code=sc.CId then @curRank:=@curRank+1 when @pre_parent_code:=sc.CId then  @curRank:=1  end as rank,sc.score
from (select @curRank:=0,@pre_parent_code:='') as t ,sc
ORDER by sc.CId,sc.score desc */
