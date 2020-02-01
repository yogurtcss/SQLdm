/* 2020-02-01 18:07:11
 解决了vscode中 SQLdm提交不了的问题： 
 因为这个文件夹OracleDM/DBFs/YOGURT1.DBF这数据库文件超过100M，
 不能提交到GitHub上！！

 解决：时光倒流术，不断地进行“撤销上一次的更改”，
 把 OracleDM/DBFs/YOGURT1.DBF 这文件添加到 .gitignore (忽略提交的清单) 中
 然后才“合并冲突”、提交、推送成功的！
*/

/* & 是 oracle 里的替代变量。
 如果有一个 &name，在 sqlplus 执行的时候，
 会提示你输入一个 name 对应的值。
 然后 name 的值会替代到 sql 里。
 这里是替代，不是参数绑定，
 所以可以替换 sql 中的静态部分，比如字段名，表名 
*/
-- declare
--     i number(3) := &ii;
-- begin
--     if i<18
--       then dbms_output.put_line('未成年嗷');
--     elsif i<40
--       then dbms_output.put_line('中年人');
--     else
--       then dbms_output.put_line('老年人');
--     end if;
-- end;

/* 
 Oracle &符号与SQL*Plus服务BUG！
 我的电脑上缺失SQL*Plus服务，所以不能用&字符的（替代变量）功能！
 
 运行 set define on;
 报错 Error: ORA-00922: 选项缺失或无效
*/
-- set define on;