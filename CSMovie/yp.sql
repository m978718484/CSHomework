USE [master]
GO
/****** Object:  Database [yp]    Script Date: 12/31/2016 10:24:36 AM ******/
CREATE DATABASE [yp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'yp', FILENAME = N'D:\project\sql\slqserver\data\yp.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'yp_log', FILENAME = N'D:\project\sql\slqserver\data\yp_log.ldf' , SIZE = 16640KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [yp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [yp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [yp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [yp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [yp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [yp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [yp] SET ARITHABORT OFF 
GO
ALTER DATABASE [yp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [yp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [yp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [yp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [yp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [yp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [yp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [yp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [yp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [yp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [yp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [yp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [yp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [yp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [yp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [yp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [yp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [yp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [yp] SET RECOVERY FULL 
GO
ALTER DATABASE [yp] SET  MULTI_USER 
GO
ALTER DATABASE [yp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [yp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [yp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [yp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'yp', N'ON'
GO
USE [yp]
GO
/****** Object:  User [zhy]    Script Date: 12/31/2016 10:24:36 AM ******/
CREATE USER [zhy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ZhangHY]    Script Date: 12/31/2016 10:24:36 AM ******/
CREATE USER [ZhangHY] FOR LOGIN [ZhangHY] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sc]    Script Date: 12/31/2016 10:24:36 AM ******/
CREATE USER [sc] FOR LOGIN [sc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [jcj]    Script Date: 12/31/2016 10:24:36 AM ******/
CREATE USER [jcj] FOR LOGIN [jcj] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [zhy]
GO
ALTER ROLE [db_owner] ADD MEMBER [ZhangHY]
GO
ALTER ROLE [db_owner] ADD MEMBER [sc]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [sc]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [sc]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [sc]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [sc]
GO
ALTER ROLE [db_datareader] ADD MEMBER [sc]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [sc]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [sc]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [sc]
GO
ALTER ROLE [db_owner] ADD MEMBER [jcj]
GO
/****** Object:  Table [dbo].[customerType]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerType](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_customerType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discount]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[customerTypeId] [tinyint] NOT NULL,
	[discountModeId] [tinyint] NOT NULL,
	[number] [numeric](10, 2) NOT NULL,
	[startDateTime] [datetime] NOT NULL,
	[duration] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[discountMode]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discountMode](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_discountMode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hall]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hall](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[layoutId] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[theme] [nvarchar](50) NULL,
 CONSTRAINT [PK_hall] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[layout]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[layout](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[style] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_layout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movie]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[movie](
	[id] [nvarchar](36) NOT NULL,
	[name] [nvarchar](50) NULL,
	[movieTypeId] [tinyint] NOT NULL,
	[duration] [tinyint] NOT NULL,
	[poster] [varbinary](max) NULL,
 CONSTRAINT [PK_movie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[movieSchedule]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movieSchedule](
	[id] [nvarchar](36) NOT NULL,
	[movieId] [nvarchar](36) NOT NULL,
	[scheduleId] [int] NOT NULL,
 CONSTRAINT [PK_movieSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movieType]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movieType](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_movieType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[originPrice]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[originPrice](
	[priceTempletId] [int] IDENTITY(1,1) NOT NULL,
	[positionTypeId] [tinyint] NOT NULL,
	[playId] [nvarchar](36) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[play]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[play](
	[id] [nvarchar](36) NOT NULL,
	[hallId] [smallint] NOT NULL,
	[date] [date] NOT NULL,
	[beginTime] [time](7) NOT NULL,
	[movieScheduleId] [nvarchar](36) NOT NULL,
 CONSTRAINT [PK_play] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[position]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rowNum] [int] NOT NULL,
	[colNum] [int] NOT NULL,
	[positionTypeId] [tinyint] NOT NULL,
	[useAble] [bit] NOT NULL,
	[layoutId] [int] NOT NULL,
 CONSTRAINT [PK_positionLayout] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[positionType]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[positionType](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_positionType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[priceTemplet]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[priceTemplet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [numeric](10, 2) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_priceTemplet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[schedule]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[beginDate] [date] NOT NULL,
	[duration] [smallint] NOT NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ticket]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[positionId] [int] NOT NULL,
	[customerTypeId] [tinyint] NOT NULL,
	[sellPrice] [numeric](10, 2) NOT NULL,
	[sellDateTime] [datetime] NOT NULL,
	[playId] [nvarchar](36) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_discount]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_discount]
as
select d.*
,ct.name as coustomerTypeName
,m.name as discountModeName
from discount as d
inner join customerType as ct on ct.id = d.customerTypeId
inner join discountMode as m on m.id = d.discountModeId

GO
/****** Object:  View [dbo].[vw_hall]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_hall]
as
select h.*
,l.style as layoutStyle
from hall as h
inner join layout as l on h.layoutId=l.id

GO
/****** Object:  View [dbo].[vw_hall_layout]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_hall_layout]
as
select h.id as hallId
,h.name as hallName
,h.theme as hallTheme
,l.id as layoutId
,l.style as layoutStyle
from hall as h
inner join layout as l on h.layoutId=l.id

GO
/****** Object:  View [dbo].[vw_layout]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_layout]
as
select l.*, refNum = (
select count(h.layoutId) from hall as h where h.layoutId = l.id
)
from layout as l

GO
/****** Object:  View [dbo].[vw_movie]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_movie]
as
select o.*
,e.name as movieTypeName
from movie as o
inner join movieType as e on e.id=o.movieTypeId

GO
/****** Object:  View [dbo].[vw_movieSchedule]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_movieSchedule]
as
select ms.*
,m.name as movieName
,m.duration as movieDuration
,m.movieTypeId
,mt.Name as movieTypeName
,s.name as scheduleName
,s.beginDate as scheduleBeginDate
,s.duration as scheduleDuration
from movieSchedule as ms
inner join movie as m on ms.movieId=m.id
inner join movieType as mt on mt.id = m.movieTypeId
inner join schedule as s  on ms.scheduleId=s.id

GO
/****** Object:  View [dbo].[vw_originPrice]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_originPrice]
as
select o.*
,pt.name as priceTempletName
,pt.price as priceTempletValue
,post.name as positionTypeName
from originPrice as o
inner join priceTemplet as pt on pt.id=o.priceTempletId
inner join positionType as post on post.id = o.positionTypeId

GO
/****** Object:  View [dbo].[vw_position]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_position]
as
select p.*
,pt.name as positionTypeName
,l.style as layoutStyle
from position as p
inner join layout as l on p.layoutId=l.id
inner join positionType pt on p.positionTypeId=pt.id

GO
/****** Object:  View [dbo].[vw_ticket]    Script Date: 12/31/2016 10:24:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_ticket]
as
select t.*
,s.name as scheduleName
,s.id as scheduleid
,m.name as movieName
,m.id as movieId
,play.date as playDate
,play.beginTime as playBeginTime
,h.id as hallId
,h.name as hallName
,p.rowNum
,p.colNum
,pt.name as positionTypeName
,pt.id as positionTypeId
from ticket as t
inner join position as p on p.id = t.positionId
inner join positionType as pt on p.positionTypeId = pt.id
inner join customerType as ct on ct.id = t.customerTypeId
inner join play  on play.id = t.playId
inner join hall as h on h.id = play.hallId
inner join movieSchedule as ms on ms.id=play.movieScheduleId
inner join schedule as s on s.id = ms.scheduleId
inner join movie as m on m.id=ms.movieId

GO
SET IDENTITY_INSERT [dbo].[hall] ON 

INSERT [dbo].[hall] ([id], [layoutId], [name], [theme]) VALUES (2, 2, N'欢乐间', N'情人')
INSERT [dbo].[hall] ([id], [layoutId], [name], [theme]) VALUES (3, 3, N'主要播放', N'一般人')
SET IDENTITY_INSERT [dbo].[hall] OFF
SET IDENTITY_INSERT [dbo].[layout] ON 

INSERT [dbo].[layout] ([id], [style]) VALUES (2, N'怀旧')
INSERT [dbo].[layout] ([id], [style]) VALUES (3, N'科幻')
INSERT [dbo].[layout] ([id], [style]) VALUES (73, N'简洁')
SET IDENTITY_INSERT [dbo].[layout] OFF
SET IDENTITY_INSERT [dbo].[position] ON 

INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (6, 2, 2, 2, 1, 3)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (7, 2, 3, 3, 1, 3)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (8, 3, 1, 3, 1, 3)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2129, 2, 1, 2, 1, 2)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2130, 1, 3, 1, 1, 2)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2131, 1, 2, 1, 1, 2)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2132, 1, 1, 1, 1, 2)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2544, 5, 5, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2545, 5, 4, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2546, 5, 2, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2547, 5, 1, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2548, 4, 5, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2549, 4, 4, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2550, 4, 2, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2551, 4, 1, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2552, 3, 5, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2553, 3, 4, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2554, 3, 2, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2555, 3, 1, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2556, 2, 5, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2557, 2, 4, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2558, 2, 2, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2559, 2, 1, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2560, 1, 5, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2561, 1, 4, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2562, 1, 2, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2563, 1, 1, 1, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2564, 5, 3, 3, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2565, 4, 3, 3, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2566, 3, 3, 3, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2567, 2, 3, 3, 1, 73)
INSERT [dbo].[position] ([id], [rowNum], [colNum], [positionTypeId], [useAble], [layoutId]) VALUES (2568, 1, 3, 3, 1, 73)
SET IDENTITY_INSERT [dbo].[position] OFF
SET IDENTITY_INSERT [dbo].[positionType] ON 

INSERT [dbo].[positionType] ([id], [name]) VALUES (1, N'二等座')
INSERT [dbo].[positionType] ([id], [name]) VALUES (2, N'空')
INSERT [dbo].[positionType] ([id], [name]) VALUES (3, N'通道')
INSERT [dbo].[positionType] ([id], [name]) VALUES (4, N'一等座')
SET IDENTITY_INSERT [dbo].[positionType] OFF
ALTER TABLE [dbo].[discount]  WITH CHECK ADD  CONSTRAINT [FK_discount_customerType] FOREIGN KEY([customerTypeId])
REFERENCES [dbo].[customerType] ([id])
GO
ALTER TABLE [dbo].[discount] CHECK CONSTRAINT [FK_discount_customerType]
GO
ALTER TABLE [dbo].[discount]  WITH CHECK ADD  CONSTRAINT [FK_discount_discountMode] FOREIGN KEY([discountModeId])
REFERENCES [dbo].[discountMode] ([id])
GO
ALTER TABLE [dbo].[discount] CHECK CONSTRAINT [FK_discount_discountMode]
GO
ALTER TABLE [dbo].[hall]  WITH CHECK ADD  CONSTRAINT [FK_hall_layout] FOREIGN KEY([layoutId])
REFERENCES [dbo].[layout] ([id])
GO
ALTER TABLE [dbo].[hall] CHECK CONSTRAINT [FK_hall_layout]
GO
ALTER TABLE [dbo].[movie]  WITH CHECK ADD  CONSTRAINT [FK_movie_movieType] FOREIGN KEY([movieTypeId])
REFERENCES [dbo].[movieType] ([id])
GO
ALTER TABLE [dbo].[movie] CHECK CONSTRAINT [FK_movie_movieType]
GO
ALTER TABLE [dbo].[movieSchedule]  WITH CHECK ADD  CONSTRAINT [FK_movieSchedule_movie] FOREIGN KEY([movieId])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movieSchedule] CHECK CONSTRAINT [FK_movieSchedule_movie]
GO
ALTER TABLE [dbo].[movieSchedule]  WITH CHECK ADD  CONSTRAINT [FK_movieSchedule_schedule] FOREIGN KEY([scheduleId])
REFERENCES [dbo].[schedule] ([id])
GO
ALTER TABLE [dbo].[movieSchedule] CHECK CONSTRAINT [FK_movieSchedule_schedule]
GO
ALTER TABLE [dbo].[originPrice]  WITH CHECK ADD  CONSTRAINT [FK_originPrice_positionType] FOREIGN KEY([positionTypeId])
REFERENCES [dbo].[positionType] ([id])
GO
ALTER TABLE [dbo].[originPrice] CHECK CONSTRAINT [FK_originPrice_positionType]
GO
ALTER TABLE [dbo].[originPrice]  WITH CHECK ADD  CONSTRAINT [FK_originPrice_priceTemplet] FOREIGN KEY([priceTempletId])
REFERENCES [dbo].[priceTemplet] ([id])
GO
ALTER TABLE [dbo].[originPrice] CHECK CONSTRAINT [FK_originPrice_priceTemplet]
GO
ALTER TABLE [dbo].[play]  WITH CHECK ADD  CONSTRAINT [FK_play_hall] FOREIGN KEY([hallId])
REFERENCES [dbo].[hall] ([id])
GO
ALTER TABLE [dbo].[play] CHECK CONSTRAINT [FK_play_hall]
GO
ALTER TABLE [dbo].[play]  WITH CHECK ADD  CONSTRAINT [FK_play_movieSchedule] FOREIGN KEY([movieScheduleId])
REFERENCES [dbo].[movieSchedule] ([id])
GO
ALTER TABLE [dbo].[play] CHECK CONSTRAINT [FK_play_movieSchedule]
GO
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_position_layout] FOREIGN KEY([layoutId])
REFERENCES [dbo].[layout] ([id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_position_layout]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_customerType] FOREIGN KEY([customerTypeId])
REFERENCES [dbo].[customerType] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_customerType]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_play] FOREIGN KEY([playId])
REFERENCES [dbo].[play] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_play]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [FK_ticket_position] FOREIGN KEY([positionId])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [FK_ticket_position]
GO
USE [master]
GO
ALTER DATABASE [yp] SET  READ_WRITE 
GO
