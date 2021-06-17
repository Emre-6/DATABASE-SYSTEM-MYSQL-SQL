-- Question 1--
select DEPARTMENTNAME,count(CLASSROOMID) as NumberOfClasses
from university_sample.classroom join university_sample.department
on classroom.DEPTID = department.DEPARTMENTID
group by classroom.DEPTID
order by NumberOfClasses desc;

--Question 2--
create view ClassCount as (select DEPARTMENTNAME,count(CLASSROOMID) as NumberOfClasses
from university_sample.classroom join university_sample.department
on classroom.DEPTID = department.DEPARTMENTID
group by classroom.DEPTID
order by NumberOfClasses desc);

--Question 3----
select DEPARTMENTNAME,count(ProfessorID) as NumberOfProfessors
from university_sample.professor join university_sample.department
on professor.DEPTID = department.DEPARTMENTID
group by professor.DEPTID
order by NumberOfProfessors desc;

--Question 4--
create view professorCount as (select DEPARTMENTNAME,count(ProfessorID) as NumberOfProfessors
from university_sample.professor join university_sample.department
on professor.DEPTID = department.DEPARTMENTID
group by professor.DEPTID
order by NumberOfProfessors desc);

--Question 5 ----
select DEPARTMENTNAME,department.NUMBEROFSTUDENTS / count(ProfessorID) as Average
from university_sample.professor join university_sample.department on professor.DEPTID = department.DEPARTMENTID
group by professor.DEPTID
order by Average desc;

--Question 6--
use university_sample;
create view temp1 as (select DEPARTMENTNAME,count(CLASSROOMID) AS classCount
from university_sample.classroom join university_sample.department on classroom.DEPTID = department.DEPARTMENTID
where CLASSTYPE = 'Classroom'
group by classroom.DEPTID);
create view temp2 as (select DEPARTMENTNAME,count(CLASSROOMID) as labCount
from university_sample.classroom join university_sample.department on classroom.DEPTID = department.DEPARTMENTID
where CLASSTYPE = 'Lab'
group by classroom.DEPTID);
create table classDeptSummary as( select * from temp1 natural join temp2);
drop view temp1;
drop view temp2;
select * from classdeptsummary;

--Question 7---
use university_sample;
create view SummaryClass as (select * from
(select DEPARTMENTNAME,count(CLASSROOMID) AS classCount
from university_sample.classroom join university_sample.department on classroom.DEPTID = department.DEPARTMENTID
where CLASSTYPE = 'Classroom'
group by classroom.DEPTID
order by DEPARTMENTNAME
)  as Table1 natural join
(select DEPARTMENTNAME,count(CLASSROOMID) as labCount
from university_sample.classroom join university_sample.department on classroom.DEPTID = department.DEPARTMENTID
where CLASSTYPE = 'Lab'
group by classroom.DEPTID
order by DEPARTMENTNAME
) as Table2
);
--Question8--
select CLASSNAME,CLASSTYPE
from classroom
where DEPTID in(
select DEPARTMENTID from
department
where DEPARTMENTNAME = 'Physics');
--Question9--
select NAME,LASTNAME,NUMBEROFPUBLICATIONS
from professor
where DEPTID in(
select DEPARTMENTID from
department
where DEPARTMENTNAME = 'Computer Engineering')
order by NUMBEROFPUBLICATIONS DESC limit 5;
--Question10--
use university_sample;
select DEPARTMENTID,DEPARTMENTNAME,ANNUALBUDGET,NUMBEROFSTUDENTS,PROFESSORID,NAME,LASTNAME,GENDER,NUMBEROFPUBLICATIONS,CLASSROOMID,CLASSNAME,BUILDING,CAPACITY,CLASSTYPE
from classroom join department on classroom.DEPTID = department.DEPARTMENTID
join professor on department.DEPARTMENTID = professor.DEPTID
order by DEPARTMENTID;



