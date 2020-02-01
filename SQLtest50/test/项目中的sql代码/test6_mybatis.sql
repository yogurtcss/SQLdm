/* 2020-01-12 08:49:34
 test6_mybatis.sql，为学习mybatis做铺垫的！
*/
use db1;
/* 备注：因为mybatis还要新建user表，所以我将原本在数据库db1中的user表改名！
 原本user表中的数据有：用户名superbaby、密码123、年龄10、地址为陕西 ……
 在做 JavaWeb中后期的 “综合案例”-用户信息管理系统中，用到原本的这个user表！！

 重命名表 RENAME TABLE old_table_name TO new_table_name;
*/
--  在做 JavaWeb中后期的 “综合案例”-用户信息管理系统中，用到原本的这个user表！！
/* rename table user to user_JavaWeb; */


/* delete from user where id=54; */

/* 插入测试数据嗷
 测试 <if />标签 拼接的SQL语句是否生效
*/
/* insert into user(username) values("a_name");
insert into user(username,sex) values("a_nameSex","啊");
insert into user(username,sex,address) values("a_nameSexAddr","嗯","中国嗷"); */


select * from role;
select * from user_role;