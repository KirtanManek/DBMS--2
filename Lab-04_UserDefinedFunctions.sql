----------1. Create a table valued function which accepts DepartmentID as a parameter & 
----------	 returns a worker table based on DepartmentID.

CREATE FUNCTION Person_WorkerTableBasedOnDepartmentID(@DepartmentID int)
RETURNS TABLE
AS
RETURN(SELECT * FROM Person WHERE DepartmentID = @DepartmentID);

--SELECT * FROM dbo.Person_WorkerTableBasedOnDepartmentID(2)


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------2. Create a table valued function which returns a table with unique city names from worker table.


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------3. Create a scalar valued function which accepts two parameters start date & end date,
----------	 and returns a date difference in days.

CREATE FUNCTION Date_Difference(
	@StartDate	datetime,
	@EndDate	datetime
)
RETURNS table
AS
RETURN(SELECT DATEDIFF(DAY, @StartDate, @EndDate) AS DateDifference);

--SELECT * FROM dbo.Date_Difference('1990-07-12', '1990-07-22')


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------4. Create a scalar valued function which accepts two parameters year in integer &  
----------   month in integer and returns total days in passed month & year.

CREATE FUNCTION Number_Of_Days(
	@Month  int,
	@Year	int
)
RETURNS table
AS
RETURN(SELECT DATENAME(day, EOMONTH(CAST(CAST(@Year as varchar) + '-' + CAST(@Month as varchar) + '-' + '01' as date))) AS TotalDays)

--Select * from Number_Of_Days(03, 2024)