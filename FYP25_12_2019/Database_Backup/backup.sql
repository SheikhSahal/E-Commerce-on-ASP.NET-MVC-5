USE [FYP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
/****** Object:  Table [dbo].[Login]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
	[User_Active] [char](1) NULL,
	[Role_id] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
/****** Object:  Table [dbo].[Product_Master]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
 CONSTRAINT [PK_Product_Master] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
/****** Object:  Table [dbo].[User_privilege]    Script Date: 12-Jul-19 5:03:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_privilege](
	[Role_id] [int] NULL,
	[Menu_id] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (1, N'Mobile', N'Y')
INSERT [dbo].[Category] ([C_id], [C_Name], [C_Active]) VALUES (2, N'Cars', N'Y')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (1, N'Sahal', N'12345', N's.m.sahal786@outlook.com', N'03118711062', N'pic.jpg', CAST(N'2019-01-21' AS Date), CAST(N'2019-01-01' AS Date), N'Y', 1)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (2, N'T', N'1234', N'T@gmail.com', N'03112648918', N't.jpg', CAST(N'2019-07-01' AS Date), CAST(N'2019-08-05' AS Date), N'Y', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (3, N'IR', N'123', N'IR@gmail.com', N'123456789', N'IR.jpeg', CAST(N'2019-01-01' AS Date), CAST(N'2019-07-20' AS Date), N'Y', 2)
INSERT [dbo].[Login] ([User_id], [User_name], [Password], [User_email], [User_contact], [User_Profile], [Pass_exp], [Last_login], [User_Active], [Role_id]) VALUES (4, N'BH', N'822', N'BH@gmail.com', N'123456', N'BH.jpg', CAST(N'2019-02-20' AS Date), CAST(N'2019-08-17' AS Date), N'Y', 1)
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (1, N'Dashboard', NULL, NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (2, N'Details', NULL, NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (3, N'Ads', NULL, 2, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (4, N'My Ads', NULL, 2, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (5, N'Change password', NULL, NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (6, N'Users Details', NULL, NULL, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (7, N'Users', NULL, 6, N'Y')
INSERT [dbo].[Menu] ([Menu_id], [Menu_name], [Menu_URL], [Menu_parent_id], [Menu_Active]) VALUES (8, N'Users_Ads', NULL, 6, N'Y')
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Product_Detail] ON 

INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (6, 8, N'~/Content/Images/kerry_simon_style.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (7, 8, N'~/Content/Images/kitchen.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (16, 7, N'~/Content/Images/WIN_20181116_10_40_39_Pro (2).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (17, 7, N'~/Content/Images/WIN_20181123_17_45_08_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (18, 7, N'~/Content/Images/10.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (19, 7, N'~/Content/Images/WIN_20190316_12_40_36_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (20, 7, N'~/Content/Images/WIN_20190412_18_54_17_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (21, 7, N'~/Content/Images/WIN_20190509_14_15_51_Pro.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (22, 9, N'~/Content/Images/WIN_20181116_10_40_39_Pro (2).jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (23, 10, N'~/Content/Images/20.jpg')
INSERT [dbo].[Product_Detail] ([id], [P_id], [P_Images]) VALUES (25, 7, N'~/Content/Images/WIN_20181222_11_04_10_Pro.jpg')
SET IDENTITY_INSERT [dbo].[Product_Detail] OFF
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (4, CAST(N'2019-01-30' AS Date), N'mobile', N'this is a samsung cell', 2, N'2019', N'used', N'galaxy', 12, 1, 1)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (5, CAST(N'2019-01-30' AS Date), N'chair', N'this is a samsung cell', 2, N'2019', N'used', N'galaxy', 123, 1, 1)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (6, CAST(N'2019-01-30' AS Date), N'mobile', N'this is a samsung cell', 2, N'2019', N'used', N'galaxy', 12321, 1, 1)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (7, CAST(N'2019-02-20' AS Date), N'mobile moto', N'this is my cell 1', 1, N'2020', N'U', N'galaxy', 1231, 1, 1)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (8, CAST(N'2019-02-20' AS Date), N'mobile', N'this is a samsung cell', 1, N'2019', N'used', N'galaxy', 123, 1, 1)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (9, CAST(N'2019-02-20' AS Date), N'chair', N'this is my chair', 2, N'2019', N'used', N'the is a chair', 1, 1, 1)
INSERT [dbo].[Product_Master] ([P_id], [P_date], [P_Name], [P_desc], [User_id], [Make], [Condition], [Ad_title], [Price], [State_id], [C_id]) VALUES (10, CAST(N'2019-02-20' AS Date), N'bottle', N'this is my bottle 1000liter', 1, N'2020', N'U', N'Bottle', 100000, 2, 2)
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
/****** Object:  StoredProcedure [dbo].[fetchimagewisedata]    Script Date: 12-Jul-19 5:03:19 PM ******/
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
