use db1;

/* 查询表；  []中皆为可选的语句
 
 select  [all-默认的 | distinct-去除重复的显示结果]   -- 默认为all

    <列名1> [as 别名1] , 
    <列名2> [as 别名2] , 
    ...,
    <列名n> [as 别名n] , 
  
  from
    <表名1> [as 表的别名1],
    <表名2> [as 表的别名2],
    ...,
    <表名n> [as 表的别名n],

   [where <检索条件>]
   [group by <列名x> [having <条件表达式>]   ]    -- 针对：从where条件中得出的行(记录)，根据 having中的条件，按 x列的值不同 分成不同的组(同一组中，x列的值相同)
   
   [order by 
        <列名y1> [asc升序 | desc降序 ],
        <列名y2> [asc升序 | desc降序 ],
        ...,
        <列名yn> [asc升序 | desc降序 ]   
    ]      -- 将最终的查询结果按 列y1、y2、yn 进行 升序或降序 排序
   
   [limit 分页限定]
  
  -------------------------------------------------------------------------------------
  关于with ties：
   指定从基本结果集中返回额外的行，
   对于 ORDER BY 列中指定的排序方式参数，这些额外的返回行的该参数值与 TOP n (PERCENT) 行中的最后一行的该参数值相同。
   只能在 SELECT 语句中且只有在指定了 ORDER BY 子句之后，才能指定 TOP...WITH TIES。
   
   人话如下：
    使用 with ties 关键字后：
    如果按照 order by 参数排序 TOP n（PERCENT）返回了前面 n（pencent）个记录，
    但是 此时若 n+1…n+k 条记录和排序后的第 n 条记录的参数值（order by 后面的参数）相同，
    则 n+1、…、n+k 也返回。n+1、…、n+k 就是额外的返回值，
    这堆额外的相同值也会被 “返回”

-------------------------------------------------------------------------------------
 注：(1)在 insert，update，delete 语句中，
 top后面的 expression 需要用 () 括起来，即 top(expression)
 (2)MySQL 不支持 select top n 、 with ties 的语法

*/
/* select math+PE+ifnull(math,100) as total from stu; */
/* 计算数值型的列：
 (1)用四则运算符号连接两个列名，如 math+PE
 (2)ifnull( exp1, exp2 )
  判断exp1是否为null；若exp1为null，则用exp2代替原exp1的null空值
  如：ifnull(math,100)，判断math的值是否为空，若为空则用100代替原math的空值
*/


/* where中的条件查询
  >     <
  >=    <=
  =     <>不等于
  
  某列名x  between 值1 and 值2    
    #针对原表中 名为x的列，选取 [值1，值2]此范围内的 元组
    -- 在 MySQL 中，between...and...包含了 value1 和 value2 边界值，是闭区间
    -- not  between...and... 即对 between...and的结果取反
  
  某列名x  in(值val1，值val2，..., 值valn)  
    #针对原表中 名为x的列，选取 值为给定的val1、val2、...、valn的 元组；
    其中val1、val2、...、valn 可以是数值型或字符串型
    -- not  in 即对 in的结果取反
    -- 更多情况下，in中所指定的值是不明确的，而可能是通过一个子查询得到的： 某列名 in 子查询1 or ...
  
  某列名x  like  "某字符 【占位符】"
    #针对原表中 名为x的列，进行模糊查询
      _ 单下划线：单个任意字符；
      % 单百分号：多个任意字符；
    
      举例如下(特别注意 _ 的用法)：
      (1)% 某字符，   表示 【此字符前】可以是【多个任意字符】
      (2)某字符 %，   表示【此字符后】可以是【多个任意字符】
      (3) _ _ _ 三个单下划线(三个占位符)，表示 可任意匹配 三个字符 的字符串
        如：查询名字是三个字的人(使用了3个占位符-单下划线，注意要加引号！)
        select * from student where(name like "_ _ _");
  
  
  and 与      -- 第二种写法 &&
  or  或      -- 第二种写法 ||
  not 非      -- 第二种写法 !

*/

-- 插入一个 名字为三个字 的女人
/* insert into stu(sno,sname,sex,math,PE) values("A05","马冬梅","女",5,6); */
/* select * from stu where(sname like '___');   -- 查询名字是三个字的人(使用了3个占位符-单下划线，注意要加引号！) */


/* 聚合函数：将一列数据作为一个整体，进行纵向的计算
 1.count(column_name) 返回指定列的值的数目（NULL不计入）
  -select count(*) from 表名; 返回表中的总记录数(总行数)
 
 2.max
 3.min
 4.sum
 5.avg 计算平均值

*/

/* 分页查询
 分页实际上就是从结果集中 “截取” 出第 M~N 条记录。
 格式： limit <结果集的显示条数M> offset <结果集中的索引n，从0开始>
 将结果集分成若干页(具体不知道分了多少页),
 limit 3 offset 0， 表示 限制显示每页3条记录，获取第1页的记录 

 如果要查询第2页，那么我们只需要 “跳过” 头3条记录，即：把 结果集中的下标offset设为3
 limit 3 offset 3,  表示 限制显示每页3条记录，获取第2页的记录

 查询第3页，则跳过前6跳记录，offset为6
 limit 3 offset 6
*/