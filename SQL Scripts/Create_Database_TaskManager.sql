USE [master]
GO

/****** Object:  Database [TaskManagerDB]    Script Date: 4/27/2025 2:46:19 PM ******/
CREATE DATABASE [TaskManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskManagerDB', FILENAME = N'C:\Users\d.c.ravikumar\TaskManagerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskManagerDB_log', FILENAME = N'C:\Users\d.c.ravikumar\TaskManagerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TaskManagerDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TaskManagerDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TaskManagerDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TaskManagerDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TaskManagerDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [TaskManagerDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TaskManagerDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TaskManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TaskManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TaskManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TaskManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TaskManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TaskManagerDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TaskManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TaskManagerDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TaskManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TaskManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TaskManagerDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TaskManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TaskManagerDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TaskManagerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TaskManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TaskManagerDB] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [TaskManagerDB] SET  MULTI_USER 
GO

ALTER DATABASE [TaskManagerDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TaskManagerDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TaskManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TaskManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [TaskManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TaskManagerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [TaskManagerDB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [TaskManagerDB] SET  READ_WRITE 
GO


