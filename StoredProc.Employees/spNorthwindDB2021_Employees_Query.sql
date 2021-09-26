-- Use NorthwindDB2021

CREATE PROC dbo.spNorthwindDB2021_Employees_Query
	@EmplotyeeId int = null
	,@LastName nvarchar(20)
	,@FirstName nvarchar(10)
	,@Title nvarchar(30) = null
	,@TitleOfCourtesy nvarchar(25) = null
	,@BirthDate datetime = null
	,@HireDate datetime = null
	,@Address nvarchar(60) = null
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null
	,@HomePhone nvarchar(24) = null
	,@Extension nvarchar(4) = null
	,@Notes ntext = null
	,@ReportsTo int = null
	,@PhotoPath nvarchar(255) = null
AS
BEGIN

	IF (@LastName IS NOT NULL) SET @LastName = @LastName + '%';
	IF (@FirstName IS NOT NULL) SET @FirstName = @FirstName + '%';

	IF (@Title IS NOT NULL) SET @Title = @Title + '%';
	IF (@TitleOfCourtesy IS NOT NULL) SET @TitleOfCourtesy = @TitleOfCourtesy + '%';

	IF (@Address IS NOT NULL) SET @Address = '%' + @Address + '%';
	IF (@City IS NOT NULL) SET @City = @City + '%';
	IF (@Region IS NOT NULL) SET @Region = @Region + '%';
	IF (@PostalCode IS NOT NULL) SET @PostalCode = @PostalCode + '%';
	IF (@Country IS NOT NULL) SET @Country = @Country + '%';


	SELECT *
	FROM dbo.Employees AS e
	WHERE (@LastName IS NULL or e.LastName LIKE @LastName)
	  AND (@FirstName IS NULL or e.FirstName LIKE @FirstName)
	  AND (@Title IS NULL or e.Title LIKE @Title)
	  AND (@Address IS NULL or e.[Address] LIKE @Address)
	  AND (@City IS NULL or e.City LIKE @City)
	  AND (@Region IS NULL or e.Region LIKE @Region)
	  AND (@PostalCode IS NULL or e.PostalCode LIKE @PostalCode)
	  AND (@Country IS NULL or e.Region LIKE @Country)

END