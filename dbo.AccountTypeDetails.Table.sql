USE [my-atm-app]
GO
/****** Object:  Table [dbo].[AccountTypeDetails]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypeDetails](
	[AccountTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccountTypeDetails] PRIMARY KEY CLUSTERED 
(
	[AccountTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
