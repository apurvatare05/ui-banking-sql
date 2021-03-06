USE [my-atm-app]
GO
/****** Object:  StoredProcedure [dbo].[uspGetAccountDetails]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGetAccountDetails]
    @pUserID NVARCHAR(50), 
    @pUserName NVARCHAR(50), 
    @pFirstName NVARCHAR(40) = NULL, 
    @pLastName NVARCHAR(40) = NULL,
    @pAccountID NVARCHAR(50), 
    @pAccountType NVARCHAR(50), 
    @pAccountNumber NVARCHAR(50), 
    @pAccountBalance NVARCHAR(50), 
	
    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY

        SELECT U.UserID, U.UserName, U.FirstName,U.LastName, A.AccountID, A.AccountType, A.AccountNumber, A.AccountBalance from  [dbo].[AccountDetails] A
		Inner Join [dbo].[User] U ON A.UserID = U.UserID

        SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END
GO
