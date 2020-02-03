use db1;

/* 2020-01-20 12:41:48
 Spring中也需要用到account表！
 我将原本 Mybatis 中的account表改名为  account_Mybatis1

 2020-01-30 11:56:53
 ssm整合案例中也要用到account表！
 我将原本 Spring 中的account表改名为 account_Spring1
*/

/* rename table account to account_Spring1; */

 /* --不创建ssm这个数据库了！
create database ssm;
use ssm; */

/* create table account(
    id int primary key auto_increment,
    name varchar(20),
    money double
); */

select * from account;


/* insert into account(name,money) values( "haha",2000 ); */


/* delete from account where name='python'; */