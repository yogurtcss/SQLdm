/* 2020-02-01 13:52:57
 序列sequence，翻译为 顺序、序列
 实现自动增长功能
*/

-- create table person(
--     pid number(10),
--     pname varchar2(10)
-- );

/* 序列：默认从1开始，依次递增，主要用来给主键赋值使用。 
 在实际项目中每一张表会配一个序列，但是表和序列是没有必然的联系的，
 一个序列可以被任意一张表使用；但是一般是一张表专用一个序列。 

 dual：虚表，只是为了补全语法，没有任何意义。

 序列实例s_person.nextval :取得序列的下一个内容
 序列实例s_person.currval :取得序列的当前内容 
 
 ▲ dual 是一个虚拟表，用来构成 select 的语法规则，
 oracle 保证 dual 里面永远只有一条记录。

*/

-- create sequence s_person;  -- 创建一个序列s_person

-- select user from dual; -- 查看当前用户

/* 从dual表中，得到序列的下一个值或当前值 */

-- select s_person.nextval from dual;-- 获得 某个序列sequence 的下一个值
-- select s_person.currval from dual;-- 获得 某个序列sequence 的当前值

/* 在插入数据时需要自增的主键中：
 序列实例s_person.nextval替换原本属于id列的位置即可 */
-- insert into person(pid,pname) values( s_person.nextval, '黑妞' );
-- commit;

-- select * from person;