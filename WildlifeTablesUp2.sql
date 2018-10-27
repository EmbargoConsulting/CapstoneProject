CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalName] [varchar](50) NULL,
	[AnimalType] [varchar](50) NULL,
	[AnimalSpecies] [varchar](50) NULL,
	[CheckedInStatus] [nchar](10) NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[EmployeeType] [varchar](50) NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Organization](
	[OrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationName] [varchar](50) NULL,
	[OrganizationAddress] [varchar](50) NULL,
	[OrganizationContact] [nchar](10) NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Program](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProgramName] [varchar](50) NULL,
	[ProgramType] [varchar](50) NULL,
	[DateTime] [datetime] NULL,
	[ChildAttendance] [int] NULL,
	[AdultAttendance] [int] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] Identity(1,1) NOT NULL,
	[ProgramID] [int] NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[InvoiceAmount] [varchar](50) NULL,
	[CancelledYN] [bit] NULL,
	[PaymentTotal] [varchar](50) NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [dbo].[Organization] ([OrganizationID])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Organization]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Program]
GO


CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[PaymentAmount] [varchar](50) NULL,
	[PaymentType] [varchar](50) NULL,
	[CheckNumber] [varchar](50) NULL,
	[PaymentTotal] [varchar](50) NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO

ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Invoice]
GO


CREATE TABLE [dbo].[LiveProgram](
	[ProgramID] [int] NOT NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[OnOffSite] [bit] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [nchar](10) NULL,
 CONSTRAINT [PK_LiveProgram] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LiveProgram]  WITH CHECK ADD  CONSTRAINT [FK_LiveProgram_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[LiveProgram] CHECK CONSTRAINT [FK_LiveProgram_Program]
GO


CREATE TABLE [dbo].[OnlineProgram](
	[ProgramID] [int] NOT NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Grade] [varchar](50) NULL,
	[TeacherName] [varchar](50) NULL,
	[TeacherEmail] [varchar](50) NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_OnlineProgram] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OnlineProgram]  WITH CHECK ADD  CONSTRAINT [FK_OnlineProgram_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[OnlineProgram] CHECK CONSTRAINT [FK_OnlineProgram_Program]
GO


CREATE TABLE [dbo].[AnimalProgram](
	[AnimalID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_AnimalProgram] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AnimalProgram]  WITH CHECK ADD  CONSTRAINT [FK_AnimalProgram_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO

ALTER TABLE [dbo].[AnimalProgram] CHECK CONSTRAINT [FK_AnimalProgram_Animal]
GO

ALTER TABLE [dbo].[AnimalProgram]  WITH CHECK ADD  CONSTRAINT [FK_AnimalProgram_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[AnimalProgram] CHECK CONSTRAINT [FK_AnimalProgram_Program]
GO


CREATE TABLE [dbo].[EmployeeProgram](
	[EmployeeID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdated] [date] NULL,
 CONSTRAINT [PK_EmployeeProgram] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmployeeProgram]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProgram_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO

ALTER TABLE [dbo].[EmployeeProgram] CHECK CONSTRAINT [FK_EmployeeProgram_Employee]
GO

ALTER TABLE [dbo].[EmployeeProgram]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeProgram_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Program] ([ProgramID])
GO

ALTER TABLE [dbo].[EmployeeProgram] CHECK CONSTRAINT [FK_EmployeeProgram_Program]
GO
