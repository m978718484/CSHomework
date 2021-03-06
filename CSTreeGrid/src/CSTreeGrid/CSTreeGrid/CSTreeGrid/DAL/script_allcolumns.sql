USE [ShopPing]
GO
/****** Object:  Table [dbo].[NewShop]    Script Date: 2016-9-12 18:23:50 ******/
DROP TABLE [dbo].[NewShop]
GO
/****** Object:  Table [dbo].[NewShop]    Script Date: 2016-9-12 18:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewShop](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](50) NOT NULL,
	[ShopLei] [nvarchar](50) NOT NULL,
	[ShopMoney] [float] NOT NULL,
	[ShopPreMoney] [float] NOT NULL,
	[IsSpecial] [bit] NOT NULL,
 CONSTRAINT [PK_NewShop] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[NewShop] ON 

INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (3, N'NUL44L', N'4', 4, 6, 0)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (4, N'百事可乐', N'饮料', 5, 6, 0)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (5, N'冰红茶', N'饮料', 5, 6, 0)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (6, N'方便面', N'食品', 10, 44, 1)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (7, N'乐事薯片', N'食品零食', 10, 44, 1)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (8, N'苹果电脑', N'电子电器', 10, 34, 1)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (9, N'苹果手机', N'电子电器', 20000, 20000, 0)
INSERT [dbo].[NewShop] ([ShopID], [ShopName], [ShopLei], [ShopMoney], [ShopPreMoney], [IsSpecial]) VALUES (10, N'三星曲屏电视', N'家电', 30000, 30000, 0)
SET IDENTITY_INSERT [dbo].[NewShop] OFF
