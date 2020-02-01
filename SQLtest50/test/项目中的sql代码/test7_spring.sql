use db1;

/* 2020-01-20 12:41:48
 Spring中也需要用到account表！
 我将原本 Mybatis 中的account表改名为  account_Mybatis1
*/
-- rename table account to account_Mybatis1;

/* 2020-01-20 12:43:49
 Sping中的测试表：account
 用于 demo3_myxmlioc 的包 
*/
/* create table account(
	id int primary key auto_increment,
	name varchar(40),
	money float
)character set utf8 collate utf8_general_ci;

insert into account(name,money) values('aaa',1000);
insert into account(name,money) values('bbb',1000);
insert into account(name,money) values('ccc',1000); */


-- 看你的 mysql 当前默认的存储引擎:
/* show variables like '%storage_engine%'; */

-- 你要看某个表用了什么引擎 (在显示结果里参数 engine 后面的就表示该表当前用的存储引擎):
/* show create table account; */

-- 修改aaa的钱为1000元
/* update account set money=1000 where name="aaa"; */

select * from account;