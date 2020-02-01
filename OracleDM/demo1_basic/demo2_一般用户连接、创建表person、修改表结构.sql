<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
-- 2020-02-01 11:23:43 Oracle 表的管理

/* 每新建/使用某个.sql文件，都要在右下角重新连接一次ORCL数据库
 (或重新连接一次或MySQL数据库！！)
 
 在demo1.sql中，创建了用户yo1，密码为root
 现在以yo1用户，重新创建连接，登录ORCL数据库 

 SERVICE_NAME 指的是 listener 中的全局数据库名：
 这个名字是由 listener.ora 中 GLOBAL_DBNAME 参数决定的。
 这个名字代表的是客户端连接到数据库时，tnsnames.ora 中 SERVICE_NAME 参数所对应的值。
*/
-- 切换到yo1用户下

-- create table person(
--     pid number(10),
--     pname varchar2(10)
-- );

/* 修改表的结构 */
-- alter table person 
--   add( gender number(2) );  -- 添加一列

-- alter table person
--   modify( gender varchar2(2) ); -- 修改列的类型

-- alter table person
--   rename column gender to sex;  -- 修改列的名称

-- alter table person
--   drop column sex;  -- 删除一列

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到
*/
=======
-- 2020-02-01 11:23:43 Oracle 表的管理

/* 每新建/使用某个.sql文件，都要在右下角重新连接一次ORCL数据库
 (或重新连接一次或MySQL数据库！！)
 
 在demo1.sql中，创建了用户yo1，密码为root
 现在以yo1用户，重新创建连接，登录ORCL数据库 

 SERVICE_NAME 指的是 listener 中的全局数据库名：
 这个名字是由 listener.ora 中 GLOBAL_DBNAME 参数决定的。
 这个名字代表的是客户端连接到数据库时，tnsnames.ora 中 SERVICE_NAME 参数所对应的值。
*/
-- 切换到yo1用户下

-- create table person(
--     pid number(10),
--     pname varchar2(10)
-- );

/* 修改表的结构 */
-- alter table person 
--   add( gender number(2) );  -- 添加一列

-- alter table person
--   modify( gender varchar2(2) ); -- 修改列的类型

-- alter table person
--   rename column gender to sex;  -- 修改列的名称

-- alter table person
--   drop column sex;  -- 删除一列

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到
*/
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 11:23:43 Oracle 表的管理

/* 每新建/使用某个.sql文件，都要在右下角重新连接一次ORCL数据库
 (或重新连接一次或MySQL数据库！！)
 
 在demo1.sql中，创建了用户yo1，密码为root
 现在以yo1用户，重新创建连接，登录ORCL数据库 

 SERVICE_NAME 指的是 listener 中的全局数据库名：
 这个名字是由 listener.ora 中 GLOBAL_DBNAME 参数决定的。
 这个名字代表的是客户端连接到数据库时，tnsnames.ora 中 SERVICE_NAME 参数所对应的值。
*/
-- 切换到yo1用户下

-- create table person(
--     pid number(10),
--     pname varchar2(10)
-- );

/* 修改表的结构 */
-- alter table person 
--   add( gender number(2) );  -- 添加一列

-- alter table person
--   modify( gender varchar2(2) ); -- 修改列的类型

-- alter table person
--   rename column gender to sex;  -- 修改列的名称

-- alter table person
--   drop column sex;  -- 删除一列

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到
*/
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 11:23:43 Oracle 表的管理

/* 每新建/使用某个.sql文件，都要在右下角重新连接一次ORCL数据库
 (或重新连接一次或MySQL数据库！！)
 
 在demo1.sql中，创建了用户yo1，密码为root
 现在以yo1用户，重新创建连接，登录ORCL数据库 

 SERVICE_NAME 指的是 listener 中的全局数据库名：
 这个名字是由 listener.ora 中 GLOBAL_DBNAME 参数决定的。
 这个名字代表的是客户端连接到数据库时，tnsnames.ora 中 SERVICE_NAME 参数所对应的值。
*/
-- 切换到yo1用户下

-- create table person(
--     pid number(10),
--     pname varchar2(10)
-- );

/* 修改表的结构 */
-- alter table person 
--   add( gender number(2) );  -- 添加一列

-- alter table person
--   modify( gender varchar2(2) ); -- 修改列的类型

-- alter table person
--   rename column gender to sex;  -- 修改列的名称

-- alter table person
--   drop column sex;  -- 删除一列

/* 在yo1用户下操作person表，新增一条记录 
 没有手动commit

 而在超级管理员sys中，能看到person的新记录吗？-- sys能看到
*/
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
select * from person;