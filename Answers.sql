--1.Select and Display all the columns.
select * FROM new_schema.customer

--2.Select and Display only CNAME and CSURNAME columns.
select customer.CNAME,customer.CSURNAME FROM new_schema.customer

--3.Select and Display only CNAME and CSURNAME and CPHONENUMBER.
select customer.CNAME,customer.CSURNAME, customer.CPHONENUMBER from new_schema.customer

--4.Select and Display set of unique Names, how many names are there? (408)
select distinct(customer.CNAME) from new_schema.customer

--5.Select and Display all of the unique phone numbers, how many are there? (926)
select distinct(customer.CPHONENUMBER) from new_schema.customer

--6.Select every customer from State = 45 and display CNAME and CSURNAME. How many people is from this state?
select customer.CNAME,customer.CSURNAME from new_schema.customer where customer.CSTATE = 45

--7.Select and Display all the customers that lives in a state < 45 and CustomerID > 360 and Display Name and Birthdate, how many are there (552)
select customer.CNAME,customer.CBIRTHDATE from new_schema.customer where customer.CSTATE <45 and customer.CUSTOMERID>360
--8.Select all the customers that has a name starting with A and E and display all columns.(143)
select * from customer where customer.CNAME LIKE 'A%' or customer.CNAME LIKE 'E%'

--9.Select and display all the customers name and surname which owns a phone numbers starting with 875. (3)
select customer.CNAME,customer.CSURNAME,customer.CPHONENUMBER from customer where customer.CPHONENUMBER LIKE '(875)%'

--10.Select and display name and phone numbers of people that has a name with second character E.
select customer.CNAME,customer.CPHONENUMBER from customer where customer.CNAME LIKE '_E%'

--11.Select and display all the customers that lives on states 1,5,11,23.
select * from customer where customer.CSTATE IN (1,5,11,23)

--12.Select and display all the customers that doesn’t live on states 2,6,7,8.
select * from customer where customer.CSTATE not IN (2,6,7,8)

--13.Select and display all the customers that doesn’t live on states 2,6,7,8 as well as doesn’t have a last name with second character A.
select * from customer where customer.CSTATE not IN (2,6,7,8) and customer.CSURNAME LIKE '_A%'

--14.	Select and display all the customers that doesn’t live on states 2,6,7,8 as well as doesn’t have a last name with second character A and label it as WantedCustomers.
select concat(concat(Customer.CNAME,' '),customer.CSURNAME) AS 'WANTED' from customer where customer.CSTATE not IN (2,6,7,8) and customer.CSURNAME LIKE '_A%'