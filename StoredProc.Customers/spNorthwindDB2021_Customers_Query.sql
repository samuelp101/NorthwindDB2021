-- Use NorthwindDB2021

ALTER PROC dbo.spNorthwindDB2021_Customers_Query
	@CompanyName nvarchar(40) = null
	,@ContactName nvarchar(30) = null
	,@ContactTitle nvarchar(30) = null
	,@Address nvarchar(60) = null
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null
AS

/*
DECLARE 
	@CompanyName nvarchar(40) = 'A'
	,@ContactName nvarchar(30) = null
	,@ContactTitle nvarchar(30) = null
	,@Address nvarchar(60) = null
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null

-- */

IF (@CompanyName IS NOT NULL) SET @CompanyName = @CompanyName + '%';
IF (@ContactName IS NOT NULL) SET @ContactName = @ContactName + '%';
IF (@Address IS NOT NULL) SET @Address = '%' + @Address + '%';
IF (@City IS NOT NULL) SET @City = @City + '%';
IF (@Region IS NOT NULL) SET @Region = @Region + '%';
IF (@Country IS NOT NULL) SET @Country = @Country + '%';


/*
DECLARE 
	@CompanyName nvarchar(40) = null
	,@ContactName nvarchar(30) = null
	,@ContactTitle nvarchar(30) = null
	,@Address nvarchar(60) = null
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null

-- */

SELECT *
FROM dbo.Customers AS c
WHERE (@CompanyName IS NULL or c.CompanyName LIKE @CompanyName)
  AND (@ContactName IS NULL or c.ContactName LIKE @ContactName)
  AND (@Address IS NULL or c.Address LIKE @Address)
  AND (@City IS NULL or c.City LIKE @City)
  AND (@Region IS NULL or c.Region LIKE @Region)
  AND (@Country IS NULL or c.Region LIKE @Country)

/*

DECLARE 
	@CompanyName nvarchar(40) = null
	,@ContactName nvarchar(30) = null
	,@ContactTitle nvarchar(30) = null
	,@Address nvarchar(60) = 'king'
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null

EXEC dbo.spNorthwindDB2021_Customers_Query @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country



*/