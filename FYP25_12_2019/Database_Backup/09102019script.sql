USE [master]
GO
/****** Object:  Database [FYP]    Script Date: 10/9/2019 2:17:37 AM ******/
CREATE DATABASE [FYP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FYP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FYP.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FYP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FYP_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FYP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FYP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FYP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FYP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FYP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FYP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FYP] SET ARITHABORT OFF 
GO
ALTER DATABASE [FYP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FYP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FYP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FYP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FYP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FYP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FYP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FYP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FYP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FYP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FYP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FYP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FYP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FYP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FYP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FYP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FYP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FYP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FYP] SET  MULTI_USER 
GO
ALTER DATABASE [FYP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FYP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FYP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FYP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FYP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FYP]
GO
/****** Object:  Table [dbo].[BID]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[u_id] [int] NULL,
	[bid_Amount] [int] NULL,
	[bid_date] [date] NULL,
 CONSTRAINT [PK_BID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[C_id] [int] IDENTITY(1,1) NOT NULL,
	[C_Name] [varchar](50) NULL,
	[C_Active] [char](1) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[C_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[User_name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[User_email] [varchar](50) NOT NULL,
	[User_contact] [varchar](15) NULL,
	[User_Profile] [varchar](500) NULL,
	[Pass_exp] [date] NULL,
	[Last_login] [date] NULL,
	[User_Active] [char](1) NULL CONSTRAINT [DF_Login_User_Active]  DEFAULT ('Y'),
	[Role_id] [int] NULL CONSTRAINT [DF_Login_Role_id]  DEFAULT ((2)),
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[Menu_id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_name] [varchar](50) NULL,
	[Menu_URL] [varchar](50) NULL,
	[Menu_parent_id] [int] NULL,
	[Menu_Active] [char](1) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[P_id] [int] NULL,
	[P_Images] [varchar](50) NULL,
 CONSTRAINT [PK_Product_Detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product_Master]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Master](
	[P_id] [int] NOT NULL,
	[P_date] [date] NULL,
	[P_Name] [varchar](50) NULL,
	[P_desc] [varchar](500) NULL,
	[User_id] [int] NULL,
	[Make] [varchar](50) NULL,
	[Condition] [varchar](5) NULL,
	[Ad_title] [varchar](500) NULL,
	[Price] [int] NULL,
	[State_id] [int] NULL,
	[C_id] [int] NULL,
	[Sold_product] [char](1) NULL CONSTRAINT [DF_Product_Master_Sold_product]  DEFAULT ('N'),
 CONSTRAINT [PK_Product_Master] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [int] IDENTITY(1,1) NOT NULL,
	[Role_name] [varchar](50) NULL,
	[Role_Active] [char](1) NULL,
	[Menu_id] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[S_id] [int] IDENTITY(1,1) NOT NULL,
	[S_name] [varchar](50) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[S_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_privilege]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_privilege](
	[Role_id] [int] NULL,
	[Menu_id] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BID] ON 

INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (2005, 6, 3, 12345, CAST(N'2019-08-15' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (3005, 5, 2, 2, CAST(N'2019-08-18' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (3006, 9, 2, 50, CAST(N'2019-08-18' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (4007, 13, 1, 500, CAST(N'2019-08-30' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6005, 4, 1, 10, CAST(N'2019-09-09' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6006, 4, 2, 2, CAST(N'2019-09-09' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6007, 17, 9, 200, CAST(N'2019-10-09' AS Date))
SET IDENTITY_INSERT [dbo].[BID] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (1, N'Mobile', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (2, N'Cars', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (3, N'hellow', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (1, N'Sheikh M Sahal', N'1234', N's.m.sahal786@gmail.com', N'03362582599', N'~/Content/Images/b1.jpg', CAST(N'2019-01-21' AS Date), CAST(N'2019-10-09' AS Date), N'N', 1)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (2, N'T', N'1234', N'T@gmail.com', N'03112648918', N't.jpg', CAST(N'2019-07-01' AS Date), CAST(N'2019-10-06' AS Date), N'N', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (3, N'IR', N'123', N'IR@gmail.com', N'123456789', N'IR.jpeg', CAST(N'2019-01-01' AS Date), CAST(N'2019-09-29' AS Date), N'Y', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (4, N'BH', N'822', N'BH@gmail.com', N'123456', NULL, CAST(N'2019-02-20' AS Date), CAST(N'2019-09-30' AS Date), N'N', 1)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (7, N'bhabhi', N'12345', N'bhabhi@gmail.com', N'03342320833', N'~/Content/Images/download.jpg', NULL, CAST(N'2019-10-09' AS Date), N'N', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (8, N'irfan', N'12345', N'irfan@gmail.com', N'031187110', N'~/Content/Images/b2.jpg', NULL, CAST(N'2019-10-06' AS Date), N'N', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (9, N'Sahal Qasim', N'12345', N'sahal@gmail.com', N'03118711062', N'~/Content/Images/b1.jpg', NULL, CAST(N'2019-10-09' AS Date), N'N', 2)
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (1, N'Dashboard', N'Dashboard/index', NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (2, N'Details', NULL, NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (3, N'Ads', N'pads/index', 2, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (4, N'My Ads', N'Myads/Index', 2, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (5, N'Change password', N'changepassword/index', NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (6, N'Users Details', NULL, NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (7, N'Users', N'Users/Index', 6, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (8, N'Users_Ads', N'UserAds/index', 6, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (9, N'Category', N'Category/Index', NULL, N'Y')
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Product_Detail] ON 

INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (6, 8, N'~/Content/Images/kerry_simon_style.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (7, 8, N'~/Content/Images/kitchen.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (16, 7, N'~/Content/Images/WIN_20181116_10_40_39_Pro (2).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (17, 7, N'~/Content/Images/WIN_20181123_17_45_08_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (18, 7, N'~/Content/Images/10.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (19, 7, N'~/Content/Images/WIN_20190316_12_40_36_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (20, 7, N'~/Content/Images/WIN_20190412_18_54_17_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (22, 9, N'~/Content/Images/WIN_20181116_10_40_39_Pro (2).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (23, 10, N'~/Content/Images/20.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (26, 11, N'~/Content/Images/IMG_20160827_055959.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1027, 13, N'~/Content/Images/50.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1028, 14, N'~/Content/Images/b1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1029, 14, N'~/Content/Images/b2.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1030, 15, N'~/Content/Images/b1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1034, 7, N'~/Content/Images/b1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1035, 16, N'~/Content/Images/b1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1036, 16, N'~/Content/Images/b2.jpg')
SET IDENTITY_INSERT [dbo].[Product_Detail] OFF
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (4, CAST(N'2019-01-30' AS Date), N'mobile', N'this is a samsung cell', 2, N'2019', N'used', N'galaxy', 12, 1, 1, NULL)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (5, CAST(N'2019-01-30' AS Date), N'chair', N'this is a samsung cell', 2, N'2019', N'used', N'galaxy', 123, 1, 1, NULL)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (6, CAST(N'2019-01-30' AS Date), N'mobile', N'this is a samsung cell', 4, N'2019', N'used', N'galaxy', 12321, 1, 1, NULL)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (7, CAST(N'2019-02-20' AS Date), N'mobile', N'this is my ', 1, N'20', N'N', N'samsung galaxy', 1000, 1, 1, N'Y')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (8, CAST(N'2019-02-20' AS Date), N'mobile', N'this is a samsung cell', 1, N'2019', N'used', N'galaxy', 123, 1, 1, N'Y')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (9, CAST(N'2019-02-20' AS Date), N'chair', N'this is my chair', 2, N'2019', N'used', N'the is a chair', 1, 1, 1, N'Y')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (10, CAST(N'2019-02-20' AS Date), N'bottle', N'this is my bottle 1000liter', 1, N'2020', N'U', N'Bottle', 100000, 2, 2, NULL)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (11, CAST(N'2019-07-26' AS Date), N'BMW', N'this is my BMW', 1, N'2019', N'U', N'this is my BMW', 50, 1, 1, NULL)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (13, CAST(N'2019-07-27' AS Date), N'iphone X', N'this is my Iphonex', 1, N'2019', N'U', N'this is my Iphonex', 3, 1, 1, NULL)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (14, CAST(N'2019-10-05' AS Date), N'Sahal', N'this is sahal', 1, N'2019', N'new', N'this is sahal', 100000, 1, 1, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (15, CAST(N'2019-10-05' AS Date), N'ST', N'this is St', 1, N'2019', N'new', N'this is ST', 10000, 1, 1, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (16, CAST(N'2019-10-06' AS Date), N'photo', N'this is my photo', 8, N'2019', N'N', N'this is my photo', 3000, 3, 2, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (17, CAST(N'2019-10-09' AS Date), N'Iphone', N'this is my Iphone', 9, N'2019', N'N', N'Iphone', 1996, 1, 1, N'Y')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Role_id], [Role_name], [Role_Active], [Menu_id]) VALUES (1, N'Admin', N'Y', NULL)
INSERT [dbo].[Role] ([Role_id], [Role_name], [Role_Active], [Menu_id]) VALUES (2, N'User', N'Y', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([S_id], [S_name]) VALUES (1, N'Karachi')
INSERT [dbo].[State] ([S_id], [S_name]) VALUES (2, N'Lahore')
INSERT [dbo].[State] ([S_id], [S_name]) VALUES (3, N'Islamabad')
SET IDENTITY_INSERT [dbo].[State] OFF
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 1)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 2)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 3)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 4)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 5)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 6)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 7)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 8)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (2, 1)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (2, 2)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (2, 3)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (2, 4)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (2, 5)
INSERT [dbo].[User_privilege] ([Role_id], [Menu_id]) VALUES (1, 9)
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Role]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product_Master] FOREIGN KEY([P_id])
REFERENCES [dbo].[Product_Master] ([P_id])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product_Master]
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD  CONSTRAINT [FK_Product_Master_Category] FOREIGN KEY([C_id])
REFERENCES [dbo].[Category] ([C_id])
GO
ALTER TABLE [dbo].[Product_Master] CHECK CONSTRAINT [FK_Product_Master_Category]
GO
ALTER TABLE [dbo].[Product_Master]  WITH CHECK ADD  CONSTRAINT [FK_Product_Master_State] FOREIGN KEY([State_id])
REFERENCES [dbo].[State] ([S_id])
GO
ALTER TABLE [dbo].[Product_Master] CHECK CONSTRAINT [FK_Product_Master_State]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Menu] FOREIGN KEY([Menu_id])
REFERENCES [dbo].[Menu] ([Menu_id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Menu]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Role]
GO
ALTER TABLE [dbo].[User_privilege]  WITH CHECK ADD  CONSTRAINT [FK_User_privilege_Menu] FOREIGN KEY([Menu_id])
REFERENCES [dbo].[Menu] ([Menu_id])
GO
ALTER TABLE [dbo].[User_privilege] CHECK CONSTRAINT [FK_User_privilege_Menu]
GO
ALTER TABLE [dbo].[User_privilege]  WITH CHECK ADD  CONSTRAINT [FK_User_privilege_Role] FOREIGN KEY([Role_id])
REFERENCES [dbo].[Role] ([Role_id])
GO
ALTER TABLE [dbo].[User_privilege] CHECK CONSTRAINT [FK_User_privilege_Role]
GO
/****** Object:  StoredProcedure [dbo].[fetchimagewisedata]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fetchimagewisedata]
AS
select m.P_id , format(m.p_date,'dd-MM-yyyy')p_Date , m.P_Name , m.P_desc , m.Price, ISNULL(d.P_Images,'~/Content/Images/img_not_found.jpg') p_image
from product_master m 
left join Product_Detail d
on m.P_id = d.P_id
and d.id in (select min(id) from Product_Detail group by p_id)
order by d.id;


GO
/****** Object:  StoredProcedure [dbo].[Searchwithitems]    Script Date: 10/9/2019 2:17:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Searchwithitems] @C_Name nvarchar(30)
AS
select m.P_id , format(m.p_date,'dd-MM-yyyy')p_Date , m.P_Name , m.P_desc , m.Price, ISNULL(d.P_Images,'~/Content/Images/img_not_found.jpg') p_image
,c.C_Name
from product_master m 
inner join Category c
on c.C_id = m.C_id
and c.C_Name = @C_Name
left join Product_Detail d
on m.P_id = d.P_id
and d.id in (select min(id) from Product_Detail group by p_id)
order by d.id;


GO
USE [master]
GO
ALTER DATABASE [FYP] SET  READ_WRITE 
GO
