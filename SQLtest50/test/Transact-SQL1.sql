/* 2019-12-20 12:29:31
 终于到了 Transact SQL环节了！
*/

/* 一、变量
 1.全局变量：不是由用户的程序定义的，而是由系统定义和维护的。
 用户只能读取全局变量的值，而不能对它们进行修改或管理
 使用全局变量时 必需以 @@ 开头(两个@符号连着写！)

 2.局部变量：用户可自定义的变量
 局部变量在程序中 通常用来储存从表中查询到的数据，
 或当作 程序执行过程中的暂存变量
 
 ▲ 用户自定定义的变量名，格式为 @variable_name
 其中 variable_name 由字母、数字、字符组成。 
 
 ▲ 用户定义的变量不区分大小写。 如 @id和 @ID是一样的。

---------------------------------------------------
 ▲ MySQL中的 变量赋值

 1.使用 SET 语句
  [赋值符号为]    := 或 = 均可作为 SET 语句中的赋值运算符
  [格式为]     SET @variable_name变量名  :=  value给定的值;
  或者         SET @variable_name变量名   =  value给定的值;
  
  如 SET @counter := 100;


  2.使用 SELECT 语句
   [赋值符号为]  必须使用 := 赋值运算符，因为：【在 SELECT 语句中，MySQL 将 = 运算符视为 “相等运算符”】。
   [格式为]     SELECT @variable_name变量名  :=  value给定的值;

   如 SELECT  @msrp:=MAX(msrp)  FROM  products表名;


*/
use db50;

/* select @cid := count(cid) as hahah
from Course; */


-- 创建测试表 testRank
/* create table testRank(
   id int primary key auto_increment,
   score int not null
); */

/* insert into testRank values( 1,99 );
insert into testRank values( 2,80 );
insert into testRank values( 3,87 );
insert into testRank values( 4,60 );
insert into testRank values( 5,80 );
insert into testRank values( 6,99 ); */

/* select * from testRank; */

/* 按照上面的需求,我们可以知道我们是要做一个按照分数（score）查询的一个功能，
只不过是要给排序好的结果加上一个我们想要的名次。
我们笨想：我们要想知道某个分数排第几名，是不是知道有几个比它大就行了。
如果有零个比它大的，那么它就是第一名，如果只有一个比它大，
那么它就是第二名。以此类推就好了。 
*/


/* 第一步：
 select id,score, rank 
 from testRank 
 order by  rank;
 就是这个查询语句。但是我们testRank表中没有rank这个字段，
 所以就要分成俩个一样的表，做子查询，来查rank。 
*/

/* select id, score,  (select count(distinct(score)) from testRank as biao02 where biao02.score>biao01.score)+1 as rank
from testRank as biao01
order by rank; */

-- 先查出不重复的分数：99、80、87、60
/* select distinct(score)
from testRank; */

/* 假设：我自己是80分。查询 高于80分的 有几人？
 得到：有2人高于80分，那么我就排在第3位了！
 
 结论：自己分数所在排名 = 比自己高分的人数 + 1
*/
/* select count(distinct(score)) as higherNum
from testRank
where testRank.score>80;  -- 大于谁？怎么比较？ */

/* 大于谁？怎么比较？
 思路：针对同一张表 score：(画图可知)
 先选出一个【不重复-暗示distinct】的分数清单，
 然后依据这个分数清单，逐个与 原分数表比较！！
 (因为要给每个同学排名，所以每个同学都要和分数清单上所列分数进行比较！！)
 得出 比我高分的人数， +1 就是我的排名
*/

/* select id, score,  ( select count(distinct(score)) from (testRank as biao02) where biao02.score>biao01.score )+1 as rank
from (testRank as biao01)
order by rank; */

-- 15.按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺(即：可以出现 并列排名)

-- 注意，固定一科 cid=01 或 cid=02 或 cid=03 时，查询排名


-- 参考答案
/* select a.cid, a.sid, a.score, count(b.score)+1 as rank
from 
   sc as a 
   left join sc as b 
   -- b表的分数高于a表分数
   -- count(b.score) 表示 b分数高于a分数的 有多少人
   on a.score<b.score and a.cid = b.cid
group by a.cid, a.sid, a.score
order by a.cid, rank ASC; */



/* select biao01.cid, biao01.sid, biao01.score, count(biao02.score)+1 as rank
from
   SC as biao01,
   SC as biao02
where
   biao01.cid = biao02.cid and
   biao01.score < biao02.score -- 若直接使用自然连接，则会损失部分数据：相等的分数不参与排名了！

   -- 为了能显示所有分数，应使用 左外连接 或右外连接！
group by biao01.cid, biao01.sid, biao01.score
order by biao01.cid, rank asc ; */

/* 计算: 比我高分的有几人?
 
 从biao02选出的,都是比biao01高分的人
 统计: biao02中比biao01高分的 有几人?
*/
select biao01.*, count(biao02.score)+1 as rank
from
   (SC as biao01)
   left join
   (SC as biao02)
   on
      biao01.cid=biao02.cid and
      biao01.score<biao02.score  -- 从biao02选出的,都是比biao01高分的人
group by biao01.cid, biao01.sid
order by biao01.cid, rank asc;


