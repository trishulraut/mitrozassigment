USE [master]
GO
/****** Object:  Database [mitrozassigment]    Script Date: 29-01-2022 02:36:06 ******/
CREATE DATABASE [mitrozassigment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mitrozassigment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mitrozassigment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mitrozassigment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mitrozassigment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mitrozassigment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mitrozassigment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mitrozassigment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mitrozassigment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mitrozassigment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mitrozassigment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mitrozassigment] SET ARITHABORT OFF 
GO
ALTER DATABASE [mitrozassigment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mitrozassigment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mitrozassigment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mitrozassigment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mitrozassigment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mitrozassigment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mitrozassigment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mitrozassigment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mitrozassigment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mitrozassigment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mitrozassigment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mitrozassigment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mitrozassigment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mitrozassigment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mitrozassigment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mitrozassigment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mitrozassigment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mitrozassigment] SET RECOVERY FULL 
GO
ALTER DATABASE [mitrozassigment] SET  MULTI_USER 
GO
ALTER DATABASE [mitrozassigment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mitrozassigment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mitrozassigment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mitrozassigment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mitrozassigment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mitrozassigment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mitrozassigment', N'ON'
GO
ALTER DATABASE [mitrozassigment] SET QUERY_STORE = OFF
GO
USE [mitrozassigment]
GO
/****** Object:  Table [dbo].[TblDeparment]    Script Date: 29-01-2022 02:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDeparment](
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
	[DEPT_NAME] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblDeparment] PRIMARY KEY CLUSTERED 
(
	[DEPT_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmployee]    Script Date: 29-01-2022 02:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmployee](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Mobile_No] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[DeptId] [int] NOT NULL,
 CONSTRAINT [PK_TblEmployee] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblDeparment] ON 

INSERT [dbo].[TblDeparment] ([DeptId], [DEPT_NAME]) VALUES (2, N'ADMINITRATION')
INSERT [dbo].[TblDeparment] ([DeptId], [DEPT_NAME]) VALUES (3, N'FINANCE')
INSERT [dbo].[TblDeparment] ([DeptId], [DEPT_NAME]) VALUES (1, N'HR')
SET IDENTITY_INSERT [dbo].[TblDeparment] OFF
GO
SET IDENTITY_INSERT [dbo].[TblEmployee] ON 

INSERT [dbo].[TblEmployee] ([E_ID], [Name], [Address], [Mobile_No], [Email], [DeptId]) VALUES (1, N'TRISHUL', N'Nagpur', N'8551921023', N'trishulraut314@gmail.com', 2)
INSERT [dbo].[TblEmployee] ([E_ID], [Name], [Address], [Mobile_No], [Email], [DeptId]) VALUES (2, N' Pritee Shankarpale', N'pune', N'9876543310', N' mitroz.pritee@gmail.com', 1)
INSERT [dbo].[TblEmployee] ([E_ID], [Name], [Address], [Mobile_No], [Email], [DeptId]) VALUES (3, N'ketki bhosale', N'pune', N'9876543313', N'ketkibhosale@mitroztech.com', 3)
SET IDENTITY_INSERT [dbo].[TblEmployee] OFF
GO
/****** Object:  StoredProcedure [dbo].[uspgetemployeelist]    Script Date: 29-01-2022 02:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspgetemployeelist]
as begin
select E_ID,NAME,Address,Mobile_No,Email, DEPT_NAME FROM tblemployee inner join TblDeparment on TblEmployee.DeptId=TblDeparment.DeptId
end
GO
USE [master]
GO
ALTER DATABASE [mitrozassigment] SET  READ_WRITE 
GO
