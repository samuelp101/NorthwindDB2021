# NorthwindDB2021
Modified Northwind sample database (from Microsoft) - updated transaction dates - minor schema changes

The original Northwind database creation script is from the following repository:
    https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/northwind-pubs
The original script was released by Microsoft under an MIT license.

Changes made to the original file:
  1. Date value for all column with DATETIME data-type increased by 22 years.
     -  Original transaction dates in the dbo.Orders table were between "July 4th, 1996" and "May 6th, 1998"
     -  Updated transaction dates in the dbo.Orders table are between "July 4th, 2018" and "May 6th, 2020"
    
  2. Renamed [dbo].[Order Details] to [dbo].[OrderDetails]
     (removed the space between "Order" and "Details")

  3. Primary key "CustomerID" column for the dbo.Customers table changed to "int" type with auto-increment
     -  All other tables that reference the "CustomerID" column are changed to reflect correct data type.
     -  Data in the dbo.Orders table have been updated to reference the correct "CustomerID" data value.

Except for the above changes, content for the remaining script is the same as the original.

