
-- Use NorthwindDB2021

CREATE PROCEDURE dbo.spNorthwindDB2021_Employees_GetById
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

-- DECLARE @EmplotyeeId int = 2
Select *
From dbo.Employees
Where EmployeeId = @EmplotyeeId
