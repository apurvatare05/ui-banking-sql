USE [my-atm-app]
GO
/****** Object:  StoredProcedure [dbo].[UserLogin]    Script Date: 09-06-2022 16:30:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserLogin]
    @user_email NVARCHAR(254),
    @user_password NVARCHAR(50)
    --@responseMessage NVARCHAR(250)='' OUTPUT
	AS
BEGIN

    SET NOCOUNT ON
	SELECT
	U.UserID, U.UserName, U.UserEmail, U.FirstName, U.LastName,
	AD.AccountID AS AccountNumber, ATD.AccountType, AD.AccountBalance
	FROM [dbo].[User] U 
	INNER JOIN [dbo].[AccountDetails] AD ON AD.UserID = U.UserID
	INNER JOIN [dbo].[AccountTypeDetails] ATD ON ATD.AccountTypeID = AD.AccountTypeID
	where UserEmail = @user_email AND PasswordHash = (HASHBYTES('SHA2_512', @user_password+CAST(Salt AS NVARCHAR(36))))
END
	
--EXEC dbo.UserLogin @user_email='apurvatare05@gmail.com', @user_password='123'
GO
