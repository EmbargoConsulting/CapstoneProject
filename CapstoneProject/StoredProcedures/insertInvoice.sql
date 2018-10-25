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


