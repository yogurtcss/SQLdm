use db1;  -- 使用mysql数据库


/* 查询某个数据库中所有表的名称
 show tables 
*/
-- show tables;

/* 查询表结构 
 desc 表名
 
 ▲ order by后的 desc 是 descend 的缩写，降序；
 在这里，命令的 desc 是 describe 的缩写，描述；
*/
-- desc student;

/* 创建数据表
 create table <表名>(
     列名1 数据类型,
     列名2 数据类型,...
 )
*/
-- use db1;
-- create table student(
--     sno varchar(10),
--     sname varchar(10),
--     sex varchar(5)
-- );

/* 复制已有的表 
 create table <表名> like <被复制的表名>
*/
-- use db1;
-- create table stu like student;


/* 删除表
 drop table [if exists] <表名> 
*/
-- use db1;
-- drop table if exists stu;

/* 修改表名 
 alter table <表名>
    rename to <新的表名>
*/
-- use db1;
-- alter table stu1
--     rename to stu;

/* 修改表的字符集
 alter table <表名> 
    character set <字符集名称>
*/
-- alter table stu
--     character set utf8;

/* 添加一列
 alter table <表名>
    add <列名> 数据类型
*/
-- alter table stu
--     add score int;

/* 修改 原列名及数据类型
 alter table <表名>
    change <原列名> <新列名> <新数据类型>
*/
-- alter table stu
--     change score sc int;

/* 删除列
 alter table <表名>
    drop <列名>
*/
-- alter table stu
--     drop sc;