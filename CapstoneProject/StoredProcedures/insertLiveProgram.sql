CREATE PROCEDURE insertLiveProgram

           @ProgramID int,
           @Address varchar(50),
           @City varchar(50),
           @County varchar(50),
           @OnOffSite bit,
           @LastUpdatedBy varchar(50),
           @LastUpdated nchar(10)

as
INSERT INTO [dbo].[LiveProgram]
           ([ProgramID]
           ,[Address]
           ,[City]
           ,[County]
           ,[OnOffSite]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@ProgramID,
           @Address,
           @City,
           @County,
           @OnOffSite,
           @LastUpdatedBy,
           @LastUpdated)
GO


