<<<<<<< HEAD

-- 2020-02-01 15:20:45

-- select * from scott.emp;

/* 复制表结构及其数据：
 create table 新表 as (select * from 旧表) 
*/

-- create table emp as (select * from scott.emp);

/* 视图的作用？
 1.视图可以屏蔽掉一些敏感字段。
 2.保证总部和分部数据及时统一。
*/

---创建视图【必须有dba权限】
-- create view v_emp as (select ename,job from emp);
-- select * from v_emp;

declare
-- 变量名   数据类型    :=(赋值运算符)   值
    i      number(2)     :=            10;
    s      varchar2(10)  :=            '小明';

    /* 引用型变量，即 变量ena 的类型与【emp表中ename列】的类型 一样
    使用 %type 特性的优点在于：
    1.所引用的数据库列的数据类型可以不必知道；
    2.所引用的数据库列的数据类型可以实时改变。
    
    通过 select...into... 语句为【引用型变量】赋值
    select 列名 into 变量名 from 表名 where 条件
    
    如 select 列名ename into 变量名ena  where id=XXX
    */
    ena    emp.ename%type;    -- 引用型变量

    /* 记录型变量%rowtype 定义一个表示表中一行(多列)记录的变量 
    格式为：变量名emprow   表名emp%rowtype
    
    注：记录型变量%rowtyp也使用 select...into... 语句 进行赋值
    一行记录的各列 与 表中一行的各列 有相同的名称和数据类型
    当使用where字段确定某行id时，变量emprow.各列名X 可取到该列下的值；
    */
    emprow  emp%rowtype;      -- 记录型变量
begin
    /* dbms_output.put_line(...) 的功能：
    类似于 Java 中的 System.out.println() 直接将输出结果送到标准输出中 
    */
    dbms_output.put_line(i);
    dbms_output.put_line(s);
    -- 引用型变量的赋值
    select ename into ena from emp where empno=7788;
    dbms_output.put_line(ena);
    -- 记录型变量的赋值
    select * into emprow from emp where empno=7788;
    dbms_output.put_line( emprow.ename || '的工作为：' || emprow.job );
    -- 两竖 || 表示拼接字符串，等于 java拼字符串中的 里的 +
=======
-- 2020-02-01 15:20:45

-- select * from scott.emp;

/* 复制表结构及其数据：
 create table 新表 as (select * from 旧表) 
*/

-- create table emp as (select * from scott.emp);

/* 视图的作用？
 1.视图可以屏蔽掉一些敏感字段。
 2.保证总部和分部数据及时统一。
*/

---创建视图【必须有dba权限】
-- create view v_emp as (select ename,job from emp);
-- select * from v_emp;

declare
-- 变量名   数据类型    :=(赋值运算符)   值
    i      number(2)     :=            10;
    s      varchar2(10)  :=            '小明';

    /* 引用型变量，即 变量ena 的类型与【emp表中ename列】的类型 一样
    使用 %type 特性的优点在于：
    1.所引用的数据库列的数据类型可以不必知道；
    2.所引用的数据库列的数据类型可以实时改变。
    
    通过 select...into... 语句为【引用型变量】赋值
    select 列名 into 变量名 from 表名 where 条件
    
    如 select 列名ename into 变量名ena  where id=XXX
    */
    ena    emp.ename%type;    -- 引用型变量

    /* 记录型变量%rowtype 定义一个表示表中一行(多列)记录的变量 
    格式为：变量名emprow   表名emp%rowtype
    
    注：记录型变量%rowtyp也使用 select...into... 语句 进行赋值
    一行记录的各列 与 表中一行的各列 有相同的名称和数据类型
    当使用where字段确定某行id时，变量emprow.各列名X 可取到该列下的值；
    */
    emprow  emp%rowtype;      -- 记录型变量
begin
    /* dbms_output.put_line(...) 的功能：
    类似于 Java 中的 System.out.println() 直接将输出结果送到标准输出中 
    */
    dbms_output.put_line(i);
    dbms_output.put_line(s);
    -- 引用型变量的赋值
    select ename into ena from emp where empno=7788;
    dbms_output.put_line(ena);
    -- 记录型变量的赋值
    select * into emprow from emp where empno=7788;
    dbms_output.put_line( emprow.ename || '的工作为：' || emprow.job );
    -- 两竖 || 表示拼接字符串，等于 java拼字符串中的 里的 +
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 15:20:45

-- select * from scott.emp;

/* 复制表结构及其数据：
 create table 新表 as (select * from 旧表) 
*/

-- create table emp as (select * from scott.emp);

/* 视图的作用？
 1.视图可以屏蔽掉一些敏感字段。
 2.保证总部和分部数据及时统一。
*/

---创建视图【必须有dba权限】
-- create view v_emp as (select ename,job from emp);
-- select * from v_emp;

declare
-- 变量名   数据类型    :=(赋值运算符)   值
    i      number(2)     :=            10;
    s      varchar2(10)  :=            '小明';

    /* 引用型变量，即 变量ena 的类型与【emp表中ename列】的类型 一样
    使用 %type 特性的优点在于：
    1.所引用的数据库列的数据类型可以不必知道；
    2.所引用的数据库列的数据类型可以实时改变。
    
    通过 select...into... 语句为【引用型变量】赋值
    select 列名 into 变量名 from 表名 where 条件
    
    如 select 列名ename into 变量名ena  where id=XXX
    */
    ena    emp.ename%type;    -- 引用型变量

    /* 记录型变量%rowtype 定义一个表示表中一行(多列)记录的变量 
    格式为：变量名emprow   表名emp%rowtype
    
    注：记录型变量%rowtyp也使用 select...into... 语句 进行赋值
    一行记录的各列 与 表中一行的各列 有相同的名称和数据类型
    当使用where字段确定某行id时，变量emprow.各列名X 可取到该列下的值；
    */
    emprow  emp%rowtype;      -- 记录型变量
begin
    /* dbms_output.put_line(...) 的功能：
    类似于 Java 中的 System.out.println() 直接将输出结果送到标准输出中 
    */
    dbms_output.put_line(i);
    dbms_output.put_line(s);
    -- 引用型变量的赋值
    select ename into ena from emp where empno=7788;
    dbms_output.put_line(ena);
    -- 记录型变量的赋值
    select * into emprow from emp where empno=7788;
    dbms_output.put_line( emprow.ename || '的工作为：' || emprow.job );
    -- 两竖 || 表示拼接字符串，等于 java拼字符串中的 里的 +

=======
-- 2020-02-01 15:20:45

-- select * from scott.emp;

/* 复制表结构及其数据：
 create table 新表 as (select * from 旧表) 
*/

-- create table emp as (select * from scott.emp);

/* 视图的作用？
 1.视图可以屏蔽掉一些敏感字段。
 2.保证总部和分部数据及时统一。
*/

---创建视图【必须有dba权限】
-- create view v_emp as (select ename,job from emp);
-- select * from v_emp;

declare
-- 变量名   数据类型    :=(赋值运算符)   值
    i      number(2)     :=            10;
    s      varchar2(10)  :=            '小明';

    /* 引用型变量，即 变量ena 的类型与【emp表中ename列】的类型 一样
    使用 %type 特性的优点在于：
    1.所引用的数据库列的数据类型可以不必知道；
    2.所引用的数据库列的数据类型可以实时改变。
    
    通过 select...into... 语句为【引用型变量】赋值
    select 列名 into 变量名 from 表名 where 条件
    
    如 select 列名ename into 变量名ena  where id=XXX
    */
    ena    emp.ename%type;    -- 引用型变量

    /* 记录型变量%rowtype 定义一个表示表中一行(多列)记录的变量 
    格式为：变量名emprow   表名emp%rowtype
    
    注：记录型变量%rowtyp也使用 select...into... 语句 进行赋值
    一行记录的各列 与 表中一行的各列 有相同的名称和数据类型
    当使用where字段确定某行id时，变量emprow.各列名X 可取到该列下的值；
    */
    emprow  emp%rowtype;      -- 记录型变量
begin
    /* dbms_output.put_line(...) 的功能：
    类似于 Java 中的 System.out.println() 直接将输出结果送到标准输出中 
    */
    dbms_output.put_line(i);
    dbms_output.put_line(s);
    -- 引用型变量的赋值
    select ename into ena from emp where empno=7788;
    dbms_output.put_line(ena);
    -- 记录型变量的赋值
    select * into emprow from emp where empno=7788;
    dbms_output.put_line( emprow.ename || '的工作为：' || emprow.job );
    -- 两竖 || 表示拼接字符串，等于 java拼字符串中的 里的 +
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
end; 