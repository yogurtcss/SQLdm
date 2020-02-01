/* Maven的Java工程，从MySQL中取数据
*/

/* create database maven;  -- 创建 名为maven的数据库 */

use maven;

/* create table items( -- 随便建的一个表
    id int primary key auto_increment, -- 自增ID
    name varchar(20),
    price float(10,0),
    pic varchar(40),
    createtime datetime,  -- insert into这列的datetime数据时，是 字符串格式，要加引号！
    detail varchar(200)
); */

/* insert into items value( null, "张三", 1, "啊", "2020-01-04", "无" );
insert into items value( null, "李四", 2, "嗯", "2020-01-01", "无" );
insert into items value( null, "王五", 3, "哈", "2020-01-02", "无" );
insert into items value( null, "六六", 4, "嚯", "2020-01-03", "无" ); */

select * from items;