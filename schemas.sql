DROP DATABASE IF EXISTS [test]
GO

-- Add new database
CREATE DATABASE [test] 

GO 

USE [test]
GO

/****** Object:  Table [dbo].[account]    Script Date: 7/31/2020 5:26:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[account]') AND type in (N'U'))
DROP TABLE [dbo].[account]
GO

/****** Object:  Table [dbo].[account]    Script Date: 7/31/2020 5:26:10 PM ******/
CREATE TABLE [dbo].[account](
	[id_account] [float] NOT NULL,
	[id_person] [float] NULL,
	[account_type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[person]') AND type in (N'U'))
DROP TABLE [dbo].[person]
GO

/****** Object:  Table [dbo].[person]    Script Date: 7/31/2020 5:27:26 PM ******/

CREATE TABLE [dbo].[person](
	[id_person] [float] NOT NULL,
	[name] [nvarchar](255) NULL,
	[surname] [nvarchar](255) NULL,
	[zip] [float] NULL,
	[city] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone_number] [float] NULL,
	[birth_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_person] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[transactionTable]') AND type in (N'U'))
DROP TABLE [dbo].[transactionTable]
GO

/****** Object:  Table [dbo].[transactionTable]    Script Date: 7/31/2020 5:28:01 PM ******/
CREATE TABLE [dbo].[transactionTable](
	[id_transaction] [float] NOT NULL,
	[id_account] [float] NOT NULL,
	[transaction_type] [nvarchar](50) NULL,
	[transaction_date] [date] NULL,
	[transaction_amount] [float] NULL
) ON [PRIMARY]
GO

