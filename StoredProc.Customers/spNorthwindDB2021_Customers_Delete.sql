-- Use NorthwindDB2021

CREATE PROCEDURE dbo.spNorthwindDB2021_Customers_Delete
	@CustomerID int
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