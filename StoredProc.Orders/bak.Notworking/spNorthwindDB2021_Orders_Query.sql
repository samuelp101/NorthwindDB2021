-- USE NorthwindDB2021

/*
DECLARE @FromDate varchar(25) = '2019-01-01', @ToDate varchar(25) = '2019-12-31'
Declare @UserName varchar(25)='' ,@OrderID varchar(10), @CustomerID int, @CompanyName varchar(25);
Declare @SalesRepID int, @SalesRep varchar(50)='ja', @Shipper varchar(50), @Country varchar(15)
Declare @OrderBy varchar(25), @AscDesc varchar(5)

EXEC dbo.spNorthwindDB2021_Orders_Query @UserName, @FromDate, @ToDate, @OrderID, @CustomerID, @CompanyName, @Country, @SalesRepID, @SalesRep, @Shipper, @OrderBy, @AscDesc

--*/
-- EXEC dbo.Orders_Query @UserName = 'SPHUNG', @SalesRep = 'Ja'
-- EXEC dbo.Orders_Query @UserName = 'SPHUNG', @Shipper = 'Fed'

CREATE PROC dbo.spNorthwindDB2021_Orders_Query
  --@UserName varchar(25)
  @FromDate varchar(20) = '2019-01-01'
  ,@ToDate varchar(20) = '2019-12-31'
  ,@CustomerID int = 0
  ,@CompanyName varchar(50) = null
  ,@Country varchar(15) = null
  ,@SalesRepID int = null
  ,@SalesRep varchar(50) = null
  ,@Shipper varchar(50) = null
  ,@OrderBy varchar(25) = null
  ,@AscDesc varchar(5) = null
AS

BEGIN


/*
DECLARE @FromDate varchar(25) = '2018-01-01', @ToDate varchar(25) = '2020-12-31'
Declare @UserName varchar(25) , @CustomerID int, @CompanyName varchar(25);
Declare @SalesRepID int, @SalesRep varchar(50)=null, @Shipper varchar(50)=null, @Country varchar(15)
Declare @OrderBy varchar(25) = null, @AscDesc varchar(5)
--*/
DECLARE @FromDate2 Datetime, @ToDate2 Datetime, @AscDesc2 Bit = 0
SET @FromDate2 = Try_Parse(@FromDate as Datetime)
SET @ToDate2 = Try_Parse(@ToDate as Datetime)

IF (@AscDesc = '1') SET @AscDesc2 = 1
IF (@CompanyName IS NOT NULL) SET @CompanyName = @CompanyName + '%';
IF (@SalesRep IS NOT NULL) SET @SalesRep = @SalesRep + '%';
IF (@Shipper IS NOT NULL) SET @Shipper = @Shipper + '%';
IF (@Country IS NOT NULL) SET @Country = @Country + '%';

/*
DECLARE @FromDate2 Datetime = '2019-01-01', @ToDate2 Datetime = '2019-12-31'
Declare @UserName varchar(25), @CustomerID int, @CompanyName varchar(25);
Declare @SalesRepID int = 2, @SalesRep varchar(50)='Robert', @Shipper varchar(50)='FED%', @Country varchar(15)
--*/

SELECT *
FROM
	(
		Select A.OrderID
		  ,A.CustomerID
		  ,C.CompanyName
		  ,A.ShipCountry AS Country  
		  ,A.EmployeeID AS SalesRepID
		  --,T.TerritoryDescription
		  --,R.RegionDescription
		  ,(E.FirstName + ' ' + E.LastName) AS SalesRep
		  ,CAST(A.OrderDate AS DATE) AS OrderDate
		  ,S.CompanyName AS Shipper
		  ,A.Freight
		  ,A.OrderTotal
		From
			(  
				/*
				DECLARE @FromDate2 Datetime = '2019-01-01', @ToDate2 Datetime = '2019-12-31'
				Declare @UserName varchar(25), @OrderID int, @CustomerID int, @CompanyName varchar(25);
				Declare @SalesRepID int = 2, @SalesRep varchar(50)='Robert', @Shipper varchar(50)='FED%', @Country varchar(15)
				--*/
				Select A.OrderID, A.CustomerID, A.ShipCountry, A.OrderDate, A.ShipVia, A.Freight, A.EmployeeID
				  ,SUM(od.Quantity * od.UnitPrice) AS OrderTotal
				From dbo.Orders AS A
				  INNER JOIN dbo.OrderDetails AS od ON od.OrderID = A.OrderID
				Where (A.OrderDate BETWEEN @FromDate2 AND @ToDate2)
				 AND (@CustomerID = 0 or A.CustomerID = @CustomerID)	
				 AND (@Country IS NULL or A.ShipCountry LIKE @Country)	
				 AND (@SalesRepID IS NULL or A.EmployeeID = @SalesRepID)
				GROUP BY A.OrderID, A.CustomerID, A.OrderDate, A.ShipCountry, A.ShipVia, A.Freight, A.EmployeeID
			) A
			  INNER JOIN dbo.Customers C ON C.CustomerID = A.CustomerID
			  LEFT OUTER JOIN dbo.Employees E ON E.EmployeeID = A.EmployeeID
			  LEFT OUTER JOIN dbo.Shippers S ON S.ShipperID = A.ShipVia 
	) A
WHERE (@CompanyName IS NULL or A.CompanyName LIKE @CompanyName)
  AND (@SalesRep IS NULL or A.SalesRep LIKE @SalesRep)
  AND (@Shipper IS NULL or A.Shipper LIKE @Shipper)
ORDER BY
   CASE WHEN @OrderBy = 'OrderID' AND @AscDesc2 = 0 THEN A.OrderID END ASC
  ,CASE WHEN @OrderBy = 'OrderID' AND @AscDesc2 = 1 THEN A.OrderID END DESC
  ,CASE WHEN @OrderBy = 'CustomerID' AND @AscDesc2 = 0 THEN A.CustomerID END ASC
  ,CASE WHEN @OrderBy = 'CustomerID' AND @AscDesc2 = 1 THEN A.CustomerID END DESC
  ,CASE WHEN @OrderBy = 'CompanyName' AND @AscDesc2 = 0 THEN A.CompanyName END ASC
  ,CASE WHEN @OrderBy = 'CompanyName' AND @AscDesc2 = 1 THEN A.CompanyName END DESC
  ,CASE WHEN @OrderBy = 'Country' AND @AscDesc2 = 0 THEN A.Country END ASC
  ,CASE WHEN @OrderBy = 'Country' AND @AscDesc2 = 1 THEN A.Country END DESC
  ,CASE WHEN @OrderBy = 'SalesRep' AND @AscDesc2 = 0 THEN A.SalesRep END ASC
  ,CASE WHEN @OrderBy = 'SalesRep' AND @AscDesc2 = 1 THEN A.SalesRep END DESC
  ,CASE WHEN @OrderBy = 'OrderDate' AND @AscDesc2 = 0 THEN A.OrderDate END ASC
  ,CASE WHEN @OrderBy = 'OrderDate' AND @AscDesc2 = 1 THEN A.OrderDate END DESC
  ,CASE WHEN @OrderBy = 'Shipper' AND @AscDesc2 = 0 THEN A.Shipper END ASC
  ,CASE WHEN @OrderBy = 'Shipper' AND @AscDesc2 = 1 THEN A.Shipper END DESC
  ,CASE WHEN @OrderBy = 'Freight' AND @AscDesc2 = 0 THEN A.Freight END ASC
  ,CASE WHEN @OrderBy = 'Freight' AND @AscDesc2 = 1 THEN A.Freight END DESC
  ,CASE WHEN @OrderBy = 'OrderTotal' AND @AscDesc2 = 0 THEN A.OrderTotal END ASC
  ,CASE WHEN @OrderBy = 'OrderTotal' AND @AscDesc2 = 1 THEN A.OrderTotal END DESC

END 

  
GO

-- SELECT * FROM Orders

