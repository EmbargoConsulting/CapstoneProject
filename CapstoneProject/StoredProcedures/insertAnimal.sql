CREATE PROCEDURE insertAnimal

           @AnimalName varchar(50),
           @AnimalType varchar(50),
           @AnimalSpecies varchar(50),
           @CheckedInStatus nchar(10),
           @LastUpdatedBy varchar(50),
           @LastUpdated date

as

INSERT INTO [dbo].[Animal]
           ([AnimalName]
           ,[AnimalType]
           ,[AnimalSpecies]
           ,[CheckedInStatus]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES (@AnimalName, @AnimalType, @AnimalSpecies, @CheckedInStatus, @LastUpdatedBy, @LastUpdated)

GO