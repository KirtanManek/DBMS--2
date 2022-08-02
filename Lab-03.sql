--------------------------------------------------------------------------------------------Lab-03--------------------------------------------------------------------------------------------


--1. Find all persons with their department name & code.

Select PersonName, DepartmentCode, DepartmentName
From Person Inner Join Department
On Person.DepartmentID = Department.DepartmentID

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--2. Give department wise maximum & minimum salary with department name.

Select DepartmentName, Max(Salary) as MaxSalary, Max(Salary) as MinSalary
From Person Inner Join Department
On Person.DepartmentID = Department.DepartmentID
Group By DepartmentName

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--3. Find all departments whose total salary is exceeding 100000.

Select DepartmentName, Sum(Salary)
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID
Group By DepartmentName
Having Sum(Salary) > 100000

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--4. Retrieve person name, salary & department name who belongs to Jamnagar city.

Select PersonName, Salary, DepartmentName
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID
Where City = 'Jamnagar'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--5. Find all persons who does not belongs to any department.

Select PersonName
From Person
Where DepartmentID is Null

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--6. Find department wise person counts.

Select DepartmentName, Count(PersonID) as PersonCount
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID
Group By DepartmentName

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--7. Find average salary of person who belongs to Ahmedabad city.

Select PersonName, Avg(Salary) as Average_Salary
From Person
Where City = 'Ahmedabad'
Group By PersonName

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In single column)

Select PersonName + ' Earns ' + Convert(varchar(10), Salary) + ' from department ' + DepartmentName + ' monthly.'
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--9. List all departments who have no persons.

Select DepartmentName as Departments_with_no_persons
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID
Where P.DepartmentID is Null
Group By DepartmentName

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--10. Find city & department wise total, average & maximum salaries.

Select City, DepartmentName, Sum(Salary) as Total_Salary, Avg(Salary) as Avg_Salary, Max(Salary) as Max_Salary
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID
Group By City, DepartmentName

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--11. Display Unique city names.

Select Distinct City
From Person

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--12. List out department names in which more than two persons.

Select DepartmentName as Departments_with_no_persons, Count(PersonID)
From Person P Inner Join Department D
On P.DepartmentID = D.DepartmentID
Group By DepartmentName
Having Count(PersonID) > 2

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--13. Combine person name’s first three characters with city name’s last three characters in single column.

Select Substring(PersonName, 1, 3) + Right(City, 3) as Combination
From Person

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--14. Give 10% increment in Computer department employee’s salary.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--15. Display all the person name’s who’s joining dates difference with current date is more than 365 days.