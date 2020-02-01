/* 2020-02-01 21:15:56 
 Jdbc_Oracle1的Maven工程中使用的存储过程 p_yearsal
*/

-- create or replace procedure p_yearsal(eno emp.empno%type, yearsal out number)
-- is
--    s number(10);
--    c emp.comm%type;
-- begin
--    select sal*12, nvl(comm, 0) into s, c from emp where empno = eno;
--    yearsal := s+c;
-- end;

-- drop procedure p_yearsal;