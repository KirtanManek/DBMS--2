----------1. All tables Insert, Update & Delete


----Insert in Department table.
CREATE PROCEDURE Department_Insert
@DepartmentID	int,
@DepartmentName	varchar(100)
AS
BEGIN
	INSERT INTO Department
	(
		DepartmentID,
		DepartmentName
	)
	VALUES
	(
		@DepartmentID,
		@DepartmentName
	)
END
--Department_Insert 1, 'Admin'
--Department_Insert 2, 'IT'
--Department_Insert 3, 'HR'
--Department_Insert 4, 'Account'


----Insert in Designation table.
CREATE PROCEDURE Designation_Insert
@DesignationID		int,
@DesignationName	varchar(100)
AS
BEGIN
	INSERT INTO Designation
	(
		DesignationID,
		DesignationName
	)
	VALUES
	(
		@DesignationID,
		@DesignationName
	)
END
--Designation_Insert 11, 'Jobber'
--Designation_Insert 12, 'Welder'
--Designation_Insert 13, 'Clerk'
--Designation_Insert 14, 'Manager'
--Designation_Insert 15, 'CEO'


----Insert in Person table.
CREATE PROCEDURE Person_Insert
@FirstName		varchar(100),
@LastName		varchar(100),
@Salary			decimal(8,2),
@JoiningDate	datetime,
@DepartmentID	int,
@DesignationID	int
AS
BEGIN
	INSERT INTO Person
	(
		FirstName,
		LastName,
		Salary,
		JoiningDate,
		DepartmentID,
		DesignationID
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@Salary,	
		@JoiningDate,
		@DepartmentID,
		@DesignationID
	)
END

-------------------------------------------------------------------------------------------

----Update in Department table.
CREATE PROCEDURE Department_Update
@DepartmentID int,
@DepartmentName varchar(100)
AS
BEGIN
	UPDATE Department SET
	DepartmentName = @DepartmentName
	WHERE 
	DepartmentID = @DepartmentID
END


----Update in Designation table.
CREATE PROCEDURE Designation_Update
@DesignationID int,
@DesignationName varchar(100)
AS
BEGIN
	UPDATE Designation SET
	DesignationName = @DesignationName
	WHERE 
	DesignationID = @DesignationID
END


----Update in Person table.
CREATE PROCEDURE Update_Person
@WorkerID		int,
@FirstName		varchar(100),
@LastName		varchar(100),
@Salary			decimal(8,2),
@JoiningDate	datetime,
@DepartmentID	int,
@DesignationID	int
AS
BEGIN
	UPDATE Person SET
	FirstName = @FirstName,
	LastName = @LastName,
	Salary = @Salary,
	JoiningDate = @JoiningDate,
	DepartmentID = @DepartmentID,
	DesignationID = @DesignationID
	WHERE
	WorkerID = @WorkerID
END

-------------------------------------------------------------------------------------------

----Delete in Department table.
CREATE PROCEDURE Department_Delete
@DepartmentID int
AS
BEGIN
	Delete FROM Department
	WHERE
	DepartmentID = @DepartmentID
END


----Delete in Designation table.
CREATE PROCEDURE Designation_Delete
@DesignationID int
AS
BEGIN
	Delete FROM Designation
	WHERE
	DesignationID = @DesignationID
END


----Delete in Person table.
CREATE PROCEDURE Person_Delete
@WorkerID int
AS
BEGIN
	Delete FROM Person
	WHERE
	WorkerID = @WorkerID
END


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)


----SelectAll from Department table.
CREATE PROCEDURE Department_SelectAll
AS
BEGIN
	SELECT * FROM Department
END


----SelectAll from Designation table.
CREATE PROCEDURE Designation_SelectAll
AS
BEGIN
	SELECT * FROM Designation
END


----SelectAll from Person table.
CREATE PROCEDURE Person_SelectAll
AS
BEGIN
	SELECT P.*, D.DepartmentName, DE.DesignationName
	FROM (Person P INNER JOIN Department D
	ON P.DepartmentID = D.DepartmentID) INNER JOIN Designation DE
	ON P.DesignationID = DE.DesignationID
END


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------3. All tables SelectPK


----Department SelectPK
CREATE PROCEDURE Department_SelectPK
@DepartmentID int
AS
BEGIN
	SELECT *
	FROM Department
	WHERE DepartmentID = @DepartmentID
END


----Designation SelectPK
CREATE PROCEDURE Designation_SelectPK
@DesignationID int
AS
BEGIN
	SELECT *
	FROM Designation
	WHERE DesignationID = @DesignationID
END


----Person SelectPK
CREATE PROCEDURE Person_SelectPK
@WorkerID int
AS
BEGIN
	SELECT *
	FROM Person
	WHERE WorkerID = @WorkerID
END


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------4. Create Procedure that takes Department Name & Designation Name as Input and 
----------   Returns a table with Worker’s First Name, Salary, Joining Date & Department Name.

CREATE PROCEDURE Person_BasicInfo
@DepartmentName		varchar(100),
@DesignationName	varchar(100)
AS
BEGIN
	SELECT P.FirstName, P.Salary, P.JoiningDate, D.DepartmentName
	FROM (Person P INNER JOIN Department D
	ON P.DepartmentID = D.DepartmentID) INNER JOIN Designation DE
	ON P.DesignationID = DE.DesignationID
	WHERE D.DepartmentName = @DepartmentName AND DE.DesignationName = @DesignationName
END
--Person_BasicInfo 'IT', 'Jobber'


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------5. Create Procedure that takes FirstName as an input parameter and displays’ all the  
----------	 details of the worker with their department & designation name.

CREATE PROCEDURE Person_BasicInfoByFirstName
@FirstName varchar(100)
AS
BEGIN
	SELECT P.*, D.DepartmentName, DE.DesignationName
	FROM (Person P INNER JOIN Department D
	ON P.DepartmentID = D.DepartmentID) INNER JOIN Designation DE
	ON P.DesignationID = DE.DesignationID
	WHERE P.FirstName = @FirstName
END


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


----------6. Create Procedure which displays department wise maximum, minimum & total salaries.

CREATE PROCEDURE Person_Salary_AggregateFunctions
AS
BEGIN
	SELECT D.DepartmentName, MAX(P.Salary) AS Maximum, MIN(P.Salary) AS Minimum, SUM(P.Salary) AS TotalSalary
	FROM Person P INNER JOIN Department D
	ON P.DepartmentID = D.DepartmentID
	GROUP BY D.DepartmentName
END