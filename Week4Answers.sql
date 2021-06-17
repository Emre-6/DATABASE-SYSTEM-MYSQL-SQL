--1.Select and Display set of unique Names from Professor table, how many names are there? (775)
select distinct(professor.NAME) from university_sample.professor

--2.Select and Display every professor from department 11 and 24. How many are there? (58)
select * from university_sample.professor where DEPTID = 11 or DEPTID = 24;

--3. Select all the professors from department 22 - 28 and has a name with second characher A.
select * from university_sample.professor where (DEPTID between 22 and 28) and NAME LIKE '_A%';

-- 4.Select and Display all the professors from departments 1-5 and has number of publications bigger than 56.
select * from university_sample.professor where (DEPTID between 1 and 5) and NUMBEROFPUBLICATIONS>56;

-- 5.Select and Display all the professors that are not from departments 1-24.
select * from university_sample.professor where not (DEPTID between 1 and 24);

--6.Select and Display only the names and capacity of all the classes that are either in building A or B or has a capacity larger than 60
select CLASSNAME,CAPACITY FROM university_sample.classroom 
where BUILDING = 'A' or BUILDING = 'B' or CAPACITY>60

--7. Merge ClassName,Class type and capacity into one column named summary and 
--filter all classes that are in H building or owned by department 7
select concat(ClassName,' ',CLASSTYPE,' ',CAPACITY) as SUMMARY
from university_sample.classroom
where BUILDING = 'H' or DEPTID=7;

--8.-.Display names of professors with number of characters within their names 
select NAME,length(NAME) from university_sample.professor

--9. Display total number of female professors from departments 2,5,7,9  (57)
select count(PROFESSORID) from university_sample.professor where GENDER = 'Female' and DEPTID in(2,5,7,9);

-- 10. Display total number of male professors from departments other than 2,3,6,15,17 and name the field as Subsample
select count(PROFESSORID) as subsample from university_sample.professor where GENDER = 'Male' and DEPTID not in(2,3,6,15,17);

-- 11.Display total number of professor names compared to number of unique professor names with gender being male
select count(distinct(NAME)),count(NAME) from university_sample.professor where gender = 'Male';

--12. Display maximum annual budget assigned to a department
SELECT max(ANNUALBUDGET) FROM university_sample.department;

--13. Display the total budget of uinversity and divide by number of departments to get average budget and Name it as averageBudget.
select sum(ANNUALBUDGET) / count(DEPARTMENTID) as AVgBudget from university_sample.department

--14. Display Name of the top 5 richest departments.
select * from university_sample.department order by ANNUALBUDGET DESC limit 5;

--15. Display full names of professors working for Chemistry and Software Engineering department.
 select NAME,LASTNAME from university_sample.professor , university_sample.department
where department.DEPARTMENTID = professor.DEPTID and (DEPARTMENTNAME in ('Chemistry','Software Engineering'));
