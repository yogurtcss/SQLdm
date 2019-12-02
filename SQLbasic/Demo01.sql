/* SQL通用语法
 1.SQL语句可以单行或多行书写，以分号结尾
 2.可使用空格和缩进来增强语句的可读性
 3.MySQL数据库的SQL语句不区分大小写，关键字建议使用大写
 4.三种注释：
    * 单行注释 
      (1) --(第2道短杠后至少跟一个空格符, 例如空格、tab、换行符等等) 注释内容 
      (2) #(井号后可以不带空格, #后面直接跟的就是注释) 注释内容
    * 多行注释  杠/星号* 注释内容 星号*杠/
*/


/* 终于知道怎么在VScode上写SQL的多行注释了……
 ▲ 安装VScode扩展插件：guides；不使用自带的缩进参考线
 
 ▲ 缩进相同的多行注释折叠定律：
    当缩进相同时：这里面的文字才可被正确折叠进此 “多行注释中”；

 1.第二行这里首部加【一个空格】，后面各行的首部将自动加一个空格 ——自动使得缩进相同；
 这样，这堆文字才可被正确折叠进来；

 2.由【缩进相同的多行注释折叠定律】，
 已知：多行注释中，首部的 /杠*星号 的前面(默认)是没有空格的，
 所以，若想使得 这一大段文字的 “多行注释” 能被正确折叠，
 则需要：首尾两处的 /杠*星号、 *星/杠号 缩进相同！！
 
 所以，把 末尾处*星/杠号 前的空格删掉，使首尾处的 /杠*星号、 *星/杠号 缩进相同，
 如此，这一大段多行注释就可正确地被 “折叠”。

 约定：每个不同内容的 “多行注释” 之间，相隔两行！
*/


/* 2019-11-28 09:58:03
 SQL分类
 1.DDL：Data Definition Language 数据定义语言
 用来 定义数据库对象：数据库、表、列等；
 关键字 create、drop、alter等
 
 2.DML：Data Manipulation Language 数据操作语言
 用来 对数据库中【表】的数据进行 增删改；
 关键字 insert、delete、update等

 3.DQL：Data Query Language 数据查询语言
 用来 查询数据库中【表】的记录(数据)；
 关键字 select、where等

 4.DCL：Data Control Language 数据控制语言(了解)
 用来 定义数据库的访问权限和安全级别，及创建用户；
 关键字：GRANT REVOKE 等
*/


/* 回忆：原来我是在暑假时 通过 phpStudy 安装的 MySQL服务！！
 所有MySQL对应的本地文件，在 phpStudy文件夹\MySQL文件夹\data文件夹 下
 在VScode这里，我localhost 连接的就是 
 phpStudy文件夹\MySQL文件夹\data文件夹 下的数据库
 
 DDL：Data Definition Language 数据定义语言
 操作数据库：CRUD
 C：Create创建
 R：Retrieve查询
 U：Update修改
 D：Delete删除
*/


/* 查看所有数据库的名称

*/
-- show databases;  -- 单行注释，查看所有数据库的名称

/* show create database <某个数据库名称>
 1.查看对应的数据库，在创建时指定的字符集；
 2.查看某个数据库的创建语句
*/
/* show create database mysql;  -- 在这里 名为mysql数据库，字符集为gbk */

/* create database [if not exists-可选的前置条件] 
   <dbName-你指定的数据库名称> 
   [character set <charSet-你指定的字符集,如gbk,utf8> 可选的后置条件]

 [可选的 前置条件: 当不存在此数据库名dbName时,]   
 [可选的 追加条件: 以你指定的字符集charSet进行创建 (如gbk或 utf8, 注意这里没有短杠-嗷!) ]
 创建指定名称dbName的数据库

 注: SQL会忽略空格和行尾的换行符号，SELECT 语句可以用一行或者多行来表达


 exist  /ɪɡˈzɪst/ 存在

*/
/* create database db1;  -- 创建数据库db1,以后就用db1做实验 */
/* show databases; */

/* drop database <数据库名>
 删除指定名称的数据库  
*/
/* drop database db1; */

-- create database if not exists db1 character set utf8;  -- 以完整的create语句,创建编码为utf8的数据库db1 */
/* show create database db1;  -- utf8的编码格式 */

/* alter database 数据库名 character set 字符集名称
 修改数据库的编码格式(字符集)
*/
-- alter database db1 character set utf8;
-- show create database db1;

/* drop database 数据库名 [if exists]
 当此数据库存在时，删除数据库  
*/
-- drop database db1;

/* select database(空参); 要带上括号！！
 查询当前正在使用的数据库

 use 数据库名db
 更改为 使用名为db的数据库
*/
use db1;
select * from stu;

/* jdbc java rollback 无效：
 数据库的总引擎虽是修改为INNODB了，
 但之前已建好的表还不是INNODB引擎！
 所以，现在要修改 之前已建好的stu、stu2表的引擎为 INNODB
 
 此语句只执行一次，可能未及时生效，
 得多执行几次才见到  ENGINE=InnoDB DEFAULT 的效果……
*/
-- alter table stu engine=INNODB；
-- alter table stu2 engine=INNODB；


/* 查看某数据库中，已建表用的引擎
 show table status from 数据库名 where name="表名"
*/
-- show table status from db1 where name="stu"；
-- show create table stu；


-- show engines;

-- 我重置一下这两个数字
-- update stu set math=50 where sno="A03";
-- update stu set math=60 where sno="A04";