CREATE TABLE [dbo].[UserAccount]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [FirstName] NVARCHAR(50) NULL, 
    [LastName] NVARCHAR(50) NULL, 
    [Username] VARCHAR(50) NOT NULL, 
    [Password] NVARCHAR(MAX) NOT NULL, 
    [Phone] NVARCHAR(50) NULL, 
    [Email] NVARCHAR(50) NULL
)
