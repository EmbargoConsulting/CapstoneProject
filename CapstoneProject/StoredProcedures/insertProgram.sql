CREATE PROCEDURE insertProgram
           @ProgramID int,
           @InvoiceID int,
           @OrganizationID int,
           @ProgramName varchar(50),
           @ProgramType varchar(50),
           @DateTime datetime,
           @ChildAttendance int,
           @AdultAttendance int,
           @LastUpdatedBy varchar(50),
           @LastUpdated date
as

INSERT INTO [dbo].[Program]
           ([ProgramID]
           ,[InvoiceID]
           ,[OrganizationID]
           ,[ProgramName]
           ,[ProgramType]
           ,[DateTime]
           ,[ChildAttendance]
           ,[AdultAttendance]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@ProgramID,
           @InvoiceID,
           @OrganizationID,
           @ProgramName,
           @ProgramType,
           @DateTime,
           @ChildAttendance,
           @AdultAttendance,
           @LastUpdatedBy,
           @LastUpdated)
GO


