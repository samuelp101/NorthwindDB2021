
-- Use NorthwindDB2021


CREATE PROC dbo.spNorthwindDB2021_Employees_GetAll
	@OrderBy varchar(25) = null
	,@AscDesc bit = 0
As
Begin

Select *
From dbo.Employees
Order By
	Case When @OrderBy = 'EmployeeId' and @AscDesc = 0 Then EmployeeId End Asc
	,Case When @OrderBy = 'EmployeeId' and @AscDesc = 1 Then EmployeeId End Desc
	,Case When @OrderBy = 'FirstName' and @AscDesc = 0 Then FirstName End Asc
	,Case When @OrderBy = 'FirstName' and @AscDesc = 1 Then FirstName End Desc
	,Case When @OrderBy = 'LastName' and @AscDesc = 0 Then LastName End Asc
	,Case When @OrderBy = 'LastName' and @AscDesc = 1 Then LastName End Desc
	,Case When @OrderBy = 'City' and @AscDesc = 0 Then City End Asc
	,Case When @OrderBy = 'City' and @AscDesc = 1 Then City End Desc
	,Case When @OrderBy = 'Region' and @AscDesc = 0 Then Region End Asc
	,Case When @OrderBy = 'Region' and @AscDesc = 1 Then Region End Desc
	,Case When @OrderBy = 'PostalCode' and @AscDesc = 0 Then PostalCode End Asc
	,Case When @OrderBy = 'PostalCode' and @AscDesc = 1 Then PostalCode End Desc
	,Case When @OrderBy = 'Country' and @AscDesc = 0 Then Country End Asc
	,Case When @OrderBy = 'Country' and @AscDesc = 1 Then Country End Desc
End
