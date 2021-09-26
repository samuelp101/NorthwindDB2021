-- Use NorthwindDB2021

CREATE PROCEDURE dbo.spNorthwindDB2021_Employees_Update
	@EmployeeId int
	,@LastName nvarchar(20) = null
	,@FirstName nvarchar(10) = null
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
Begin

	BEGIN TRANSACTION

	BEGIN TRY
		IF(@LastName IS NOT NULL)
		BEGIN
			Update e
			Set e.LastName = @LastName
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@FirstName IS NOT NULL)
		BEGIN
			Update e
			Set e.FirstName = @FirstName
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@Title IS NOT NULL)
		BEGIN
			Update e
			Set e.Title = @Title
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@TitleOfCourtesy IS NOT NULL)
		BEGIN
			Update e
			Set e.TitleOfCourtesy = @TitleOfCourtesy
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@BirthDate IS NOT NULL)
		BEGIN
			Update e
			Set e.BirthDate = @BirthDate
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@HireDate IS NOT NULL)
		BEGIN
			Update e
			Set e.HireDate = @HireDate
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@Address IS NOT NULL)
		BEGIN
			Update e
			Set e.[Address] = @Address
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@City IS NOT NULL)
		BEGIN
			Update e
			Set e.City = @City
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@Region IS NOT NULL)
		BEGIN
			Update e
			Set e.Region = @Region
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@PostalCode IS NOT NULL)
		BEGIN
			Update e
			Set e.PostalCode = @PostalCode
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@Country IS NOT NULL)
		BEGIN
			Update e
			Set e.Country = @Country
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@HomePhone IS NOT NULL)
		BEGIN
			Update e
			Set e.HomePhone = @HomePhone
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@Extension IS NOT NULL)
		BEGIN
			Update e
			Set e.Extension = @Extension
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@Notes IS NOT NULL)
		BEGIN
			Update e
			Set e.Notes = @Notes
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@ReportsTo IS NOT NULL)
		BEGIN
			Update e
			Set e.ReportsTo = @ReportsTo
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

		IF(@PhotoPath IS NOT NULL)
		BEGIN
			Update e
			Set e.PhotoPath = @PhotoPath
			From dbo.Employees e
			Where e.EmployeeID = @EmployeeId
		END

	END TRY

	BEGIN CATCH
		SELECT   
			ERROR_NUMBER() AS ErrorNumber  
			,ERROR_SEVERITY() AS ErrorSeverity  
			,ERROR_STATE() AS ErrorState  
			,ERROR_PROCEDURE() AS ErrorProcedure  
			,ERROR_LINE() AS ErrorLine  
			,ERROR_MESSAGE() AS ErrorMessage;  
  
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  
	END CATCH

	IF @@TRANCOUNT > 0
	    COMMIT TRANSACTION;
End