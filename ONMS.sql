USE [master]
GO
/****** Object:  Database [ONMS]    Script Date: 28-Apr-14 11:41:11 PM ******/
CREATE DATABASE [ONMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ONMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ONMS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ONMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ONMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ONMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ONMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ONMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ONMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ONMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ONMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ONMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ONMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ONMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ONMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ONMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ONMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ONMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ONMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ONMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ONMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ONMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ONMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ONMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ONMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ONMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ONMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ONMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ONMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ONMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ONMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ONMS] SET  MULTI_USER 
GO
ALTER DATABASE [ONMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ONMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ONMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ONMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ONMS]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article_3]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article_3](
	[Code] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Date] [varchar](50) NULL,
	[Headline] [varchar](50) NOT NULL,
	[AuthorID] [varchar](50) NOT NULL,
	[WriteUp] [varchar](1000) NOT NULL,
	[EditorComment] [varchar](50) NULL,
	[Status] [varchar](50) NOT NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK_Article_3] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommentTable]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommentTable](
	[ArticleID] [varchar](50) NOT NULL,
	[ReaderID] [varchar](50) NOT NULL,
	[CommentText] [varchar](200) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[Username] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Age] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Designation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reader]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reader](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 28-Apr-14 11:41:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Article_3] ([Code], [Type], [Location], [Date], [Headline], [AuthorID], [WriteUp], [EditorComment], [Status], [Views]) VALUES (N'a', N'India', N'New Delhi', N'31-Mar-14', N'Modi Wave In India', N'barkha', N'What explains the making of Narendra Modi as a prime ministerial candidate in a relatively short span of time? Modi was appointed chief minister of Gujarat on October 7, 2001 by the national-level BJP leadership when criticism of the state government''s handling of the 2001 earthquake demanded a leadership change. At that time, Modi had been an organizational man without much political experience. The rise of Modi is not just the fascinating story of one man, but also the story of a party that believed in cadres and principles but has found it difficult to resist the rise of Modi''s personality cult. 

All in all, the so-called Modi wave has been consciously crafted since 2003. It includes a focus on development, undercutting of competitors, a conscious southern strategy, a strong social media presence and harnessing of the state machinery to build his persona . In the process, the BJP as a party has been reduced to a secondary position. 
', NULL, N'Approve', 46)
INSERT [dbo].[Article_3] ([Code], [Type], [Location], [Date], [Headline], [AuthorID], [WriteUp], [EditorComment], [Status], [Views]) VALUES (N'b', N'Business', N'New York', N'01-Apr-14', N'Positivity over Indian Market', N'barkha', N'Indian Markets seem to be getting a huge flux of foreign direct investment in the coming weeks as Wall Street big-shots remain positive towards Indian Markets due to the ever-strengthning Modi wave in the country''s general elections.', NULL, N'Reject', 0)
INSERT [dbo].[Article_3] ([Code], [Type], [Location], [Date], [Headline], [AuthorID], [WriteUp], [EditorComment], [Status], [Views]) VALUES (N'c', N'World', N'Moscow', N'04-Apr-14', N'Russia in a fix!', N'barkha', N'I will not write this article.', NULL, N'Reject', 0)
INSERT [dbo].[Article_3] ([Code], [Type], [Location], [Date], [Headline], [AuthorID], [WriteUp], [EditorComment], [Status], [Views]) VALUES (N'New', N'Sports', N'Mumbai', N'03-May-14', N'SRK To Sell KKR', N'barkha', N'SRK is set to sell the controlling stake of KKR to former Telecom Minister A. Raju who was convicted in the 2G Spectrum Scam and has been in jail ever since. The IT Department is looking in closely to find links to black money Raju has stowed into offshore accounts.', NULL, N'Approve', 3)
INSERT [dbo].[CommentTable] ([ArticleID], [ReaderID], [CommentText]) VALUES (N'a', N'rawalpindi', N'Modi for PM!')
INSERT [dbo].[CommentTable] ([ArticleID], [ReaderID], [CommentText]) VALUES (N'a', N'rawalpindi', N'Ab ki baar Modi Sarkaar!')
INSERT [dbo].[CommentTable] ([ArticleID], [ReaderID], [CommentText]) VALUES (N'a', N'rajan_gupta', N'asd')
INSERT [dbo].[CommentTable] ([ArticleID], [ReaderID], [CommentText]) VALUES (N'a', N'barkha_dutt', N'Modi is Communal!')
INSERT [dbo].[CommentTable] ([ArticleID], [ReaderID], [CommentText]) VALUES (N'New', N'arnab_goswami', N'Get that money back. It is India''s right!')
INSERT [dbo].[Person] ([Username], [Name], [Age], [Email], [Country], [Designation]) VALUES (N'rajan123456', N'Rajan Gupta', N'20', N'rajan0493@gmail.com', N'India', N'Reader')
INSERT [dbo].[Reader] ([Username], [Password]) VALUES (N'rajan123456', N'Manusux07$')
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
USE [master]
GO
ALTER DATABASE [ONMS] SET  READ_WRITE 
GO
