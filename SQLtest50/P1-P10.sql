use db50;
/* 1. 查询 "01" 课程比 "02" 课程成绩高的学生的信息及课程分数
    1.1 查询同时存在 "01" 课程和 "02" 课程的情况
    1.2 查询存在 "01" 课程但可能不存在 "02" 课程的情况 (不存在时显示为 null)
    1.3 查询不存在 "01" 课程但存在 "02" 课程的情况 */


/* 1. 查询 "01" 课程比 "02" 课程成绩高的学生的信息及课程分数
 注：这应该是 针对同一名学生：比较其"01" 课程比 "02" 课程成绩，
 若 此学生的 "01" 课程比 "02" 课程成绩高，就选出此学生的 信息及课程分数
*/
select score 
from SC
where sid = "01";