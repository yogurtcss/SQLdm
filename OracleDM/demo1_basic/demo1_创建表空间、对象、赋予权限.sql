<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
-- 2020-02-01 10:54:37

/* 创建表空间 
 此表空间yogurt1 将会在PLSQL13的 Tablespaces 下出现
*/
-- create tablespace yogurt1   -- 表空间名为yogurt1
-- datafile 'H:\ProcExes\SQLFiles\SQLdm\OracleDM\DBFs\yogurt1.dbf'  -- 指定 此表空间生成的数据文件的真实地址
-- size 100m      -- 初始时100M的大小
-- autoextend on  -- 当指定的100M不够用时，自动增长大小
-- next 10m;      -- 开启自动扩展后，每次扩展的步长10m，注意英文分号结尾

-- drop tablespace yogurt1;  -- 删除表空间

/* 创建用户
 此用户yo1 将会在PLSQL13的 Users 下出现 

 Oracle数据库的特点：表和 “其他数据库对象” 都是存储在【用户】之下。
*/
-- create user yo1     -- 指定 用户名yo1
-- identified by root  -- 指定 用户名的密码为root
-- default tablespace yogurt1;  -- 指定 yo1的默认使用的表空间为 yogurt1

/* 新创建的用户 yo1 没有任何权限，需要由超级管理员sys为yo1赋予角色(权限)
  connect角色  ——基本权限
  resource角色 ——开发人员的权限
  dba角色      ——最高权限，等于sys
*/
-- grant dba to yo1;
=======
-- 2020-02-01 10:54:37

/* 创建表空间 
 此表空间yogurt1 将会在PLSQL13的 Tablespaces 下出现
*/
-- create tablespace yogurt1   -- 表空间名为yogurt1
-- datafile 'H:\ProcExes\SQLFiles\SQLdm\OracleDM\DBFs\yogurt1.dbf'  -- 指定 此表空间生成的数据文件的真实地址
-- size 100m      -- 初始时100M的大小
-- autoextend on  -- 当指定的100M不够用时，自动增长大小
-- next 10m;      -- 开启自动扩展后，每次扩展的步长10m，注意英文分号结尾

-- drop tablespace yogurt1;  -- 删除表空间

/* 创建用户
 此用户yo1 将会在PLSQL13的 Users 下出现 

 Oracle数据库的特点：表和 “其他数据库对象” 都是存储在【用户】之下。
*/
-- create user yo1     -- 指定 用户名yo1
-- identified by root  -- 指定 用户名的密码为root
-- default tablespace yogurt1;  -- 指定 yo1的默认使用的表空间为 yogurt1

/* 新创建的用户 yo1 没有任何权限，需要由超级管理员sys为yo1赋予角色(权限)
  connect角色  ——基本权限
  resource角色 ——开发人员的权限
  dba角色      ——最高权限，等于sys
*/
-- grant dba to yo1;
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 10:54:37

/* 创建表空间 
 此表空间yogurt1 将会在PLSQL13的 Tablespaces 下出现
*/
-- create tablespace yogurt1   -- 表空间名为yogurt1
-- datafile 'H:\ProcExes\SQLFiles\SQLdm\OracleDM\DBFs\yogurt1.dbf'  -- 指定 此表空间生成的数据文件的真实地址
-- size 100m      -- 初始时100M的大小
-- autoextend on  -- 当指定的100M不够用时，自动增长大小
-- next 10m;      -- 开启自动扩展后，每次扩展的步长10m，注意英文分号结尾

-- drop tablespace yogurt1;  -- 删除表空间

/* 创建用户
 此用户yo1 将会在PLSQL13的 Users 下出现 

 Oracle数据库的特点：表和 “其他数据库对象” 都是存储在【用户】之下。
*/
-- create user yo1     -- 指定 用户名yo1
-- identified by root  -- 指定 用户名的密码为root
-- default tablespace yogurt1;  -- 指定 yo1的默认使用的表空间为 yogurt1

/* 新创建的用户 yo1 没有任何权限，需要由超级管理员sys为yo1赋予角色(权限)
  connect角色  ——基本权限
  resource角色 ——开发人员的权限
  dba角色      ——最高权限，等于sys
*/
-- grant dba to yo1;
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
=======
-- 2020-02-01 10:54:37

/* 创建表空间 
 此表空间yogurt1 将会在PLSQL13的 Tablespaces 下出现
*/
-- create tablespace yogurt1   -- 表空间名为yogurt1
-- datafile 'H:\ProcExes\SQLFiles\SQLdm\OracleDM\DBFs\yogurt1.dbf'  -- 指定 此表空间生成的数据文件的真实地址
-- size 100m      -- 初始时100M的大小
-- autoextend on  -- 当指定的100M不够用时，自动增长大小
-- next 10m;      -- 开启自动扩展后，每次扩展的步长10m，注意英文分号结尾

-- drop tablespace yogurt1;  -- 删除表空间

/* 创建用户
 此用户yo1 将会在PLSQL13的 Users 下出现 

 Oracle数据库的特点：表和 “其他数据库对象” 都是存储在【用户】之下。
*/
-- create user yo1     -- 指定 用户名yo1
-- identified by root  -- 指定 用户名的密码为root
-- default tablespace yogurt1;  -- 指定 yo1的默认使用的表空间为 yogurt1

/* 新创建的用户 yo1 没有任何权限，需要由超级管理员sys为yo1赋予角色(权限)
  connect角色  ——基本权限
  resource角色 ——开发人员的权限
  dba角色      ——最高权限，等于sys
*/
-- grant dba to yo1;
>>>>>>> 3fb8429d0286df72def7d992663f6a2bb16e53d9
