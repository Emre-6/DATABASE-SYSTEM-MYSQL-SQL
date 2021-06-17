--This file includes examples for SE222 course
--Create your database or use the one you have created
--Execute "DLL+drop.sql" using your database
--Execute "smallRelationsInsertFile.sql" using your database
--With use command give name of your database
use university;
go
-- 1.Find the names of all the instructors from Biology department
select name from instructor where dept_name='Biology';

-- 2.Find the names of courses in Computer science department 
--which have 3 credits 'Comp. Sci.'
select title from course where credits=3 and dept_name='Comp. Sci.';

-- 3.For the student with ID 12345 (or any other value), 
--show all course_id and title of all courses registered 
--for by the student
select course_id, title 
from course where course_id in 
(select course_id from takes where ID='12345');

--It may be better to take control of your queries 
--using joins depending on your tables and queries
select course.course_id, course.title 
from course inner join takes on course.course_id=takes.course_id 
where takes.ID='12345'; 

-- 4.As above, but show the total number of credits 
--for such courses (taken by that student). 
--Don't display the tot_creds value from the student 
--table, you should use SQL aggregation on courses taken by the student.

select sum(credits) 
from course 
where course_id in (select distinct course_id from takes where ID='12345');

--It may be better to take control of your queries 
--using joins depending on your tables and queries
select sum(course.credits) 
from course inner join takes on course.course_id=takes.course_id 
where takes.ID='12345';

-- 5.As above, but display the total credits for each of the students, 
--along with the ID of the student; 
--don't bother about the name of the student. (Don't bother about 
--students who have not registered for any course, they can be omitted) 

select ID,sum(credits) as 'total course credits' 
from takes, course where takes.course_id=course.course_id group by ID;

-- 6.Find the names of all students who have taken any 
--Comp. Sci. course ever (there should be no duplicate names)

select distinct name 
from student, takes 
where takes.ID=student.ID and takes.course_id in 
(select course_id from course where dept_name='Comp. Sci.');

-- 7.Display the IDs of all instructors who have never 
--taught/teaching a couse.
(select distinct ID from instructor) except 
(select distinct ID from teaches)

-- 8.As above, but display the names of the instructors also, 
--not just the IDs.
select name, ID from instructor where ID in 
((select distinct ID from instructor) except 
(select distinct ID from teaches))