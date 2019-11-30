use db1;

/* 约束
 1.概念：对表中的数据进行限定，保证数据的正确性、有效性和完整性
 2.分类
    primary key 主键约束
    foreign key 外键约束
    unique 唯一约束
    not null 非空约束
*/


/* 增、删约束；若要修改约束，则先删drop原约束，后add新约束
  
  not null 非空约束
  1.创建表时，为字段添加约束
  create table stu(
      id int,
      name varchar(20)   【not null】 -- 非空约束
  ) 

  2.修改的alter操作中：modify或add
  alter table <表名stu>  
    【modify或add】  列名name 数据类型varchar(20)   not null  -- 非空约束

  3.删除非空约束和添加非空约束一样，都是修改表字段的结构；
  直接去掉 NOT NULL两个关键字，这样就把非空删除了。
  alter table <表名> modify 列名 数据类型 
  -- 直接去掉 NOT NULL两个关键字，这样就把非空删除了。
*/

/* unique唯一约束：值不能重复
 1.创建表时，添加唯一约束；与【创建表时添加not null约束】格式相同
 2.删除唯一约束【特殊】
  alter table <表名> drop index <列名>
 3.添加唯一约束
  alter table <表名> modify <列名> 数据类型 unique
 
 注：MySQL中，唯一约束所限定的列，允许有多个null值

*/

/* primary key 主键约束
 1.创建表时添加；
 2.alter table <表名> drop primary key
 3.创建表后添加，
 alter table <表名> modify <列名> 数据类型 primary key [auto_increment]   -- 当主键所在列id是数值型时，使用auto_increment可使id自动增长
*/

/* foreign key 外键约束
 当一个键x在A表中是主键，但在B表中不是主键，则键x可成为B表中的外键
 1.创建表时，添加外键约束
  create table 表名(
    ...外键所在列名
    【constraint 给定外键名】    【foreign key(外键所在列名) references 主表名(列名1,列名2,...,列名n)】
  )

  如：create table SC(
    sno varchar(10) not null   【constraint s_fore】    【foreign key(sno) references S(sno)】
  )

2.删除外键
alter table <表名> drop foreign key <外键名>
3.创建表后添加，
altert table <表名> modify或add  【constraint 外键名】 【foreign key(外键所在列名) references 主表名(列名1,列名2,...,列名n)】

*/