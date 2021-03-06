USE [my-atm-app]
GO
/****** Object:  StoredProcedure [dbo].[AddTransactions]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[AddTransactions]
    @UserID INT, 
    @AccountID INT, 
	@AccountType VARCHAR(50),
	@AccountBalance INT,
	@ActionType NVARCHAR(50),
	@TransactionReason VARCHAR(50),
	@TransactionAmount INT,
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @ActionID AS INT;
    BEGIN TRY
		BEGIN
			UPDATE [dbo].[AccountDetails] 
			SET AccountBalance = @AccountBalance 
			WHERE UserID= @UserID AND AccountID = @AccountID

			SET @ActionID = (SELECT TOP 1 ActionID FROM [dbo].[Actions] WHERE ActionType = @ActionType);
			INSERT INTO [dbo].[Transactions] (UserID, AccountID, TransactionDate, TransactionReason, ActionID, AccountBalance, TransactionAmount)
			VALUES 
			(@UserID, @AccountID, SYSDATETIME(), @TransactionReason, @ActionID, @AccountBalance, @TransactionAmount)
			

			
		
			SET @responseMessage='Success'
		END
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO
