-- 50道SQL练习题

-- 创建 db50(表示50道SQL题) 数据库
/* create database if not exists db50 character set utf8; */

use db50;
-- 以下创建各表
/* create table Student(    -- 学生表
    sid varchar(10),        -- 学生编号
    sname varchar(10),      -- 学生姓名
    sage datetime,          -- 出生年月
    ssex  varchar(10)       -- 学生性别
); */

/* create table Course(     -- 课程表
    cid varchar(10),        -- 课程编号
    cname varchar(20),      -- 课程名
    tid varchar(10)         -- 教师编号
); */

/* create table Teacher(    -- 教师表
    tid varchar(10),        -- 教师编号
    tname varchar(10)       -- 教师姓名
); */

/* create table SC(            -- 成绩表
    sid varchar(10),        -- 学生编号
    cid varchar(10),        -- 课程编号
    score int               -- 分数
); */

/* insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('04' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '1989-07-01' , '女');
insert into Student values('09' , '张三' , '2017-12-20' , '女');
insert into Student values('10' , '李四' , '2017-12-25' , '女');
insert into Student values('11' , '李四' , '2017-12-30' , '女');
insert into Student values('12' , '赵六' , '2017-01-01' , '女');
insert into Student values('13' , '孙七' , '2018-01-01' , '女'); */


/* insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03'); */

/* insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五'); */

/* insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98); */

/* select * from Student; */