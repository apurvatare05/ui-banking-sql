select * from [dbo].[Transactions];
select * from [dbo].[AccountDetails];
select * from [dbo].[User];
select * from [dbo].[Actions];
select * from [dbo].[AccountTypeDetails];




--ALTER TABLE Transactions
--ADD TransactionAmount int;
--SELECT AccountID from [dbo].[AccountDetails] where UserID = 1 AND AccountTypeID = 2
--UPDATE Transactions SET AccountBalance = 2000 where TransactionID = 3
--UPDATE AccountDetails SET AccountBalance = 2000 where AccountID = 1

--SELECT TOP 1 ActionID FROM [dbo].[Actions] WHERE ActionType = 'Deposit'
--SELECT U.UserID from [dbo].[User] U inner join AccountDetails AD ON AD.UserID = U.UserID where U.UserEmail = 'apurvatare05@gmail.com'
--SELECT UserID FROM [dbo].[User] WHERE UserEmail='apurvatare05@gmail.com' AND PasswordHash=HASHBYTES('SHA2_512', '123'+CAST(Salt AS NVARCHAR(36)))
--SELECT TOP 1 UserID FROM [dbo].[User] WHERE UserEmail='ajityadwadkar@gmail.com'
--SELECT UserID FROM [dbo].[User] WHERE UserEmail='ajityadwadkar@gmail.com' AND PasswordHash=HASHBYTES('SHA2_512', '1234')
--drop table [dbo].[AccountDetails];
--drop table [dbo].[TransactionDetails];

--select HASHBYTES('SHA2_512', '123'+CAST(Salt AS NVARCHAR(36))) from [dbo].[User] 

--UPDATE [dbo].[AccountDetails] 
--			SET AccountBalance = 1000 
--			WHERE UserID= 1



--SELECT UserID FROM [dbo].[User] WHERE UserEmail='apurvatare05@gmail.com' AND PasswordHash=HASHBYTES('SHA2_512', '123'+CAST(Salt AS NVARCHAR(36)))
-- Get Account Details SP (Input Parameters - UserID)
-- User ID, User Name, Account Number, Account Type, Account Balance
--SELECT U.UserID, U.UserName, U.FirstName,U.LastName, A.AccountID, ATD.AccountType, A.AccountNumber, A.AccountBalance from  [dbo].[AccountDetails] A
--		Inner Join [dbo].[User] U ON A.UserID = U.UserID
--		Inner Join [dbo].[AccountTypeDetails] ATD ON ATD.AccountTypeID = A.AccountTypeID

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert Account Details (Input Parameters - 
--AccountID,UserID,AccountType,AccountNumber,AccountBalance

--Add Account SP
--INSERT INTO [dbo].[User] (UserEmail, UserName, PasswordHash, FirstName, LastName)
--VALUES (@UserEmail, @UserName, HASHBYTES('SHA2_512', @Password), @FirstName, @LastName);
--DECLARE @UserID AS INT
--SET @UserID = (SELECT UserID from [dbo].[User] where UserEmail = @UserEmail);

--DECLARE @AccountTypeID AS INT
--SET @AccountTypeID = (SELECT AccountTypeID from AccountTypeDetails where AccountType = @AccountType);

--INSERT INTO [dbo].[AccountDetails] (UserID, AccountTypeID, AccountBalance)
--VALUES (@UserID, @AccountTypeID, @AccountBalance)

--delete from [dbo].[User] where UserEmail = 'apurvatare05@gmail.com' AND UserID = 3;
--delete from [dbo].[Transactions] where TransactionID BETWEEN 27 and 31;

--TRUNCATE TABLE [dbo].[User]
--TRUNCATE TABLE [dbo].[AccountDetails]
--TRUNCATE TABLE [dbo].[Transactions]

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Get User Login (User Email, User Password)
-- User Email, User Password, User Name
--SELECT TOP 1 UserID FROM [dbo].[User] WHERE UserEmail='apurvatare05@outlook.com'

--SELECT UserID FROM [dbo].[User] WHERE UserEmail='apurvatare05@gmail.com' AND PasswordHash=HASHBYTES('SHA2_512', '123'+CAST(Salt AS NVARCHAR(36)))
------------------------------------------------------------------------------------------------------------------------------------------------------

-- Get Transaction Details ( 1. On View (button) Click - InputParameters - Account ID)
--SELECT T.TransactionDate, T.TransactionReason, A.ActionType,ATD.AccountType, T.AccountBalance  from [dbo].[Transactions] T
--INNER JOIN Actions A ON A.ActionID = T.ActionID
--INNER JOIN AccountDetails AD ON AD.AccountID = T.AccountID
--INNER JOIN AccountTypeDetails ATD ON ATD.AccountTypeID = AD.AccountTypeID
--WHERE T.AccountID = @AccountID AND T.UserID = @UserID

-- Account Type | Transaction  Date | Transaction Reason | Action Type | Account Balance
-- 02/06/2022 | Home Loan | Withdraw | 1000
--TransactionID	UserID	AccountID	TransactionDate	TransactionReason	ActionID	AccountBalance
--1	1	1	2022-06-02 00:00:00.000	Home Loan	1	1000
--2	1	1	2022-06-02 00:00:00.000	Credit Salary	2	2000
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert Transaction Details ( 1. On Withdraw or Deposit (Button) Click - Input Parameters - AccountID, ActionType, AccountBalance, TransactionReason, AccountType)
--IF EXISTS(SELECT TOP 1 UserID FROM [dbo].[User] WHERE UserID=@UserID)
--BEGIN
--INSERT INTO [dbo].[TransactionDetails] (UserID, AccountID, TransactionDate, TransactionReason, ActionID, AccountBalance)
--VALUES (1, 2, SYSDATETIME(), 'Tuition Fees', 1, 100)

--UPDATE [dbo].[AccountDetails]
--SET AccountBalance = 100
--WHERE UserID = 1 AND AccountID = 2
------------------------------------------------------------------------------------------------------------------------------------------------------

