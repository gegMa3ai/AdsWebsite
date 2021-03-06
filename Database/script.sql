USE [AdsDB]
GO
/****** Object:  User [AdsDbAdmin]    Script Date: 09.01.2018 16:24:54 ******/
CREATE USER [AdsDbAdmin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
ALTER ROLE [db_owner] ADD MEMBER [AdsDbAdmin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [AdsDbAdmin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [AdsDbAdmin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [AdsDbAdmin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [AdsDbAdmin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [AdsDbAdmin]
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[Picture] [varchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
	[LocationId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[ConditionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[ParentCategoryId] [int] NULL,
	[Remarks] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conditions]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conditions](
	[ConditionId] [int] IDENTITY(1,1) NOT NULL,
	[ConditionName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[EmailId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[EmailValue] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phones]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[PhoneId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 09.01.2018 16:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ads] ADD  DEFAULT ((0)) FOR [ConditionId]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Categories]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Conditions] FOREIGN KEY([ConditionId])
REFERENCES [dbo].[Conditions] ([ConditionId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Conditions]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Locations]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Types]
GO
ALTER TABLE [dbo].[Ads]  WITH NOCHECK ADD  CONSTRAINT [FK_Ads_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Users]
GO
ALTER TABLE [dbo].[Emails]  WITH NOCHECK ADD  CONSTRAINT [FK_Emails_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Users]
GO
ALTER TABLE [dbo].[Phones]  WITH NOCHECK ADD  CONSTRAINT [FK_Phones_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_Users]
GO
ALTER TABLE [dbo].[Users]  WITH NOCHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[CreateAd]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAd]

	@Name         VARCHAR (50),
	@UserName     VARCHAR (50),
	@Description  VARCHAR (MAX),
	@Picture      VARCHAR (MAX),
	@Price        DECIMAL (18, 2),
	@CategoryId   INT,
	@CreationDate DATETIME,
	@LocationId   INT,
	@TypeId       INT,
	@ConditionId  INT
AS
DECLARE @Id int;
	
INSERT INTO Ads
([Name], UserName, [Description], Picture, Price, CategoryId, CreationDate, LocationId, TypeId, ConditionId)
VALUES 
(@Name, @UserName, @Description, @Picture, @Price, @CategoryId, @CreationDate, @LocationId, @TypeId, @ConditionId)

SET @Id = @@IDENTITY;
GO
/****** Object:  StoredProcedure [dbo].[CreateEmail]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateEmail]
	@UserName     VARCHAR (50),
	@EmailValue  VARCHAR (50)
AS
DECLARE @EmailId int;
	
INSERT INTO Emails
(UserName, [EmailValue])
VALUES 
(@UserName, @EmailValue)

SET @EmailId = @@IDENTITY;
GO
/****** Object:  StoredProcedure [dbo].[CreatePhone]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePhone]
	@UserName     VARCHAR (50),
	@PhoneNumber  VARCHAR (50)
AS
DECLARE @PhoneId int;
	
INSERT INTO Phones
(UserName, [PhoneNumber])
VALUES 
(@UserName, @PhoneNumber)

SET @PhoneId = @@IDENTITY;
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]

	@UserName     VARCHAR (50),
	@RoleId		  INT

AS
INSERT INTO Users
(UserName, [Password], RoleId)
VALUES 
(@UserName, @UserName, @RoleId)
GO
/****** Object:  StoredProcedure [dbo].[DeleteAd]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAd]
@Id	INT
AS
DELETE Ads
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmail]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmail]
@EmailId	INT
AS
DELETE Emails
WHERE EmailId = @EmailId
GO
/****** Object:  StoredProcedure [dbo].[DeletePhone]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePhone]
@PhoneId	INT
AS
DELETE Phones
WHERE PhoneId = @PhoneId
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
@UserName	VARCHAR (50)
AS
DELETE Users
WHERE UserName = @UserName
GO
/****** Object:  StoredProcedure [dbo].[EditAd]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditAd]
	@Id			  INT,
	@Name         VARCHAR (50),
	@UserName     VARCHAR (50),
	@Description  VARCHAR (MAX),
	@Picture      VARCHAR (MAX),
	@Price        DECIMAL (18, 2),
	@CategoryId   INT,
	@CreationDate DATETIME,
	@LocationId   INT,
	@TypeId       INT,
	@ConditionId  INT
AS
UPDATE Ads
SET
	[Name] = @Name, 
	UserName = @UserName, 
	[Description] = @Description,
	Picture = @Picture,
	Price =	@Price,
	CategoryId = @CategoryId,
	CreationDate = @CreationDate,
	LocationId = @LocationId,
	TypeId = @TypeId,
	ConditionId = @ConditionId 
WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[EditEmail]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditEmail]
	@EmailId   INT,
	@UserName     VARCHAR (50),
	@EmailValue     VARCHAR (50)
AS
UPDATE Emails
SET
	@EmailValue = @EmailValue,
	UserName = @UserName
WHERE EmailId = @EmailId
GO
/****** Object:  StoredProcedure [dbo].[EditPassword]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditPassword]
	@UserName     VARCHAR (50),
	@Password	  VARCHAR (50)
AS
UPDATE Users
SET
	[Password] = @Password
WHERE UserName = @UserName
GO
/****** Object:  StoredProcedure [dbo].[EditPhone]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditPhone]
	@PhoneId   INT,
	@UserName     VARCHAR (50),
	@PhoneNumber     VARCHAR (50)
AS
UPDATE Phones
SET
	PhoneNumber = @PhoneNumber,
	UserName = @UserName
WHERE PhoneId = @PhoneId
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditUser]
	@UserName     VARCHAR (50),
	@RoleId   INT
AS
UPDATE Users
SET
	RoleId = @RoleId
WHERE UserName = @UserName
GO
/****** Object:  StoredProcedure [dbo].[GetAdDetails]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAdDetails] 
	@Id INT
AS
SELECT 
Ads.UserName, 
Ads.Name,
Ads.Description,
Ads.Picture,
Ads.Price,
Categories.CategoryName,
Ads.CreationDate,
Locations.LocationName,
Types.TypeName,
Conditions.ConditionName   

FROM Ads 
JOIN Locations ON Locations.LocationId = Ads.LocationId
JOIN Categories ON Categories.CategoryId = Ads.CategoryId
JOIN Types ON Types.TypeId = Ads.TypeId
JOIN Conditions ON Conditions.ConditionId = Ads.ConditionId
WHERE Ads.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[GetAds]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAds]
AS
  SELECT * FROM Ads;
GO
/****** Object:  StoredProcedure [dbo].[GetAdsByCategory]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdsByCategory]
	@categoryId INT
AS
  SELECT * FROM Ads WHERE Ads.CategoryId = @categoryId;
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCategories]
AS
  SELECT * FROM Categories;
GO
/****** Object:  StoredProcedure [dbo].[GetConditions]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetConditions]
AS
  SELECT * FROM Conditions;
GO
/****** Object:  StoredProcedure [dbo].[GetEmails]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEmails]
	@UserName NVARCHAR (50)
AS
  SELECT * FROM Emails
WHERE UserName = @UserName;
GO
/****** Object:  StoredProcedure [dbo].[GetLocations]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetLocations]
AS
  SELECT * FROM Locations;
GO
/****** Object:  StoredProcedure [dbo].[GetPhones]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPhones]
@UserName NVARCHAR (50)
AS
SELECT * FROM Phones
WHERE UserName = @UserName;
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRoles]
AS
  SELECT * FROM Roles;
GO
/****** Object:  StoredProcedure [dbo].[GetTypes]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetTypes]
AS
  SELECT * FROM [Types];
GO
/****** Object:  StoredProcedure [dbo].[GetUserDetails]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetUserDetails]
	@UserName NVARCHAR (50)
AS

SELECT Users.UserName, Roles.RoleId, Roles.RoleName
FROM Users
JOIN Roles ON Roles.RoleId = Users.RoleId
WHERE Users.UserName = @UserName;
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetUsers]
AS
SELECT Users.UserName, Roles.RoleId, Roles.RoleName
FROM Users
JOIN Roles ON Roles.RoleId = Users.RoleId
GO
/****** Object:  StoredProcedure [dbo].[IsValidUser]    Script Date: 09.01.2018 16:24:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsValidUser]
	@UserName VARCHAR (50),
	@Password VARCHAR (50)
AS
  SELECT * FROM Users WHERE UserName = @UserName AND Password = @Password
GO
