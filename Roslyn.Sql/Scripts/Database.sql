USE [master]
GO
/****** Object:  Database [jenkins]    Script Date: 3/17/2016 4:02:49 PM ******/
CREATE DATABASE [jenkins]
GO
ALTER DATABASE [jenkins] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jenkins].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jenkins] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jenkins] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jenkins] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jenkins] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jenkins] SET ARITHABORT OFF 
GO
ALTER DATABASE [jenkins] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jenkins] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jenkins] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jenkins] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jenkins] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jenkins] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jenkins] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jenkins] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jenkins] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jenkins] SET  ENABLE_BROKER 
GO
ALTER DATABASE [jenkins] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jenkins] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jenkins] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jenkins] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [jenkins] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jenkins] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [jenkins] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jenkins] SET RECOVERY FULL 
GO
ALTER DATABASE [jenkins] SET  MULTI_USER 
GO
ALTER DATABASE [jenkins] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jenkins] SET DB_CHAINING OFF 
GO
USE [jenkins]
GO
/****** Object:  Table [dbo].[BuildSource]    Script Date: 3/17/2016 4:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[EnlistmentRoot] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [CK_UniqueSource] UNIQUE NONCLUSTERED 
(
	[MachineName] ASC,
	[EnlistmentRoot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TestResultQueries]    Script Date: 3/17/2016 4:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultQueries](
	[Checksum] [varchar](32) NOT NULL,
	[QueryDate] [datetime] NOT NULL,
	[IsHit] [bit] NOT NULL,
	[AssemblyName] [varchar](100) NULL,
	[IsJenkins] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultStore]    Script Date: 3/17/2016 4:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultStore](
	[Checksum] [varchar](32) NOT NULL,
	[OutputStandardLength] [int] NOT NULL,
	[OutputErrorLength] [int] NOT NULL,
	[ContentLength] [nchar](10) NOT NULL,
	[AssemblyName] [varchar](100) NULL,
	[ElapsedSeconds] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Checksum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestRuns]    Script Date: 3/17/2016 4:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestRuns](
	[RunDate] [datetime] NOT NULL,
	[Cache] [nchar](10) NOT NULL,
	[ElapsedSeconds] [int] NOT NULL DEFAULT ((0)),
	[IsJenkins] [bit] NOT NULL,
	[Is32] [bit] NOT NULL,
	[Succeeded] [bit] NOT NULL,
	[AssemblyCount] [int] NOT NULL,
	[CacheCount] [int] NOT NULL,
	[ChunkCount] [int] NOT NULL DEFAULT ((0))
)

GO
USE [master]
GO
ALTER DATABASE [jenkins] SET  READ_WRITE 
GO