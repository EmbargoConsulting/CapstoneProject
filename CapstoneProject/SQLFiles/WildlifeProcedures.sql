CREATE PROCEDURE insertAnimal
@AnimalName varchar(50),
@AnimalType varchar(50),
@CheckedInStatus nchar(10),
@LastUpdatedBy varchar(50),
@LastUpdated date
as
INSERT INTO [dbo].[Animal]
   ([AnimalName]
   ,[AnimalType]
   ,[CheckedInStatus]
   ,[LastUpdatedBy]
   ,[LastUpdated])
VALUES (@AnimalName, @AnimalType, @CheckedInStatus, @LastUpdatedBy, @LastUpdated)
GO


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


CREATE PROCEDURE insertEmployee
@FirstName varchar(50),
@MiddleName varchar(50),
@LastName varchar(50),
@EmployeeType varchar(50),
@LastUpdatedBy varchar(50),
@LastUpdated date,
@EmployeeID int OUTPUT
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
SET @EmployeeID = SCOPE_IDENTITY();
GO


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



CREATE PROCEDURE insertInvoice
@InvoiceID int,
@ProgramID int,
@OrganizationID int,
@InvoiceAmount varchar(50),
@CancelledYN bit,
@PaymentTotal varchar(50),
@LastUpdatedBy varchar(50),
@LastUpdated date
as
INSERT INTO [dbo].[Invoice]
   ([InvoiceID]
   ,[ProgramID]
   ,[OrganizationID]
   ,[InvoiceAmount]
   ,[CancelledYN]
   ,[PaymentTotal]
   ,[LastUpdatedBy]
   ,[LastUpdated])
VALUES
   (@InvoiceID,
   @ProgramID,
   @OrganizationID,
   @InvoiceAmount,
   @CancelledYN,
   @PaymentTotal,
   @LastUpdatedBy,
   @LastUpdated)
GO


CREATE PROCEDURE insertLiveProgram
@ProgramID int,
@Status varchar(50),
@Address varchar(50),
@City varchar(50),
@County varchar(50),
@OnOffSite bit,
@LastUpdatedBy varchar(50),
@LastUpdated DateTime
as
INSERT INTO [dbo].[LiveProgram]
	([ProgramID]
	,[Status]
	,[Address]
	,[City]
	,[County]
	,[OnOffSite]
	,[LastUpdatedBy]
	,[LastUpdated])
VALUES
	(@ProgramID,
	@Status,
	@Address,
	@City,
	@County,
	@OnOffSite,
	@LastUpdatedBy,
	@LastUpdated)
GO


CREATE PROCEDURE insertOnlineProgram
@ProgramID int,
@ProgramType varchar(50),
@State varchar(50),
@Country varchar(50),
@Grade varchar(50),
@TeacherName varchar(50),
@TeacherEmail varchar(50),
@LastUpdatedBy varchar(50),
@LastUpdated datetime
as
INSERT INTO [dbo].[OnlineProgram]
   ([ProgramID]
   ,[ProgramType]
   ,[State]
   ,[Country]
   ,[Grade]
   ,[TeacherName]
   ,[TeacherEmail]
   ,[LastUpdatedBy]
   ,[LastUpdated])
VALUES
   (@ProgramID,
   @ProgramType,
   @State,
   @Country,
   @Grade,
   @TeacherName,
   @TeacherEmail,
   @LastUpdatedBy,
   @LastUpdated)
GO


CREATE PROCEDURE insertOrganization
@OrganizationName varchar(50),
@State varchar(50),
@City varchar(50),
@Zip varchar(50),
@OrganizationContact varhcar(50),
@LastUpdatedBy varchar(50),
@LastUpdated date,
@OrganizationID int output

as
INSERT INTO [dbo].[Organization]
    ([OrganizationName]
   ,[State]
   ,[City]
   ,[Zip]
   ,[OrganizationContact]
   ,[LastUpdatedBy]
   ,[LastUpdated])
VALUES
   (@OrganizationName,
   @State,
   @City,
   @Zip,
   @OrganizationContact,
   @LastUpdatedBy,
   @LastUpdated
   )
   SET @OrganizationID = SCOPE_IDENTITY();

GO


CREATE PROCEDURE insertPayment
@PaymentID int,
@InvoiceID int,
@PaymentAmount varchar(50),
@PaymentType varchar(50),
@CheckNumber varchar(50),
@PaymentTotal varchar(50),
@LastUpdatedBy varchar(50),
@LastUpdated date
as
INSERT INTO [dbo].[Payment]
   ([PaymentID]
   ,[InvoiceID]
   ,[PaymentAmount]
   ,[PaymentType]
   ,[CheckNumber]
   ,[PaymentTotal]
   ,[LastUpdatedBy]
   ,[LastUpdated])
VALUES
   (@PaymentID,
   @InvoiceID,
   @PaymentAmount,
   @PaymentType,
   @CheckNumber,
   @PaymentTotal,
   @LastUpdatedBy,
   @LastUpdated)
GO


create PROCEDURE insertProgram
@ProgramTheme varchar(50),
@DateTime datetime,
@ChildAttendance int,
@AdultAttendance int,
@LastUpdatedBy varchar(50),
@LastUpdated date,
@ProgramID int OUTPUT
as
INSERT INTO [dbo].[Program]
	([ProgramTheme]
	,[DateTime]
	,[ChildAttendance]
	,[AdultAttendance]
	,[LastUpdatedBy]
	,[LastUpdated])
VALUES
	(@ProgramTheme,
	@DateTime,
	@ChildAttendance,
	@AdultAttendance,
	@LastUpdatedBy,
	@LastUpdated)
SET @ProgramID = SCOPE_IDENTITY();
GO


create PROCEDURE insertUser
@UserID int,
@Username varchar(100),
@PasswordHash varchar(100),
@LastUpdatedBy varchar(50),
@LastUpdated date
as
INSERT INTO [dbo].[Users]
	([UserID]
	,[Username]
	,[PasswordHash]
	,[LastUpdatedBy]
	,[LastUpdated])
VALUES
	(@UserID,
	@Username,
	@PasswordHash,
	@LastUpdatedBy,
	@LastUpdated)
GO

