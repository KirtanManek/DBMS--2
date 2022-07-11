-- 1. Display all the employees whose name starts with “m” and 4 th character is “h”.
select *
from Employee
where EName like 'M__h%'


-- 2. Find the value of 3 raised to 5. Label the column as output.
select power(3, 5) as Output


-- 3. Write a query to subtract 20 days from the current date.
select getdate() 'Today', dateadd(day, -20, getdate()) 'Today - 20 days'


-- 4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.
select Employee.EName 
from Employee
where EName like 'j%' and EName like '%n%'


-- 5. Display 2nd to 9th character of the given string “SQL Programming”.
select substring('SQL Programming', 2, 8)


-- 6. Display name of the employees whose city name ends with “ney” &contains six characters.
select *
from Employee
where city like '%ney' and city like '______'


-- 7. Write a query to convert value 15 to string.
select cast(15 as varchar)


-- 8. Add department column with varchar (20) to Employee table.
alter table Employee 
add Department varchar(20)


-- 9. Set the value of department to Marketing who belongs to London city.
update Employee 
set Department = 'Marketing' 
where city = 'London'


-- 10. Display all the employees whose name ends with either “n” or “y”.
select Employee.EName
from Employee
where EName like '%n' or EName like '%y'


-- 11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.
select CEILING(63.1), CEILING(63.8), CEILING(-63.2)


-- 12. Display all employees whose joining date is not available.
select *
from Employee
where JoiningDate is null


-- 13. Display name of the employees in capital letters and city in small letters.
select upper(EName), lower(city)
from Employee


-- 14. Change the data type of Ename from varchar (30) to char (30).
alter table Employee 
alter column EName char(30)


-- 15. Display city wise maximum salary.
select city, max(Salary)
from Employee
group by city


-- 16. Produce output like <Ename> works at <city> and earns <salary> (In single column).
select concat(rtrim(EName) , ' works at' , city , ' and earns ' , Salary)
from Employee


-- 17. Find total number of employees whose salary is more than 5000.
select count(EName)
as 'Total Employees'
from Employee
where Salary > 5000


-- 18. Write a query to display first 4 & last 3 characters of all the employees.
select left(EName, 4), right(rtrim(EName), 3)
from Employee


-- 19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.
select city, sum(salary)
from Employee
where JoiningDate > '2014-01-01'
group by city
having sum(Salary) > 15000


-- 20. Write a query to replace “u” with “oo” in Ename.
select replace(EName, 'u', 'oo')
from Employee


-- 21. Display city with average salaries and total number of employees belongs to each city.
select city, avg(Salary), count(EID)
from Employee
group by city


-- 22. Display total salaries paid to female employees.
select sum(Salary) as 'Total salaries paid to female employees'
from Employee


-- 23. Display name of the employees and their experience in years.
--select EName, dateadd(year, getdate(), -JoiningDate)
--from Employee


-- 24. Remove column department from employee table.
alter table Employee 
drop column Department


-- 25. Update the value of city from syndey to null.
update Employee
set city = null
where city = 'Sydney'


-- 26. Retrieve all Employee name, Salary & Joining date.
select EName, Salary, JoiningDate
from Employee


-- 27. Find out combine length of Ename & Gender.
select len(EName) + len(Gender)
from Employee


-- 28. Find the difference between highest & lowest salary.
select max(Salary) - min(Salary)
from Employee


-- 29. Rename a column from Ename to FirstName.
sp_rename 'Employee.EName', 'FirstName', 'column'


-- 30. Rename a table from Employee to EmpMaster.
sp_rename 'Employee', 'EmpMaster'
