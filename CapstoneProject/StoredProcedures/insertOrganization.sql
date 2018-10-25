CREATE PROCEDURE insertOrganization

           @OrganizationID int,
           @OrganizationName varchar(50),
           @OrganizationAddress varchar(50),
           @OrganizationContact nchar(10),
           @LastUpdatedBy varchar(50),
           @LastUpdated date

as
INSERT INTO [dbo].[Organization]
           ([OrganizationID]
           ,[OrganizationName]
           ,[OrganizationAddress]
           ,[OrganizationContact]
           ,[LastUpdatedBy]
           ,[LastUpdated])
     VALUES
           (@OrganizationID,
           @OrganizationName,
           @OrganizationAddress,
           @OrganizationContact,
           @LastUpdatedBy,
           @LastUpdated)
GO


