DROP Table EmployeeProgram;
DROP TABLE AnimalProgram;
DROP TABLE Payment;
DROP TABLE Invoice;
DROP TABLE Animal;
DROP TABLE OnlineProgram;
DROP TABLE Employee;
DROP TABLE Program;
DROP TABLE Organization;



CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalName] [varchar](50) NULL,
	[AnimalType] [varchar](50) NULL,
	[AnimalSpecies] [varchar](50) NULL,
	[CheckedInStatus] [bit] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](25) NULL,
	[MiddleName] [varchar](25) NULL,
	[LastName] [varchar](25) NULL,
	[PhoneNumber] [varchar](15) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[OnlineProgram](
	[ProgramID] [int] IDENTITY(2,2) NOT NULL,
	[Date] [date] NULL,
	[Month] [varchar](20) NULL,
	[Type] [varchar](50) NULL,
	[ChildCount] [int] NULL,
	[AdultCount] [int] NULL,
	[StateCountry] [varchar](50) NULL,
	[Grade] [varchar](20) NULL,
	[TeacherName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Theme] [varchar](50) NULL,
 CONSTRAINT [PK_OnlineProgram] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Organization](
	[OrgID] [int] IDENTITY(1,1) NOT NULL,
	[OrgName] [varchar](50) NULL,
	[OrgPhoneNumber] [varchar](15) NULL,
	[OrgAddress] [varchar](50) NULL,
	[OrgContact] [varchar](50) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Program](
	[ProgramID] [int] IDENTITY(1,2) NOT NULL,
	[OnOffSite] [bit] NULL,
	[Status] [bit] NULL,
	[OrgName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[ReportMonth] [varchar](20) NULL,
	[DateTime] [datetime] NULL,
	[ProgramTheme] [varchar](50) NULL,
	[ChildrenCount] [int] NULL,
	[AdultCount] [int] NULL,
	[AwaitingPayment] [varchar](20) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[OrgID] [int] NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Program]  WITH CHECK ADD  CONSTRAINT [FK_Program_Organization] FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organization] ([OrgID])
GO

ALTER TABLE [dbo].[Program] CHECK CONSTRAINT [FK_Program_Organization]
GO


CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[OrgName] [varchar](50) NOT NULL,
	[PaymentType] [varchar](50) NULL,
	[CheckNumber] [varchar](50) NULL,
	[Total] [varchar](50) NULL,
	[OrgID] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Organization] FOREIGN KEY([OrgID])
REFERENCES [dbo].[Organization] ([OrgID])
GO

ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Organization]
GO

CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[Total] [varchar](30) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_OnlineProgram] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[OnlineProgram] ([ProgramID])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_OnlineProgram]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Program]
GO

CREATE TABLE [dbo].[EmployeeProgram](
	[ProgramID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeProgram] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmployeeProgram]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProgram_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[EmployeeProgram] CHECK CONSTRAINT [FK_EmployeeProgram_Employee]
GO

ALTER TABLE [dbo].[EmployeeProgram]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProgram_OnlineProgram] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[OnlineProgram] ([ProgramID])
GO

ALTER TABLE [dbo].[EmployeeProgram] CHECK CONSTRAINT [FK_EmployeeProgram_OnlineProgram]
GO

ALTER TABLE [dbo].[EmployeeProgram]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProgram_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[EmployeeProgram] CHECK CONSTRAINT [FK_EmployeeProgram_Program]
GO

CREATE TABLE [dbo].[AnimalProgram](
	[ProgramID] [int] NOT NULL,
	[AnimalID] [int] NOT NULL,
 CONSTRAINT [PK_AnimalProgram] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC,
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AnimalProgram]  WITH CHECK ADD  CONSTRAINT [FK_AnimalProgram_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO

ALTER TABLE [dbo].[AnimalProgram] CHECK CONSTRAINT [FK_AnimalProgram_Animal]
GO

ALTER TABLE [dbo].[AnimalProgram]  WITH CHECK ADD  CONSTRAINT [FK_AnimalProgram_OnlineProgram] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[OnlineProgram] ([ProgramID])
GO

ALTER TABLE [dbo].[AnimalProgram] CHECK CONSTRAINT [FK_AnimalProgram_OnlineProgram]
GO

ALTER TABLE [dbo].[AnimalProgram]  WITH CHECK ADD  CONSTRAINT [FK_AnimalProgram_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[AnimalProgram] CHECK CONSTRAINT [FK_AnimalProgram_Program]
GO



