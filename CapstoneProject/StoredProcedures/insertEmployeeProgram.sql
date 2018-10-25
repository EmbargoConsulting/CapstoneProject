CREATE PROCEDURE insertEmployeeProgram

           @EmployeeID int,
           @ProgramID int,
           @LastUpdatedBy varchar(50),
           @LastUpdated date
as
INSERT INTO [dbo].[EmployeeProgram]
           ([EmployeeID]
           ,[ProgramID]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@EmployeeID,
           @ProgramID,
           @LastUpdatedBy,
           @LastUpdated)
GO


