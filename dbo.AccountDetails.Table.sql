USE [my-atm-app]
GO
/****** Object:  Table [dbo].[AccountDetails]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetails](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[AccountBalance] [numeric](18, 0) NULL,
 CONSTRAINT [PK_UserAccountDetails] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserAccountDetails_AccountTypeDetails] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountTypeDetails] ([AccountTypeID])
GO
ALTER TABLE [dbo].[AccountDetails] CHECK CONSTRAINT [FK_UserAccountDetails_AccountTypeDetails]
GO
