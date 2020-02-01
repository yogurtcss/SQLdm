<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
-- 2020-02-01 12:48:54

-- select * from person;

/* 插入字符数据时使用英文双引号报错：ORA-00984 列在此处不允许。
 报错原因：Oracle 不能识别双引号，默认字符串都采用单引号
*/
-- insert into person(pid,pname) values( 1,"小明" );  -- 报错：ORA-00984 列在此处不允许。

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到！
 ---
 DDL(数据定义语言) - Create、Alter、Drop 这些语句自动提交，无需用 Commit 提交。
 DQL（数据查询语言）- Select 查询语句不存在提交问题。
 DML(数据操纵语言) - Insert、Update、Delete 这些语句需要 Commit 才能提交。

*/

-- insert into person(pid,pname) values( 1,'小明' );  

-- update person set pname='哈哈' where pid=1;
-- commit;

/* 三个“删除” */
-- delete from person;  -- 不带 where字段 的delte：不删除表结构，删除表中全部记录
-- drop table person;  -- 扔掉整个表：删除表的所有结构
=======
-- 2020-02-01 12:48:54

-- select * from person;

/* 插入字符数据时使用英文双引号报错：ORA-00984 列在此处不允许。
 报错原因：Oracle 不能识别双引号，默认字符串都采用单引号
*/
-- insert into person(pid,pname) values( 1,"小明" );  -- 报错：ORA-00984 列在此处不允许。

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到！
 ---
 DDL(数据定义语言) - Create、Alter、Drop 这些语句自动提交，无需用 Commit 提交。
 DQL（数据查询语言）- Select 查询语句不存在提交问题。
 DML(数据操纵语言) - Insert、Update、Delete 这些语句需要 Commit 才能提交。

*/

-- insert into person(pid,pname) values( 1,'小明' );  

-- update person set pname='哈哈' where pid=1;
-- commit;

/* 三个“删除” */
-- delete from person;  -- 不带 where字段 的delte：不删除表结构，删除表中全部记录
-- drop table person;  -- 扔掉整个表：删除表的所有结构
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 12:48:54

-- select * from person;

/* 插入字符数据时使用英文双引号报错：ORA-00984 列在此处不允许。
 报错原因：Oracle 不能识别双引号，默认字符串都采用单引号
*/
-- insert into person(pid,pname) values( 1,"小明" );  -- 报错：ORA-00984 列在此处不允许。

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到！
 ---
 DDL(数据定义语言) - Create、Alter、Drop 这些语句自动提交，无需用 Commit 提交。
 DQL（数据查询语言）- Select 查询语句不存在提交问题。
 DML(数据操纵语言) - Insert、Update、Delete 这些语句需要 Commit 才能提交。

*/

-- insert into person(pid,pname) values( 1,'小明' );  

-- update person set pname='哈哈' where pid=1;
-- commit;

/* 三个“删除” */
-- delete from person;  -- 不带 where字段 的delte：不删除表结构，删除表中全部记录
-- drop table person;  -- 扔掉整个表：删除表的所有结构
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 12:48:54

-- select * from person;

/* 插入字符数据时使用英文双引号报错：ORA-00984 列在此处不允许。
 报错原因：Oracle 不能识别双引号，默认字符串都采用单引号
*/
-- insert into person(pid,pname) values( 1,"小明" );  -- 报错：ORA-00984 列在此处不允许。

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到！
 ---
 DDL(数据定义语言) - Create、Alter、Drop 这些语句自动提交，无需用 Commit 提交。
 DQL（数据查询语言）- Select 查询语句不存在提交问题。
 DML(数据操纵语言) - Insert、Update、Delete 这些语句需要 Commit 才能提交。

*/

-- insert into person(pid,pname) values( 1,'小明' );  

-- update person set pname='哈哈' where pid=1;
-- commit;

/* 三个“删除” */
-- delete from person;  -- 不带 where字段 的delte：不删除表结构，删除表中全部记录
-- drop table person;  -- 扔掉整个表：删除表的所有结构
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
-- truncate table person;  -- 不删除表结构，只删除表数据