CREATE PROCEDURE insertAnimalProgram


           (@AnimalID int,
           @ProgramID int,
           @LastUpdatedBy varchar(50),
           @LastUpdated date)

as
INSERT INTO [dbo].[AnimalProgram]
           ([AnimalID]
           ,[ProgramID]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@AnimalID,
           @ProgramID,
           @LastUpdatedBy,
           @LastUpdated)
GO


