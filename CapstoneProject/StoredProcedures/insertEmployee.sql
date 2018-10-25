CREATE PROCEDURE insertEmployee

           @FirstName varchar(50),
           @MiddleName varchar(50),
           @LastName varchar(50),
           @EmployeeType varchar(50),
           @LastUpdatedBy varchar(50),
           @LastUpdated date

as

INSERT INTO [dbo].[Employee]
           ([FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[EmployeeType]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@FirstName,
           @MiddleName,
           @LastName,
           @EmployeeType,
           @LastUpdatedBy,
           @LastUpdated)
GO


