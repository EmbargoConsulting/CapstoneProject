CREATE PROCEDURE insertOnlineProgram

           @ProgramID int,
           @State varchar(50),
           @Country varchar(50),
           @Grade varchar(50),
           @TeacherName varchar(50),
           @TeacherEmail varchar(50),
           @LastUpdatedBy varchar(50),
           @LastUpdated date

as

INSERT INTO [dbo].[OnlineProgram]
           ([ProgramID]
           ,[State]
           ,[Country]
           ,[Grade]
           ,[TeacherName]
           ,[TeacherEmail]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@ProgramID,
           @State,
           @Country,
           @Grade,
           @TeacherName,
           @TeacherEmail,
           @LastUpdatedBy,
           @LastUpdated)
GO


