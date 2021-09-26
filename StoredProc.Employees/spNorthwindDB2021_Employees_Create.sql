-- Use NorthwindDB2021
-- Drop Proc dbo.spNorthwindDB2021_Employees_Create
CREATE PROCEDURE dbo.spNorthwindDB2021_Employees_Create
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
As
Begin

	Insert Into dbo.Employees
		(LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,[Address],
		 City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath)
	Values
		(@LastName,@FirstName,@Title,@TitleOfCourtesy,@BirthDate,@HireDate,@Address,
		 @City,@Region,@PostalCode,@Country,@HomePhone,@Extension,@Notes,@ReportsTo,@PhotoPath)
End


