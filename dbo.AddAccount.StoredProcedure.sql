USE [my-atm-app]
GO
/****** Object:  StoredProcedure [dbo].[AddAccount]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[AddAccount]
    @UserName NVARCHAR(50), 
	@UserEmail NVARCHAR(50),
    @Password NVARCHAR(50),
    @FirstName NVARCHAR(40) = NULL, 
    @LastName VARCHAR(40) = NULL,
	@PhoneNumber NUMERIC = NULL,
	@AccountTypeID VARCHAR(50),
	@AccountBalance INT,
	@TransactionAmount INT,
	@TransactionReason VARCHAR(50),
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @salt UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY
			
		IF NOT EXISTS (SELECT top 1 UserEmail from [dbo].[User] where UserEmail = @UserEmail)
		BEGIN
			INSERT INTO [dbo].[User] (UserEmail, UserName, PasswordHash, FirstName, LastName,PhoneNumber, Salt)
			VALUES (@UserEmail, @UserName, HASHBYTES('SHA2_512', @Password+CAST(@salt AS NVARCHAR(36))), @FirstName, @LastName,@PhoneNumber, @salt);
		END
		ELSE
		BEGIN
			SET @responseMessage='User Email Exists'
		END
			DECLARE @UserID AS INT;
			SET @UserID = (SELECT top 1 UserID from [dbo].[User] where UserEmail = @UserEmail );

			IF NOT EXISTS (SELECT TOP 1 AccountTypeID from [dbo].[AccountDetails] where UserID = @UserID AND AccountTypeID = @AccountTypeID)
			BEGIN
			INSERT INTO [dbo].[AccountDetails] (UserID, AccountTypeID, AccountBalance)
			VALUES (@UserID, @AccountTypeID, @AccountBalance) 

			DECLARE @AccountID AS INT;
			SET @AccountID = (SELECT AccountID from [dbo].[AccountDetails] where UserID = @UserID AND AccountTypeID = @AccountTypeID);

			INSERT INTO [dbo].[Transactions] (UserID, AccountID, TransactionDate, TransactionReason, ActionID, AccountBalance, TransactionAmount)
			VALUES (@UserID, @AccountID, SYSDATETIME(), @TransactionReason, 2, @AccountBalance, @TransactionAmount);
			END
			

			SET @responseMessage='Success'
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO


EXEC [dbo].[AddAccount]

@UserName = 'atare',
@UserEmail = 'apurvatare05@gmail.com',
@Password = '123',
@FirstName = 'Apurva', 
@LastName = 'Tare',
@PhoneNumber = 7028018564,
@AccountTypeID = 1,
@AccountBalance = 1000,
@TransactionAmount = 1000,
@TransactionReason = 'Create Savings Account',
@responseMessage = 'Successfully Added Account';



EXEC [dbo].[AddAccount]

@UserName = 'atare',
@UserEmail = 'apurvatare05@gmail.com',
@Password = '123',
@FirstName = 'Apurva', 
@LastName = 'Tare',
@PhoneNumber = 7028018564,
@AccountTypeID = 2,
@AccountBalance = 1000,
@TransactionAmount = 1000,
@TransactionReason = 'Create Current Account',
@responseMessage = 'Successfully Added Account'