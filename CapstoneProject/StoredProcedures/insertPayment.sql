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


