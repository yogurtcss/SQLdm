use db50;

/* 在进行左外连接时：选出的列 要起“别名”，
 否则原列名可能会被null占据了(因为左外连接中，某一行没有匹配成功，这一行在主表中就全为null)，
 (若某些关键行全为null，那就没法利用这些行来查询了)导致下一步查询受阻！ */

-- “别名”将会以新的 “列” 出现在结果集中
/* select *  -- 理想表(主表)中出现null
from
    -- 选出的要起“别名”，否则原列名可能会被null占据了，导致下一步查询受阻！
    -- “别名”将会以新的 “列” 出现在结果集中
    (select Student.sid as SID, t.cid as CID  -- 尝试把“别名”去掉，然后查询以下
     from
        Student, (select SC.cid from SC where SC.sid='01') as t
    ) 
    as biao_ideal

    left join SC
    
    -- 这里用原来的列，也可以用新的列(别名所在的列)
    on biao_ideal.sid=SC.sid and biao_ideal.cid=SC.cid;
 */



/* select *
 from 
      (select student.SId,t.CId 
     from  
         student, (select sc.CId from sc where sc.SId='01') as t  
      ) 
     as t1 
     left join sc 
     on t1.SId=sc.SId and t1.CId=sc.CId; */



-- (select student.SId, t.CId 
-- from  student,  (select sc.CId from sc where sc.SId='01') as t  
-- )
/* 这句话的意思：从 student表 、t表 ——【即 (...)as t表】 中，
选出 student.SId, t.CId 这两列值！ */


-- 答案
-- select *
-- from student 
-- where 
-- student.SId not in (
-- select t1.SId
-- from 
--     (select student.SId, t.CId from student,  (select sc.CId from sc where sc.SId='01') as t  
--     )  as t1 
--     left join sc 
--     on t1.SId=sc.SId and t1.CId=sc.CId

-- where sc.CId is null )
-- and student.SId !='01'