-- DML 增删改表中数据 
use db1;

/* 【逐行地】指定列属性，添加 一行 数据，
 insert into [<表名>-可省略的] (列名1，列名2，...，列名n)
    values(值1，值，...，值n)；
 
 注：1.列名和值要一一对应；
 2.若在insert时省略了<表名>，则默认给所有的列添加值
 (可以先select * 一下，查看有哪些列，然后逐列地添加值)
 建议不要省略表名
 3.可以用英文状态下的 双引号或单引号 表示字符串
  
*/
-- insert into stu( sno, sname, sex )
--     values( "A04","小明aa","男" );

-- select * from stu;

-- insert into stu
--     values( "A02","小明明！","男" );

/* 根据where中的条件，删除数据 
 delete from <表名>
    [where 条件-可选的]
 
 注：1.若省略where中的条件，则默认删除表中所有数据
 2.若要删除所有记录：
    (1)delete from <表名>    后不带where条件;
        不推荐使用，理由：消耗资源大，效率低
        此语句的原理：原表中有多少记录(行)，就执行多少次删除操作：
    
    (2)truncate table <表名>    后不带where条件;
        推荐使用。
        此语句的原理：不管原表中有多少记录，都是 先删除原表，后创建一张与原表相同的新表(只执行了两句SQL语句)
*/
-- delete from stu
--     where sno="A01";

/* 修改表中数据
 update 表名
    set 
        列名1 = 值1,
        列名2 = 值2,
        列名3 = 值2,
        ...,
        列名n = 值n        -- 注意，set后面中 不能用小括号包住 【为列名赋新的值语句】！！
                           -- set后不要加小括号！！
    [ where 条件-可选的 ]
 
 注：若不指定where条件，则默认 为所有行(记录) 都执行相同的 更新指定列的操作
 如：所有行的sex值都是一样的；所有行的sname值都是一样的
*/
-- update stu
--     set 
--         sname = "set后面不要加小括号括住这些赋值语句嗷！",  
--         sex = "set后面不要加小括号！！"
    
--     where( sno="A02" );

-- update stu
--     set
--         sname = "不指定where条件时，所有行hang 都执行xing 更新指定列的操作嗷！",
--         sex = "如：所有行的sex值都是一样的；所有行的sname值都是一样的";
-- 如：所有行的sex值都是一样的；所有行的sname值都是一样的

/* alter table stu add math int;
alter table stu add PE int; */
/* update stu
set math=50, PE=60
-- 省略了where条件，默认为所有行做修改 */