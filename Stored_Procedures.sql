----------------------------------------------------------------------------------------

CREATE DATABASE Stored_Procedures

----------------------------------------------------------------------------------------

--1. Select All
--   CityID, CityName, Pincode, CityRemarks, StateID, StateName

CREATE PROCEDURE PR_MST_City_SELECTALL
AS
BEGIN
	SELECT * 
	FROM MST_City INNER JOIN MST_State
	ON MST_City.StateID = MST_State.StateID
END

----------------------------------------------------------------------------------------

--2. Insert

CREATE PROCEDURE PR_MST_City_INSERT
@CityID			int,
@CityName		varchar(50),
@Pincode		varchar(6),
@StateID		int,
@CityRemarks	varchar(500)
AS
BEGIN
		INSERT INTO MST_City
		(
			CityID,
			CityName,
			Pincode,
			StateID,
			CityRemarks
		)
		VALUES
		(
			@CityID,
			@CityName,	
			@Pincode,	
			@StateID,	
			@CityRemarks
		)
END
--PR_MST_City_INSERT 5,'Delhi','450001',3,'good';

----------------------------------------------------------------------------------------

--3. Update

CREATE PROCEDURE PR_MST_City_UPDATE
@CityID			int,
@CityName		varchar(50),
@Pincode		varchar(6),
@StateID		int,
@CityRemarks	varchar(500)
AS
BEGIN
	UPDATE MST_City
	SET CityName	= @CityName,
		Pincode		= @Pincode,
		StateID		= @StateID,
		CityRemarks	= @CityRemarks
	WHERE CityID = @CityID
END
--PR_MST_City_UPDATE 5,'New Delhi','450002',3,'good';

----------------------------------------------------------------------------------------

--4. Delete

CREATE PROCEDURE PR_MST_City_DELETE
@CityID int
AS
BEGIN
	DELETE FROM MST_City
	WHERE CityID = @CityID
END
--PR_MST_City_DELETE 5;

----------------------------------------------------------------------------------------

--5. SelectByPK

CREATE PROCEDURE PR_MST_City_SELECTBYPK
@CityID int
AS
BEGIN
	SELECT * 
	FROM MST_City
	WHERE CityID = @CityID
END
--PR_MST_City_SELECTBYPK 4

----------------------------------------------------------------------------------------

--6. SelectByPincodeStartWith360

CREATE PROCEDURE PR_MST_City_SELECTByPincodeStartWith360
AS
BEGIN
	SELECT * 
	FROM MST_City
	WHERE Pincode LIKE '360%'
END
--PR_MST_City_SELECTByPincodeStartWith360 

----------------------------------------------------------------------------------------

--7. SelectByCityNamePincode

CREATE PROCEDURE PR_MST_City_SELECTByCityNamePincode
@CityName	varchar(50),
@Pincode	varchar(6)
AS
BEGIN
	SELECT * 
	FROM MST_City
	WHERE Pincode = @Pincode and CityName = @CityName
END
--PR_MST_City_SELECTByCityNamePincode 'Rajkot', '360005'

----------------------------------------------------------------------------------------

--8. SelectByCityRemarks

CREATE PROCEDURE PR_MST_City_SELECTByCityRemarks
@CityRemarks varchar(500)
AS
BEGIN
	SELECT * 
	FROM MST_City
	WHERE CityRemarks = @CityRemarks
END
--PR_MST_City_SELECTByCityRemarks 'clean'

----------------------------------------------------------------------------------------

--9. SelectByStateID

CREATE PROCEDURE PR_MST_City_SELECTByStateID
@StateID int
AS
BEGIN
	SELECT * 
	FROM MST_City
	WHERE StateID = @StateID
END
--PR_MST_City_SELECTByStateID 3

----------------------------------------------------------------------------------------

--10. SelectByStateIDCityID

CREATE PROCEDURE PR_MST_City_SELECTByStateIDCityID
@StateID	int,
@CityID		int
AS
BEGIN
	SELECT * 
	FROM MST_City
	WHERE StateID = @StateID and CityID = @CityID
END
--PR_MST_City_SELECTByStateIDCityID 3, 4

----------------------------------------------------------------------------------------