-- Use NorthwindDB2021

CREATE PROCEDURE dbo.spNorthwindDB2021_Customers_Update
	@CustomerID int	
	,@CompanyName varchar(40)
	,@ContactName varchar(30)
	,@ContactTitle varchar(30)
	,@Address varchar(60)
	,@City varchar(15)
	,@Region varchar(15)
	,@PostalCode varchar(10)
	,@Country varchar(15)
As
Begin
	Update c
	Set c.CompanyName = @CompanyName
		,c.ContactName = @ContactName
		,c.ContactTitle = @ContactTitle
		,c.[Address] = @Address
		,c.City = @City
		,c.Region = @Region
		,c.PostalCode = @PostalCode
		,c.Country = @Country
	--Select *
	From dbo.Customers c
	Where c.CustomerID = @CustomerID

End

/*

DECLARE @CustomerID int	= 92
	,@CompanyName nvarchar(40) = 'Embedded101'
	,@ContactName nvarchar(30) = 'Samuel Phung3'
	,@ContactTitle nvarchar(30) = 'PM'
	,@Address nvarchar(60) = '123 Any Street'
	,@City nvarchar(15) = 'Los Angeles'
	,@Region nvarchar(15) = 'CA'
	,@PostalCode nvarchar(10) = '91732'
	,@Country nvarchar(15) = 'USA'

EXEC dbo.spNorthwindDB2021_Customers_Update @CustomerID	
	,@CompanyName
	,@ContactName
	,@ContactTitle
	,@Address
	,@City
	,@Region
	,@PostalCode
	,@Country
GO

SELECT *
FROM Customers
WHERE CustomerId = 92

*/