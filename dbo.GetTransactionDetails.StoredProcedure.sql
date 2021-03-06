USE [my-atm-app]
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionDetails]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[GetTransactionDetails]
          -- Add the parameters for the stored procedure here
          @AccountID int = 0,
		  @UserID int = 0
          --@StartDate datetime = 0,
          --@EndDate datetime = 0
AS
BEGIN
          -- SET NOCOUNT ON added to prevent extra result sets from
          -- interfering with SELECT statements.
          SET NOCOUNT ON;
		  -- Insert statements for procedure here

SELECT AD.AccountID, U.UserID, ATD.AccountType, T.TransactionDate, T.TransactionReason, A.ActionType, T.TransactionAmount, T.AccountBalance  FROM [dbo].[Transactions] T
INNER JOIN Actions A ON A.ActionID = T.ActionID
INNER JOIN [dbo].[User] U ON T.UserID = U.UserID
INNER JOIN AccountDetails AD ON T.AccountID = AD.AccountID
INNER JOIN AccountTypeDetails ATD ON ATD.AccountTypeID = AD.AccountTypeID
WHERE T.AccountID = @AccountID AND T.UserID = @UserID --AND T.TransactionDate BETWEEN @StartDate AND @EndDate

END
GO
