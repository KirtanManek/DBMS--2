--1. Create a view that display first 100 workers details.
CREATE VIEW VW_First100
AS
SELECT TOP 100 *
FROM Person

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--2. Create a view that displays designation wise maximum, minimum & total salaries.
CREATE VIEW VW_Salary
AS
SELECT DesignationName, MAX(Salary) AS MAXIMUM, MIN(Salary) AS MINIMUM, SUM(Salary) AS TOTAL
FROM Person P INNER JOIN Designation DE
ON P.DesignationID = DE.DesignationID
GROUP BY DE.DesignationName

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--3. Create a view that displays Worker’s first name with their salaries & joining date, it also 
--   displays duration column which is difference of joining date with respect to current date.
CREATE VIEW VW_Experience
AS
SELECT FirstName, Salary, JoiningDate, DATEDIFF(year, JoiningDate, GETDATE()) AS Experience
FROM Person

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--4. Create a view which shows department & designation wise total number of workers.
CREATE VIEW VW_TotalWorkers
AS
SELECT DE.DesignationName, D.DepartmentName, COUNT(WorkerID) AS TotalWorkers
FROM Person P INNER JOIN Department D
ON P.DepartmentID = D.DepartmentID INNER JOIN Designation DE
ON P.DesignationID = DE.DesignationID
GROUP BY DE.DesignationName, D.DepartmentName

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--5. Create a view that displays worker names who don’t have either any department or designation.
CREATE VIEW VW_Null
AS
SELECT FirstName
FROM Person
WHERE DepartmentID IS NULL OR DesignationID IS NULL