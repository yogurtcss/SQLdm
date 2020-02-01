use db1;  -- 
-- 查看 数据库db1的编码方式，最好使用 utf8 (在数据库中是 utf8，没有中间的  “-”)
/* show variables like "%chara%";  */

/* drop table stu2; */


-- 
/* create table user(
    id int primary key auto_increment,  
    username varchar(32) unique not null,
    password varchar(32) not null
) */


/* insert into user( id,username,password ) values( 1, "superbaby", "123" ); */
/* insert into user(name,gender,age,address,qq,email) values( "eee","男",8,"陕西","333","333@qq.com" );
insert into user(name,gender,age,address,qq,email) values( "eee","男",8,"陕西","333","333@qq.com" );
insert into user(name,gender,age,address,qq,email) values( "eee","男",8,"陕西","333","333@qq.com" );
insert into user(name,gender,age,address,qq,email) values( "eee","男",8,"陕西","333","333@qq.com" );
insert into user(name,gender,age,address,qq,email) values( "eee","男",8,"陕西","333","333@qq.com" ); */

/* 修改username和password列：删除这两列的非空约束！
 
 ▲ 删除非空约束和添加非空约束一样，都是修改表字段的结构；
  直接去掉 NOT NULL两个关键字，这样就把非空删除了。
  alter table <表名> modify 列名 数据类型 
  -- 直接去掉 NOT NULL两个关键字，这样就把非空删除了。
*/

/* alter table user modify username varchar(32);  -- 把 not null 去掉，这就是删除非空约束了
alter table user modify password varchar(32); */

select * from user;

-- 为原本的user表增加这几列
/* alter table user
add column(
    name varchar(32),
    gender varchar(10),
    age int,
    address varchar(32),
    qq varchar(20),
    email varchar(20)
) */

-- 修改原表的值
/* update user 
    set name="superbaby", gender="男", age=10, address="中国", qq="111", email="111@qqq.com"
where id=1; */

/* 
update user
    set gender="女"
where id=3; */

