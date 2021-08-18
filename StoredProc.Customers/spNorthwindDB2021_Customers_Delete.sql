-- Use NorthwindDB2021

CREATE PROCEDURE dbo.spNorthwindDB2021_Customers_Delete
	@CustomerID int
        ,@CompanyName nvarchar(40) = null
	,@ContactName nvarchar(30) = null
	,@ContactTitle nvarchar(30) = null
	,@Address nvarchar(60) = null
	,@City nvarchar(15) = null
	,@Region nvarchar(15) = null
	,@PostalCode nvarchar(10) = null
	,@Country nvarchar(15) = null
As

-- DECLARE @CustomerID int = 92 
DELETE c
-- SELECT *
FROM dbo.Customers c
WHERE c.CustomerID = @CustomerID

/*
DECLARE @CustomerID int = 92
EXEC spNorthwindDB2021_Customers_Delete @CustomerID

SELECT *
FROM Customers
WHERE CustomerID = 92
*/