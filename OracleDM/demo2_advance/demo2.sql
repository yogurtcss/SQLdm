/* 2020-02-01 18:07:11
 解决了vscode中 SQLdm提交不了的问题： 
 因为这个文件夹OracleDM/DBFs/YOGURT1.DBF这数据库文件超过100M
 不能提交到GitHub上！！

 解决：时光倒流术，不断地进行“撤销上一次的更改”，
 把 OracleDM/DBFs/YOGURT1.DBF 这文件添加到 .gitignore (忽略提交的清单) 中
 然后才“合并冲突”、提交、推送成功的！
*/