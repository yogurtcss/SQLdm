use db50;

/* select cid
from Course
where tid = (select tid from Teacher where tname="张三"); */

select sid
from SC
where
    cid = (select cid
            from Course
            where tid = (select tid from Teacher where tname="张三") ) ;