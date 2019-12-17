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