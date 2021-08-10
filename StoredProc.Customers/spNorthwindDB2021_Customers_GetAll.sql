
-- Use NorthwindDB2021

-- EXEC dbo.spNorthwindDB2021_Customers_GetAll @OrderBy = 'Country'
-- EXEC dbo.spNorthwindDB2021_Customers_GetAll @OrderBy = 'CustomerID'
-- EXEC dbo.spNorthwindDB2021_Customers_GetAll @OrderBy = 'CompanyName'
-- EXEC dbo.spNorthwindDB2021_Customers_GetAll @OrderBy = 'ContactName', @AscDesc = 1
-- EXEC dbo.spNorthwindDB2021_Customers_GetAll @OrderBy = 'Region'
-- EXEC dbo.spNorthwindDB2021_Customers_GetAll @OrderBy = 'City'

CREATE PROC dbo.spNorthwindDB2021_Customers_GetAll
	@OrderBy varchar(25) = null
	,@AscDesc bit = 0
As

/*
  DECLARE @OrderBy varchar(25) = 'CompanyName', @AscDesc bit = 0

-- */

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
Order By
	Case When @OrderBy = 'CustomerId' and @AscDesc = 0 Then CustomerId End Asc
	,Case When @OrderBy = 'CustomerId' and @AscDesc = 1 Then CustomerId End Desc
	,Case When @OrderBy = 'CompanyName' and @AscDesc = 0 Then CompanyName End Asc
	,Case When @OrderBy = 'CompanyName' and @AscDesc = 1 Then CompanyName End Desc
	,Case When @OrderBy = 'ContactName' and @AscDesc = 0 Then ContactName End Asc
	,Case When @OrderBy = 'ContactName' and @AscDesc = 1 Then ContactName End Desc
	,Case When @OrderBy = 'City' and @AscDesc = 0 Then City End Asc
	,Case When @OrderBy = 'City' and @AscDesc = 1 Then City End Desc
	,Case When @OrderBy = 'Region' and @AscDesc = 0 Then Region End Asc
	,Case When @OrderBy = 'Region' and @AscDesc = 1 Then Region End Desc
	,Case When @OrderBy = 'PostalCode' and @AscDesc = 0 Then PostalCode End Asc
	,Case When @OrderBy = 'PostalCode' and @AscDesc = 1 Then PostalCode End Desc
	,Case When @OrderBy = 'Country' and @AscDesc = 0 Then Country End Asc
	,Case When @OrderBy = 'Country' and @AscDesc = 1 Then Country End Desc

