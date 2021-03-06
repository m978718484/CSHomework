USE [master]
GO
/****** Object:  Database [yp]    Script Date: 12/22/2016 9:03:53 AM ******/
CREATE DATABASE [yp]
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
/****** Object:  User [zhy]    Script Date: 12/22/2016 9:03:53 AM ******/
CREATE USER [zhy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sc]    Script Date: 12/22/2016 9:03:53 AM ******/
CREATE USER [sc] FOR LOGIN [sc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [jcj]    Script Date: 12/22/2016 9:03:53 AM ******/
CREATE USER [jcj] FOR LOGIN [jcj] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [zhy]
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
/****** Object:  Table [dbo].[customerType]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[discount]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[discountMode]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[hall]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[layout]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[movie]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[movieSchedule]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[movieType]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[originPrice]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[play]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[position]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[positionType]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[priceTemplet]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[schedule]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  Table [dbo].[ticket]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  View [dbo].[vw_hall_layout]    Script Date: 12/22/2016 9:03:53 AM ******/
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
/****** Object:  View [dbo].[vw_play]    Script Date: 12/22/2016 9:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_play]
as
select 
h.name as hallName
,h.id as hallId
,p.[date]
,p.beginTime
,ms.id as movieScheduleId
,s.name as scheduleName
,ms.movieId
,m.name as movewName

from play as p
inner join hall as h on p.hallId=h.id
inner join movieSchedule as ms on p.movieScheduleId=ms.id
inner join movie as m on ms.movieId=m.id
inner join schedule as s  on ms.scheduleId=s.id

GO
/****** Object:  View [dbo].[vw_position]    Script Date: 12/22/2016 9:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_position]
as
select p.id as positionId
,p.rowNum
,p.colNum
,p.positionTypeId
,pt.name as positionTypeName
,p.layoutId
,l.style as layoutStyle
from position as p
inner join layout as l on p.layoutId=l.id
inner join positionType pt on p.positionTypeId=pt.id

GO
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
