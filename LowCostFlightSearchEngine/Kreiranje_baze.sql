USE [master]
GO
/****** Object:  Database [LowCostFlights]    Script Date: 5.7.2021. 11:46:24 ******/
CREATE DATABASE [LowCostFlights]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LowCostFlights', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LowCostFlights.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LowCostFlights_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LowCostFlights_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LowCostFlights] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LowCostFlights].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LowCostFlights] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LowCostFlights] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LowCostFlights] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LowCostFlights] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LowCostFlights] SET ARITHABORT OFF 
GO
ALTER DATABASE [LowCostFlights] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LowCostFlights] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LowCostFlights] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LowCostFlights] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LowCostFlights] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LowCostFlights] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LowCostFlights] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LowCostFlights] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LowCostFlights] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LowCostFlights] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LowCostFlights] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LowCostFlights] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LowCostFlights] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LowCostFlights] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LowCostFlights] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LowCostFlights] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LowCostFlights] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LowCostFlights] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LowCostFlights] SET  MULTI_USER 
GO
ALTER DATABASE [LowCostFlights] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LowCostFlights] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LowCostFlights] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LowCostFlights] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LowCostFlights] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LowCostFlights] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LowCostFlights] SET QUERY_STORE = OFF
GO
USE [LowCostFlights]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 5.7.2021. 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[IATA] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Airports] PRIMARY KEY CLUSTERED 
(
	[IATA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchHistory]    Script Date: 5.7.2021. 11:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchHistory](
	[DepartureAirport] [nvarchar](5) NOT NULL,
	[ArrivalAirport] [nvarchar](5) NOT NULL,
	[DepartureDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[Currency] [nvarchar](5) NOT NULL,
	[Passengers] [int] NOT NULL,
	[JsonResult] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SearchHistory] PRIMARY KEY CLUSTERED 
(
	[DepartureAirport] ASC,
	[ArrivalAirport] ASC,
	[DepartureDate] ASC,
	[ReturnDate] ASC,
	[Currency] ASC,
	[Passengers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [LowCostFlights] SET  READ_WRITE 
GO