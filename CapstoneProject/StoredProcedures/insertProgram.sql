CREATE PROCEDURE insertProgram
           @ProgramID int OUTPUT,
           @InvoiceID int,
           @ProgramName varchar(50),
           @ProgramType varchar(50),
           @DateTime datetime,
           @ChildAttendance int,
           @AdultAttendance int,
           @LastUpdatedBy varchar(50),
           @LastUpdated date
as

INSERT INTO [dbo].[Program]
           ([InvoiceID]
           ,[ProgramName]
           ,[ProgramType]
           ,[DateTime]
           ,[ChildAttendance]
           ,[AdultAttendance]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@InvoiceID,
           @ProgramName,
           @ProgramType,
           @DateTime,
           @ChildAttendance,
           @AdultAttendance,
           @LastUpdatedBy,
           @LastUpdated)

		   SET @ProgramID = SCOPE_IDENTITY();
GO



