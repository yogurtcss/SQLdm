/* Redis案例练习 
*/
use db1;

/* create table province(
    id int primary key auto_increment, 
    name varchar(30) not null
); */

/* id 列设置为 AUTO_INCREMENT 以后，在 insert 语句中，
 如果 id 列为空，
 或者 id 列值为 0 (SQL Mode 不是 NO_AUTO_VALUE_ON_ZERO)，
 或者 id 列值 NULL (id 列为 NOT NULL)，
 那么 id 依旧会自动增长。
 */

/* insert into province values( null, "北京" ); -- id为null时，id 依旧会自动增长
insert into province values( null,"上海"  );
insert into province values( null,"深圳"  );
insert into province values( null,"陕西"  ); */

select * from province;