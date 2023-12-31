USE [master]
GO
/****** Object:  Database [webAPI1]    Script Date: 11/8/2023 11:24:54 PM ******/
CREATE DATABASE [webAPI1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webAPI1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\webAPI1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webAPI1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\webAPI1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [webAPI1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webAPI1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webAPI1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webAPI1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webAPI1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webAPI1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webAPI1] SET ARITHABORT OFF 
GO
ALTER DATABASE [webAPI1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webAPI1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webAPI1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webAPI1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webAPI1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webAPI1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webAPI1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webAPI1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webAPI1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webAPI1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [webAPI1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webAPI1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webAPI1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webAPI1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webAPI1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webAPI1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [webAPI1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webAPI1] SET RECOVERY FULL 
GO
ALTER DATABASE [webAPI1] SET  MULTI_USER 
GO
ALTER DATABASE [webAPI1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webAPI1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webAPI1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webAPI1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webAPI1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webAPI1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'webAPI1', N'ON'
GO
ALTER DATABASE [webAPI1] SET QUERY_STORE = ON
GO
ALTER DATABASE [webAPI1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [webAPI1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/8/2023 11:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 11/8/2023 11:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerSkills]    Script Date: 11/8/2023 11:24:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerSkills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Skill] [nvarchar](max) NULL,
	[Value] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
 CONSTRAINT [PK_PlayerSkills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231108094550_InitialCreate', N'7.0.13')
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (3, N'Player 1', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (4, N'Player 2', N'Midfielder')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (5, N'Player 3', N'Forward')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (6, N'Player 4', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (7, N'Player 5', N'Midfielder')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (8, N'Player 6', N'Forward')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (9, N'Player 7', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (10, N'Player 8', N'Midfielder')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (11, N'Player 9', N'Forward')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (12, N'Player 10', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (13, N'Player 11', N'Midfielder')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (14, N'Player 12', N'Forward')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (15, N'Player 13', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (16, N'Player 14', N'Midfielder')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (17, N'Player 15', N'Forward')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (18, N'Player 16', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (19, N'Player 17', N'Midfielder')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (20, N'Player 18', N'Forward')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (21, N'Player 19', N'Defender')
INSERT [dbo].[Players] ([Id], [Name], [Position]) VALUES (22, N'Player 20', N'Midfielder')
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerSkills] ON 

INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (5, N'Defense', 90, 3)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (6, N'Attack', 59, 3)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (7, N'Speed', 78, 3)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (8, N'Strength', 10, 3)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (9, N'Stamina', 46, 3)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (10, N'Defense', 10, 4)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (11, N'Attack', 51, 4)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (12, N'Speed', 65, 4)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (13, N'Strength', 33, 4)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (14, N'Stamina', 90, 4)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (15, N'Defense', 80, 5)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (16, N'Attack', 30, 5)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (17, N'Speed', 28, 5)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (18, N'Strength', 37, 5)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (19, N'Stamina', 94, 5)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (20, N'Defense', 79, 6)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (21, N'Attack', 82, 6)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (22, N'Speed', 73, 6)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (23, N'Strength', 9, 6)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (24, N'Stamina', 4, 6)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (25, N'Defense', 89, 7)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (26, N'Attack', 13, 7)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (27, N'Speed', 77, 7)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (28, N'Strength', 4, 7)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (29, N'Stamina', 33, 7)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (30, N'Defense', 68, 8)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (31, N'Attack', 34, 8)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (32, N'Speed', 38, 8)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (33, N'Strength', 82, 8)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (34, N'Stamina', 14, 8)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (35, N'Defense', 86, 9)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (36, N'Attack', 36, 9)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (37, N'Speed', 31, 9)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (38, N'Strength', 87, 9)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (39, N'Stamina', 99, 9)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (40, N'Defense', 45, 10)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (41, N'Attack', 71, 10)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (42, N'Speed', 21, 10)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (43, N'Strength', 38, 10)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (44, N'Stamina', 27, 10)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (45, N'Defense', 17, 11)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (46, N'Attack', 32, 11)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (47, N'Speed', 33, 11)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (48, N'Strength', 71, 11)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (49, N'Stamina', 33, 11)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (50, N'Defense', 81, 12)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (51, N'Attack', 30, 12)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (52, N'Speed', 14, 12)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (53, N'Strength', 70, 12)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (54, N'Stamina', 39, 12)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (55, N'Defense', 35, 13)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (56, N'Attack', 88, 13)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (57, N'Speed', 23, 13)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (58, N'Strength', 73, 13)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (59, N'Stamina', 45, 13)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (60, N'Defense', 81, 14)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (61, N'Attack', 32, 14)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (62, N'Speed', 65, 14)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (63, N'Strength', 83, 14)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (64, N'Stamina', 1, 14)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (65, N'Defense', 2, 15)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (66, N'Attack', 17, 15)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (67, N'Speed', 1, 15)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (68, N'Strength', 97, 15)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (69, N'Stamina', 37, 15)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (70, N'Defense', 92, 16)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (71, N'Attack', 62, 16)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (72, N'Speed', 94, 16)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (73, N'Strength', 21, 16)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (74, N'Stamina', 30, 16)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (75, N'Defense', 70, 17)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (76, N'Attack', 95, 17)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (77, N'Speed', 27, 17)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (78, N'Strength', 43, 17)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (79, N'Stamina', 23, 17)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (80, N'Defense', 48, 18)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (81, N'Attack', 62, 18)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (82, N'Speed', 11, 18)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (83, N'Strength', 39, 18)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (84, N'Stamina', 15, 18)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (85, N'Defense', 18, 19)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (86, N'Attack', 14, 19)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (87, N'Speed', 35, 19)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (88, N'Strength', 87, 19)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (89, N'Stamina', 2, 19)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (90, N'Defense', 45, 20)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (91, N'Attack', 72, 20)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (92, N'Speed', 0, 20)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (93, N'Strength', 64, 20)
INSERT [dbo].[PlayerSkills] ([Id], [Skill], [Value], [PlayerId]) VALUES (94, N'Stamina', 15, 20)
SET IDENTITY_INSERT [dbo].[PlayerSkills] OFF
GO
/****** Object:  Index [IX_PlayerSkills_PlayerId]    Script Date: 11/8/2023 11:24:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_PlayerSkills_PlayerId] ON [dbo].[PlayerSkills]
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlayerSkills]  WITH CHECK ADD  CONSTRAINT [FK_PlayerSkills_Players_PlayerId] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Players] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerSkills] CHECK CONSTRAINT [FK_PlayerSkills_Players_PlayerId]
GO
USE [master]
GO
ALTER DATABASE [webAPI1] SET  READ_WRITE 
GO
