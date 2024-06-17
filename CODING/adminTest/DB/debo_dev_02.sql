USE [master]
GO
/****** Object:  Database [debo_dev_02]    Script Date: 6/17/2024 12:26:27 PM ******/
CREATE DATABASE [debo_dev_02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'debo_dev_02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\debo_dev_02.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'debo_dev_02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\debo_dev_02_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [debo_dev_02] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [debo_dev_02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [debo_dev_02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [debo_dev_02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [debo_dev_02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [debo_dev_02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [debo_dev_02] SET ARITHABORT OFF 
GO
ALTER DATABASE [debo_dev_02] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [debo_dev_02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [debo_dev_02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [debo_dev_02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [debo_dev_02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [debo_dev_02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [debo_dev_02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [debo_dev_02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [debo_dev_02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [debo_dev_02] SET  ENABLE_BROKER 
GO
ALTER DATABASE [debo_dev_02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [debo_dev_02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [debo_dev_02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [debo_dev_02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [debo_dev_02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [debo_dev_02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [debo_dev_02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [debo_dev_02] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [debo_dev_02] SET  MULTI_USER 
GO
ALTER DATABASE [debo_dev_02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [debo_dev_02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [debo_dev_02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [debo_dev_02] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [debo_dev_02] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [debo_dev_02] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [debo_dev_02] SET QUERY_STORE = ON
GO
ALTER DATABASE [debo_dev_02] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [debo_dev_02]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2024 12:26:27 PM ******/
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
/****** Object:  Table [dbo].[Appointment]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID] [uniqueidentifier] NOT NULL,
	[Treat_ID] [int] NULL,
	[Payment_ID] [uniqueidentifier] NULL,
	[Dent_ID] [uniqueidentifier] NULL,
	[Temp_Dent_ID] [uniqueidentifier] NULL,
	[Cus_ID] [uniqueidentifier] NULL,
	[Creator_ID] [uniqueidentifier] NULL,
	[Is_Created_By_Staff] [bit] NULL,
	[Created_Date] [date] NULL,
	[Start_Date] [date] NULL,
	[Time_Slot] [int] NULL,
	[Status] [nvarchar](20) NULL,
	[Description] [nvarchar](2000) NULL,
	[Note] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic_Branch]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic_Branch](
	[ID] [int] NOT NULL,
	[Mng_ID] [uniqueidentifier] NULL,
	[Admin_ID] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Avt] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic_Treatment]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic_Treatment](
	[ID] [int] NOT NULL,
	[Category] [int] NULL,
	[Admin_ID] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dentist_Major]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dentist_Major](
	[Dent_ID] [uniqueidentifier] NOT NULL,
	[Treat_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dent_ID] ASC,
	[Treat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [uniqueidentifier] NOT NULL,
	[Br_ID] [int] NULL,
	[Type] [int] NULL,
	[Salary] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] NOT NULL,
	[Cus_ID] [uniqueidentifier] NULL,
	[Treat_ID] [int] NULL,
	[Description] [nvarchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [uniqueidentifier] NOT NULL,
	[Cus_ID] [uniqueidentifier] NULL,
	[Method_ID] [int] NULL,
	[Amount] [float] NULL,
	[Status] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Method]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Method](
	[ID] [int] NOT NULL,
	[Provider_ID] [int] NULL,
	[Public_Key] [nvarchar](256) NULL,
	[Private_Key] [nvarchar](256) NULL,
	[Payment_Info] [nvarchar](256) NULL,
	[Ipn_Listener_Link] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Provider]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Provider](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Desciption] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_ID] [int] NOT NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatment_Category]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment_Category](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/17/2024 12:26:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Role] [int] NULL,
	[Username] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Gender] [bit] NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[Date Of Birthday] [datetime2](7) NULL,
	[Med_Rec] [nvarchar](max) NULL,
	[Avt] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment.Creator_ID] FOREIGN KEY([Creator_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment.Creator_ID]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment.Cus_ID] FOREIGN KEY([Cus_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment.Cus_ID]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment.Dent_ID] FOREIGN KEY([Dent_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment.Dent_ID]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment.Temp_Dent_ID] FOREIGN KEY([Temp_Dent_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment.Temp_Dent_ID]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment.Treat_ID] FOREIGN KEY([Treat_ID])
REFERENCES [dbo].[Clinic_Treatment] ([ID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment.Treat_ID]
GO
ALTER TABLE [dbo].[Clinic_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Clinic Branch.Admin_ID] FOREIGN KEY([Admin_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Clinic_Branch] CHECK CONSTRAINT [FK_Clinic Branch.Admin_ID]
GO
ALTER TABLE [dbo].[Clinic_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Clinic Branch.Mng_ID] FOREIGN KEY([Mng_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Clinic_Branch] CHECK CONSTRAINT [FK_Clinic Branch.Mng_ID]
GO
ALTER TABLE [dbo].[Clinic_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Clinic Treatment.Admin_ID] FOREIGN KEY([Admin_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Clinic_Treatment] CHECK CONSTRAINT [FK_Clinic Treatment.Admin_ID]
GO
ALTER TABLE [dbo].[Clinic_Treatment]  WITH CHECK ADD  CONSTRAINT [FK_Clinic Treatment.Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Treatment_Category] ([ID])
GO
ALTER TABLE [dbo].[Clinic_Treatment] CHECK CONSTRAINT [FK_Clinic Treatment.Category]
GO
ALTER TABLE [dbo].[Dentist_Major]  WITH CHECK ADD  CONSTRAINT [FK_Dentist Major.Dent_ID] FOREIGN KEY([Dent_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Dentist_Major] CHECK CONSTRAINT [FK_Dentist Major.Dent_ID]
GO
ALTER TABLE [dbo].[Dentist_Major]  WITH CHECK ADD  CONSTRAINT [FK_Dentist Major.Treat_ID] FOREIGN KEY([Treat_ID])
REFERENCES [dbo].[Clinic_Treatment] ([ID])
GO
ALTER TABLE [dbo].[Dentist_Major] CHECK CONSTRAINT [FK_Dentist Major.Treat_ID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee.Br_ID] FOREIGN KEY([Br_ID])
REFERENCES [dbo].[Clinic_Branch] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee.Br_ID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee.UserID] FOREIGN KEY([ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee.UserID]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback.Cus_ID] FOREIGN KEY([Cus_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback.Cus_ID]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback.Treat_ID] FOREIGN KEY([Treat_ID])
REFERENCES [dbo].[Clinic_Treatment] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback.Treat_ID]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment.Cus_ID] FOREIGN KEY([Cus_ID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment.Cus_ID]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment.Method_ID] FOREIGN KEY([Method_ID])
REFERENCES [dbo].[Payment_Method] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment.Method_ID]
GO
ALTER TABLE [dbo].[Payment_Method]  WITH CHECK ADD  CONSTRAINT [FK_Payment Method.Provider_ID] FOREIGN KEY([Provider_ID])
REFERENCES [dbo].[Payment_Provider] ([ID])
GO
ALTER TABLE [dbo].[Payment_Method] CHECK CONSTRAINT [FK_Payment Method.Provider_ID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User.Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Role_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User.Role]
GO
USE [master]
GO
ALTER DATABASE [debo_dev_02] SET  READ_WRITE 
GO
