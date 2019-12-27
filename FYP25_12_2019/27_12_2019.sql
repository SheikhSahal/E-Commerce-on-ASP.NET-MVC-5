USE [master]
GO
/****** Object:  Database [FYP]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[BID]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[Login]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[Product_Master]    Script Date: 12/27/2019 10:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product_Master](
	[P_id] [int] NOT NULL,
	[P_date] [date] NULL,
	[P_Name] [varchar](1000) NULL,
	[P_desc] [varchar](1000) NULL,
	[User_id] [int] NULL,
	[Make] [varchar](50) NULL,
	[Condition] [varchar](5) NULL,
	[Ad_title] [varchar](1000) NULL,
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 12/27/2019 10:54:11 PM ******/
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
/****** Object:  Table [dbo].[User_privilege]    Script Date: 12/27/2019 10:54:11 PM ******/
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
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6009, 6, 10, 10321, CAST(N'2019-12-21' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6010, 18, 12, 50, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6011, 18, 1, 100, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6012, 18, 2, 1500, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6013, 5, 14, 700000, CAST(N'2019-12-25' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6015, 3, 15, 500000, CAST(N'2019-12-27' AS Date))
INSERT [dbo].[BID] ([id], [p_id], [u_id], [bid_Amount], [bid_date]) VALUES (6016, 3, 14, 600000, CAST(N'2019-12-27' AS Date))
SET IDENTITY_INSERT [dbo].[BID] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (1, N'Mobile', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (2, N'Cars', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (3, N'Bags', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (4, N'Computers', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (5, N'Monitors', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (6, N'Mouse', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (7, N'Keyboards', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (8, N'Clothes', N'Y')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (13, N'Abbas', N'1234', N'Abbas@gmail.com', N'03318756461', N'~/Content/Images/image (4).jpg', NULL, CAST(N'2019-12-27' AS Date), N'N', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (14, N'Hashim Ali Joyia', N'123456', N'HashimAliJoyia@outlook.com', N'03221578975', N'~/Content/Images/cor3.jpg', NULL, CAST(N'2019-12-27' AS Date), N'Y', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (15, N'Samii', N'1234', N'sami@gmail.com', N'3115498464', N'~/Content/Images/car01.jpg', NULL, CAST(N'2019-12-27' AS Date), N'N', 1)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (16, N'sahal', N'1234', N's.m.sahal@gmail.com', N'03118711062', N'~/Content/Images/car08.jpg', NULL, CAST(N'2019-12-25' AS Date), N'N', 2)
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

INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1038, 2, N'~/Content/Images/image (1).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1039, 2, N'~/Content/Images/image (2).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1040, 2, N'~/Content/Images/image (3).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1041, 2, N'~/Content/Images/image (4).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1042, 2, N'~/Content/Images/image.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1043, 3, N'~/Content/Images/cul1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1044, 3, N'~/Content/Images/cul2.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1045, 3, N'~/Content/Images/cul3.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1046, 3, N'~/Content/Images/cul4.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1047, 3, N'~/Content/Images/cul5.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1048, 3, N'~/Content/Images/cul6.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1049, 4, N'~/Content/Images/cor1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1050, 4, N'~/Content/Images/cor2.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1051, 4, N'~/Content/Images/cor3.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1052, 4, N'~/Content/Images/cor4.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1053, 5, N'~/Content/Images/car0.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1054, 5, N'~/Content/Images/car01.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1055, 5, N'~/Content/Images/car02.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1056, 5, N'~/Content/Images/car03.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1057, 5, N'~/Content/Images/car04.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1058, 5, N'~/Content/Images/car05.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1059, 5, N'~/Content/Images/car06.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1060, 5, N'~/Content/Images/car07.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1061, 5, N'~/Content/Images/car08.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1062, 5, N'~/Content/Images/car09.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1063, 5, N'~/Content/Images/car10.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1064, 5, N'~/Content/Images/car11.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1065, 6, N'~/Content/Images/iphone01.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1066, 6, N'~/Content/Images/iphone02.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1067, 6, N'~/Content/Images/iphone03.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1068, 6, N'~/Content/Images/iphone04.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1069, 6, N'~/Content/Images/iphone05.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1070, 7, N'~/Content/Images/sam1.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1071, 7, N'~/Content/Images/sam2.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1072, 7, N'~/Content/Images/sam3.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1073, 7, N'~/Content/Images/sam4.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1074, 7, N'~/Content/Images/sam5.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1075, 8, N'~/Content/Images/samsung01.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1076, 8, N'~/Content/Images/samsung02.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1077, 8, N'~/Content/Images/samsung03.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1078, 8, N'~/Content/Images/samsung04.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1079, 9, N'~/Content/Images/bags01.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1080, 9, N'~/Content/Images/bags02.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1081, 10, N'~/Content/Images/ba01.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1082, 10, N'~/Content/Images/ba02.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1083, 10, N'~/Content/Images/ba03.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1084, 10, N'~/Content/Images/ba04.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1085, 11, N'~/Content/Images/b0301.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1086, 11, N'~/Content/Images/b0302.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1087, 11, N'~/Content/Images/b0303.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (1088, 12, N'~/Content/Images/POSTER11-converted_page-0001.jpg')
SET IDENTITY_INSERT [dbo].[Product_Detail] OFF
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (2, CAST(N'2019-12-12' AS Date), N'Honda civic manual hard top', N'Neat and clean car. Total honda maintained. Complete service history available. Second owner, genuine documents, one fender paint rest genuine. Car kept with care. Price negotiable.  Can be seen near phase 5 dha', 13, N'2019', N'N', N'Honda civic manual hard top', 2150000, 1, 2, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (3, CAST(N'2019-12-07' AS Date), N'Cultus VXR 2007', N'Cultux VXR 2007 no any problem we just sell for buy new.  Condition 10/9  CNG Petrol both.  Contact serious buyers', 13, N'2007', N'N', N'Cultus VXR 2007', 580000, 1, 2, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (4, CAST(N'2019-12-02' AS Date), N'In seals minor touching on sides chhatt front back genuine', N'Xli 2007 good condition', 14, N'2010', N'N', N'In seals minor touching on sides chhatt front back genuine', 1050002, 1, 2, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (5, CAST(N'2019-12-07' AS Date), N'civic dolphine full sport k24', N'K24  FOR SALE  Model 1994  Honda civic  Engine swap k24  Lsd gear  6 puck clutch  Complete down piping with Waqar custom made mufler installed  Intake manifold  Gready gauges installed  Bucket seats installed  Shiny yellow colour  Deep dish 15”Rims with low profile imported tyers  4 Coilovers with 2 ways adjustment  Back cambered kit installed  New cleaned dashboard  HID lights  Momo Deep dish steering  Back Sturd baar  New daweo dry battery  Mugen speed o meter  Bodykit  Original documents with original number plates and CPLC cleared  No work required', 15, N'2011', N'N', N'civic dolphine full sport k24', 790000, 1, 2, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (6, CAST(N'2019-12-07' AS Date), N'IPhone xs max 64gb, complete accessories.', N'IPhone xs max 64gb single sim, complete unused accessories. Sealed hea. Battery health 99%. Condition is 10/10.', 16, N'2010', N'N', N'IPhone xs max 64gb, complete accessories.', 145000, 1, 1, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (7, CAST(N'2019-12-04' AS Date), N'Samsung note9 ...10by10', N'Complete box .Good condition .Only chat olx ..', 16, N'2010', N'N', N'Samsung note9 ...10by10', 98000, 1, 1, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (8, CAST(N'2019-12-06' AS Date), N'Note 5', N'Samsung Note 5 16000 Final', 16, N'2008', N'N', N'Note 5', 16000, 1, 1, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (9, CAST(N'2019-12-03' AS Date), N'Laptop Backpack, Laptop Backpack,Water Resistant College School Bag', N'Brand New  Fixed Price Rs. 1000  Laptop Backpack,Business Durable Laptops Backpack Port,Water Resistant College School Computer Bag for Women & Men Fits 15.6 Inch Laptop and Notebook', 15, N'2007', N'N', N'Laptop Backpack, Laptop Backpack,Water Resistant College School Bag', 999, 1, 3, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (10, CAST(N'2019-12-06' AS Date), N'ORIGINAL US TRAVELING BAG', N'ITS ORIGINAL US LUGAGE HAND TRAVELLING BAG I PURCHASE IT 115 US DOLLAR ITS VERY STRONG MORE  CAPACITY', 15, N'2018', N'N', N'ORIGINAL US TRAVELING BAG', 8000, 1, 3, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (11, CAST(N'2019-12-04' AS Date), N'Dunlop leather bag', N'Original leather bag  Price slighltly negotiable  Contact zero three zero two two six zero three nine nine four', 15, N'2008', N'N', N'Dunlop leather bag', 2500, 1, 3, N'N')
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id], [Sold_product]) VALUES (12, CAST(N'2019-12-07' AS Date), N'this is my ad', N'this is my ads', 14, N'2014', N'N', N'this is my ad', 123, 1, 1, N'Y')
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
/****** Object:  StoredProcedure [dbo].[fetchimagewisedata]    Script Date: 12/27/2019 10:54:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fetchimagewisedata]
AS
select top 16 m.P_id , format(m.p_date,'dd-MM-yyyy')p_Date , m.P_Name , m.P_desc , m.Price, ISNULL(d.P_Images,'~/Content/Images/img_not_found.jpg') p_image
from product_master m 
left join Product_Detail d
on m.P_id = d.P_id
and d.id in (select min(id) from Product_Detail group by p_id)
order by d.id desc;


GO
/****** Object:  StoredProcedure [dbo].[Searchwithitems]    Script Date: 12/27/2019 10:54:11 PM ******/
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
