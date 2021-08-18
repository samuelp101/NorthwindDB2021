
-- Use NorthwindDB

-- EXEC dbo.spNorthwindDB2021_Customers_GetById @CustomerId = 92

CREATE PROCEDURE dbo.spNorthwindDB2021_Customers_GetById
	@CustomerId int
	,@CompanyName nvarchar(40) = null
	,@ContactName nvarchar(30) = null
	,@ContactTitle nvarchar(30) = null
	,@Address nvarchar(60) = null
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null
As

-- DECLARE @CustomerId int = 2
Select CustomerId	
	,CompanyName	
	,ContactName	
	,ContactTitle	
	,[Address]
	,City	
	,Region	
	,PostalCode	
	,Country
From dbo.Customers
Where CustomerId = @CustomerId
