-- 2020-02-01 20:13:44

/* 存储过程：提前已经编译好的一段pl/sql语言，放置在数据库端
 可以直接被调用。这一段pl/sql一般都是固定步骤的业务。
 
 创建存储过程的语法： 

 -- 传入形参的个数、类型可以任意，但是【不允许指定长度】 
 create [or replace] procedure 过程名 [ (参数名 in/out 数据类型 ) ]  -- 传入形参的个数、类型可以任意，但是【不允许指定长度】 
 as  
 begin 
        PLSQL 子程序体；
 end; 


 或者：

 -- 传入形参的个数、类型可以任意，但是【不允许指定长度】 
 create [or replace] procedure 过程名 [ (参数名 in/out 数据类型) ]  -- 传入形参的个数、类型可以任意，但是【不允许指定长度】
 is 
 begin 
        PLSQL 子程序体；
 end  过程名; 
 //若使用了 is 关键字，则最底下end时还要写上过程名，麻烦，我不用这种格式辣！
 

 注意 传入形参中的 in out
 in模式参数——in修饰的参数
 out模式参数——out修饰的参数

 
 1.in修饰的形参：表示接收参数。在PLSQL子程序内部，【不能对 in修饰的形参】进行赋值(修改等)操作；默认的参数模式是in。
 2.out修饰的形参：用于输出值，会忽略传入的值。在子程序内部可以对其进行赋值修改。
 输出：子程序执行完毕后，out模式参数最终的值 会 赋值给调用时对应的 <实参变量>。

Oracle存储过程没有返回值；
Oracle存储过程的 “所有返回值”，都是通过 out 参数来替代的；

*/

-- 测试in模式的存储过程
-- create procedure testIn( x1 in int, x2 in int )
-- as
-- begin
--     dbms_output.put_line(x1);
--     dbms_output.put_line(x2);
--     --  x2 := 100;  -- in模式参数(in修饰的参数)，不能为其赋值
-- end;

-- 通过语句块调用存储过程
-- begin
--     testIn( 10,100 );
-- end;

-- drop procedure testIn;  -- 删除某个存储过程

-- 测试out模式的存储过程
-- create procedure testOut( x out int )
-- as
-- begin
--     dbms_output.put_line(x);  -- 传入的实参值
--     x := 2333;  -- 设定存储过程调用后的值
-- end;

-- 通过语句块调用存储过程
-- declare
--     y int := 10;  -- 声明一个实参变量，调用存储过程之前的值为10
-- begin
--     dbms_output.put_line( '调用存储过程之前的y值：'|| y );
--     testOut(y); -- 调用存储过程testOut重新为y赋值
--     -- out模式参数最后的值 为 传入的实参y 赋值嗷！
--     dbms_output.put_line( '调用存储过程之后的y值：'|| y );
-- end;

-- drop procedure testOut;