
-- Use NorthwindDB

-- EXEC dbo.spNorthwindDB2021_Customers_GetById @CustomerId = 92

CREATE PROCEDURE dbo.spNorthwindDB2021_Customers_GetById
	@CustomerId int
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
