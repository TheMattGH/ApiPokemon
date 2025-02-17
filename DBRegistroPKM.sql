USE [master]
GO
/****** Object:  Database [DBRegistroPKM]    Script Date: 16/7/2024 20:09:17 ******/
CREATE DATABASE [DBRegistroPKM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBRegistroPKM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLMATIAS\MSSQL\DATA\DBRegistroPKM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBRegistroPKM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLMATIAS\MSSQL\DATA\DBRegistroPKM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBRegistroPKM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBRegistroPKM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBRegistroPKM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBRegistroPKM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBRegistroPKM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBRegistroPKM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBRegistroPKM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBRegistroPKM] SET  MULTI_USER 
GO
ALTER DATABASE [DBRegistroPKM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBRegistroPKM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBRegistroPKM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBRegistroPKM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBRegistroPKM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBRegistroPKM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBRegistroPKM] SET QUERY_STORE = OFF
GO
USE [DBRegistroPKM]
GO
/****** Object:  Table [dbo].[TAuditoria]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAuditoria](
	[AUD_Id] [int] IDENTITY(1,1) NOT NULL,
	[AUD_Tabla] [varchar](30) NOT NULL,
	[AUD_FechaCambio] [datetime] NOT NULL,
	[AUD_Accion] [varchar](20) NOT NULL,
	[AUD_Usuario] [varchar](30) NOT NULL,
	[AUD_DescripcionCambio] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[AUD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TCliente]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCliente](
	[CLI_Id] [int] IDENTITY(1,1) NOT NULL,
	[CLI_TipoIdentificacion] [int] NOT NULL,
	[CLI_Identificacion] [varchar](20) NOT NULL,
	[CLI_ApellidoPaterno] [varchar](20) NOT NULL,
	[CLI_ApellidoMaterno] [varchar](20) NULL,
	[CLI_Nombre1] [varchar](20) NOT NULL,
	[CLI_Nombre2] [varchar](20) NULL,
	[CLI_Telefono] [varchar](10) NOT NULL,
	[CLI_Correo] [varchar](50) NOT NULL,
	[CLI_FechaNacimiento] [date] NOT NULL,
	[CLI_Estado] [int] NOT NULL,
 CONSTRAINT [PK_TCliente] PRIMARY KEY CLUSTERED 
(
	[CLI_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEstado]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEstado](
	[EST_Id] [int] IDENTITY(1,1) NOT NULL,
	[EST_Nombre] [varchar](50) NOT NULL,
	[EST_Activo] [int] NOT NULL,
	[EST_Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TEstado] PRIMARY KEY CLUSTERED 
(
	[EST_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TLogin]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TLogin](
	[LOG_Id] [int] IDENTITY(1,1) NOT NULL,
	[LOG_User] [varchar](20) NOT NULL,
	[LOG_Pass] [varchar](40) NOT NULL,
	[LOG_FechaCreacion] [datetime] NOT NULL,
	[LOG_Cliente] [int] NOT NULL,
	[LOG_Estado] [int] NOT NULL,
	[LOG_FechaUltimaActivacion] [datetime] NOT NULL,
	[LOG_Pokemon] [int] NOT NULL,
 CONSTRAINT [PK_TLogin] PRIMARY KEY CLUSTERED 
(
	[LOG_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPokemon]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPokemon](
	[PKM_Id] [int] IDENTITY(1,1) NOT NULL,
	[PKM_NombrePokemon] [varchar](50) NOT NULL,
	[PKM_FechaRegistro] [datetime] NOT NULL,
	[PKM_Estado] [int] NOT NULL,
 CONSTRAINT [PK_TPokemon] PRIMARY KEY CLUSTERED 
(
	[PKM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TAuditoria] ON 

INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (1, N'TLogin', CAST(N'2024-07-13T19:16:56.297' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login Matt')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (2, N'TLogin', CAST(N'2024-07-13T20:38:02.530' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login Prueba')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (3, N'TLogin', CAST(N'2024-07-13T22:45:32.363' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login Rivs')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (4, N'TLogin', CAST(N'2024-07-13T22:54:08.893' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login Rivs')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (5, N'TLogin', CAST(N'2024-07-13T22:54:16.490' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login OOO')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (6, N'TLogin', CAST(N'2024-07-16T19:19:48.957' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login Rivs')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (7, N'TLogin', CAST(N'2024-07-16T19:21:14.190' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login user')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (8, N'TLogin', CAST(N'2024-07-16T20:03:11.647' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login 55')
INSERT [dbo].[TAuditoria] ([AUD_Id], [AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio]) VALUES (9, N'TLogin', CAST(N'2024-07-16T20:05:00.813' AS DateTime), N'Insert', N'dbo', N'Registro de nuevo Login user')
SET IDENTITY_INSERT [dbo].[TAuditoria] OFF
GO
SET IDENTITY_INSERT [dbo].[TCliente] ON 

INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (1, 1, N'0751001942', N'Echeverria', NULL, N'Matias', NULL, N'0983399927', N'@gmailcom', CAST(N'2003-09-16' AS Date), 3)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (2, 1, N'0105222214', N'Macas', N'Iturralde', N'Veronica', N'Alexandra', N'0985544667', N'vamacas@gmail.com', CAST(N'2001-05-05' AS Date), 3)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (3, 1, N'0751001942', N'Rivas', N'Loyola', N'Miguel', N'Andres', N'0983399927', N'@gmailcom', CAST(N'2001-09-16' AS Date), 3)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (4, 1, N'0105222214', N'Palacios', N'Astudillo', N'Mateo', N'Pablo', N'0985544667', N'maeto@gmail.com', CAST(N'2001-05-05' AS Date), 4)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (5, 1, N'0105222214', N'Palacios', N'Astudillo', N'Mateo', N'Pablo', N'0985544667', N'maeto@gmail.com', CAST(N'2001-05-05' AS Date), 4)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (6, 1, N'0751001942', N'Chicaiza', NULL, N'David', NULL, N'0983399927', N'@gmailcom', CAST(N'2001-09-16' AS Date), 1)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (7, 1, N'0105222214', N'Palacios', N'Astudillo', N'Mateo', N'Pablo', N'0985544667', N'maeto@gmail.com', CAST(N'2001-05-05' AS Date), 4)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (8, 1, N'0105222214', N'Palacios', N'Astudillo', N'Mateo', N'Pablo', N'0985544667', N'maeto@gmail.com', CAST(N'2001-05-05' AS Date), 4)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (9, 2, N'0751001942001', N'Lapo', NULL, N'Josue', N'Lapo', N'0983399927', N'@gmailcom', CAST(N'2005-12-12' AS Date), 1)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (10, 3, N'3333', N'Lapo', NULL, N'Josue', NULL, N'0983399927', N'@gmailcom', CAST(N'2005-12-12' AS Date), 1)
INSERT [dbo].[TCliente] ([CLI_Id], [CLI_TipoIdentificacion], [CLI_Identificacion], [CLI_ApellidoPaterno], [CLI_ApellidoMaterno], [CLI_Nombre1], [CLI_Nombre2], [CLI_Telefono], [CLI_Correo], [CLI_FechaNacimiento], [CLI_Estado]) VALUES (11, 1, N'0105222214', N'a', N'a', N'a', N'a', N'0985544667', N'maeto@gmail.com', CAST(N'2001-05-05' AS Date), 3)
SET IDENTITY_INSERT [dbo].[TCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[TEstado] ON 

INSERT [dbo].[TEstado] ([EST_Id], [EST_Nombre], [EST_Activo], [EST_Descripcion]) VALUES (1, N'Habilitado', 1, N'Estado Habilitado')
INSERT [dbo].[TEstado] ([EST_Id], [EST_Nombre], [EST_Activo], [EST_Descripcion]) VALUES (2, N'Deshabilitado', 2, N'Estado Deshabilitado')
INSERT [dbo].[TEstado] ([EST_Id], [EST_Nombre], [EST_Activo], [EST_Descripcion]) VALUES (3, N'Eliminado', 3, N'Estado Eliminado')
INSERT [dbo].[TEstado] ([EST_Id], [EST_Nombre], [EST_Activo], [EST_Descripcion]) VALUES (4, N'Sin Login', 4, N'Estado Sin Login')
SET IDENTITY_INSERT [dbo].[TEstado] OFF
GO
SET IDENTITY_INSERT [dbo].[TLogin] ON 

INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (1, N'Matt', N'pass', CAST(N'2024-07-13T19:16:56.290' AS DateTime), 1, 2, CAST(N'2024-07-13T19:16:56.290' AS DateTime), 69)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (2, N'Prueba', N'123', CAST(N'2024-07-13T20:38:02.517' AS DateTime), 1, 1, CAST(N'2024-07-13T22:57:15.250' AS DateTime), 63)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (3, N'Rivs', N'pass', CAST(N'2024-07-13T22:45:32.360' AS DateTime), 3, 2, CAST(N'2024-07-13T22:57:42.200' AS DateTime), 73)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (4, N'Rivs', N'pass', CAST(N'2024-07-13T22:54:08.887' AS DateTime), 6, 2, CAST(N'2024-07-13T22:54:08.887' AS DateTime), 81)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (5, N'OOO', N'1234', CAST(N'2024-07-13T22:54:16.490' AS DateTime), 6, 2, CAST(N'2024-07-13T22:54:16.490' AS DateTime), 93)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (6, N'Rivs', N'passsss', CAST(N'2024-07-16T19:19:48.767' AS DateTime), 9, 2, CAST(N'2024-07-16T19:19:48.767' AS DateTime), 196)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (7, N'user', N'1234', CAST(N'2024-07-16T19:21:14.043' AS DateTime), 9, 2, CAST(N'2024-07-16T19:21:14.043' AS DateTime), 187)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (8, N'55', N'555', CAST(N'2024-07-16T20:03:11.633' AS DateTime), 10, 2, CAST(N'2024-07-16T20:03:11.633' AS DateTime), 176)
INSERT [dbo].[TLogin] ([LOG_Id], [LOG_User], [LOG_Pass], [LOG_FechaCreacion], [LOG_Cliente], [LOG_Estado], [LOG_FechaUltimaActivacion], [LOG_Pokemon]) VALUES (9, N'user', N'1234', CAST(N'2024-07-16T20:05:00.803' AS DateTime), 10, 1, CAST(N'2024-07-16T20:05:34.490' AS DateTime), 165)
SET IDENTITY_INSERT [dbo].[TLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[TPokemon] ON 

INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (1, N'spearow', CAST(N'2024-07-13T17:20:03.557' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (2, N'fearow', CAST(N'2024-07-13T17:20:03.627' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (3, N'ekans', CAST(N'2024-07-13T17:20:03.633' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (4, N'arbok', CAST(N'2024-07-13T17:20:03.637' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (5, N'pikachu', CAST(N'2024-07-13T17:20:03.640' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (6, N'raichu', CAST(N'2024-07-13T17:20:03.643' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (7, N'sandshrew', CAST(N'2024-07-13T17:20:03.647' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (8, N'sandslash', CAST(N'2024-07-13T17:20:03.650' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (9, N'nidoran-f', CAST(N'2024-07-13T17:20:03.653' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (10, N'nidorina', CAST(N'2024-07-13T17:20:03.657' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (11, N'nidoqueen', CAST(N'2024-07-13T17:20:03.660' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (12, N'nidoran-m', CAST(N'2024-07-13T17:20:03.667' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (13, N'nidorino', CAST(N'2024-07-13T17:20:03.670' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (14, N'nidoking', CAST(N'2024-07-13T17:20:03.673' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (15, N'clefairy', CAST(N'2024-07-13T17:20:03.677' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (16, N'clefable', CAST(N'2024-07-13T17:20:03.683' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (17, N'vulpix', CAST(N'2024-07-13T17:20:03.687' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (18, N'ninetales', CAST(N'2024-07-13T17:20:03.687' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (19, N'jigglypuff', CAST(N'2024-07-13T17:20:03.693' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (20, N'wigglytuff', CAST(N'2024-07-13T17:20:03.700' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (21, N'zubat', CAST(N'2024-07-13T17:20:03.703' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (22, N'golbat', CAST(N'2024-07-13T17:20:03.707' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (23, N'oddish', CAST(N'2024-07-13T17:20:03.713' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (24, N'gloom', CAST(N'2024-07-13T17:20:03.717' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (25, N'vileplume', CAST(N'2024-07-13T17:20:03.720' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (26, N'paras', CAST(N'2024-07-13T17:20:03.723' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (27, N'parasect', CAST(N'2024-07-13T17:20:03.730' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (28, N'venonat', CAST(N'2024-07-13T17:20:03.733' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (29, N'venomoth', CAST(N'2024-07-13T17:20:03.737' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (30, N'diglett', CAST(N'2024-07-13T17:20:03.740' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (31, N'dugtrio', CAST(N'2024-07-13T17:20:03.743' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (32, N'meowth', CAST(N'2024-07-13T17:20:03.747' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (33, N'persian', CAST(N'2024-07-13T17:20:03.750' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (34, N'psyduck', CAST(N'2024-07-13T17:20:03.753' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (35, N'golduck', CAST(N'2024-07-13T17:20:03.757' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (36, N'mankey', CAST(N'2024-07-13T17:20:03.763' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (37, N'primeape', CAST(N'2024-07-13T17:20:03.767' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (38, N'growlithe', CAST(N'2024-07-13T17:20:03.770' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (39, N'arcanine', CAST(N'2024-07-13T17:20:03.773' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (40, N'poliwag', CAST(N'2024-07-13T17:20:03.780' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (41, N'spearow', CAST(N'2024-07-13T18:16:29.553' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (42, N'fearow', CAST(N'2024-07-13T18:16:29.590' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (43, N'ekans', CAST(N'2024-07-13T18:16:29.600' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (44, N'arbok', CAST(N'2024-07-13T18:16:29.607' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (45, N'pikachu', CAST(N'2024-07-13T18:16:29.613' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (46, N'raichu', CAST(N'2024-07-13T18:16:29.620' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (47, N'sandshrew', CAST(N'2024-07-13T18:16:29.630' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (48, N'sandslash', CAST(N'2024-07-13T18:16:29.637' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (49, N'nidoran-f', CAST(N'2024-07-13T18:16:29.647' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (50, N'nidorina', CAST(N'2024-07-13T18:16:29.653' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (51, N'nidoqueen', CAST(N'2024-07-13T18:16:29.660' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (52, N'nidoran-m', CAST(N'2024-07-13T18:16:29.667' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (53, N'nidorino', CAST(N'2024-07-13T18:16:29.673' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (54, N'nidoking', CAST(N'2024-07-13T18:16:29.680' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (55, N'clefairy', CAST(N'2024-07-13T18:16:29.687' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (56, N'clefable', CAST(N'2024-07-13T18:16:29.693' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (57, N'vulpix', CAST(N'2024-07-13T18:16:29.703' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (58, N'ninetales', CAST(N'2024-07-13T18:16:29.710' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (59, N'jigglypuff', CAST(N'2024-07-13T18:16:29.717' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (60, N'wigglytuff', CAST(N'2024-07-13T18:16:29.723' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (61, N'zubat', CAST(N'2024-07-13T18:16:29.733' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (62, N'golbat', CAST(N'2024-07-13T18:16:29.737' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (63, N'oddish', CAST(N'2024-07-13T18:16:29.747' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (64, N'gloom', CAST(N'2024-07-13T18:16:29.753' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (65, N'vileplume', CAST(N'2024-07-13T18:16:29.763' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (66, N'paras', CAST(N'2024-07-13T18:16:29.770' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (67, N'parasect', CAST(N'2024-07-13T18:16:29.777' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (68, N'venonat', CAST(N'2024-07-13T18:16:29.780' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (69, N'venomoth', CAST(N'2024-07-13T18:16:29.787' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (70, N'diglett', CAST(N'2024-07-13T18:16:29.793' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (71, N'dugtrio', CAST(N'2024-07-13T18:16:29.800' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (72, N'meowth', CAST(N'2024-07-13T18:16:29.807' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (73, N'persian', CAST(N'2024-07-13T18:16:29.817' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (74, N'psyduck', CAST(N'2024-07-13T18:16:29.820' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (75, N'golduck', CAST(N'2024-07-13T18:16:29.827' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (76, N'mankey', CAST(N'2024-07-13T18:16:29.833' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (77, N'primeape', CAST(N'2024-07-13T18:16:29.840' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (78, N'growlithe', CAST(N'2024-07-13T18:16:29.847' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (79, N'arcanine', CAST(N'2024-07-13T18:16:29.853' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (80, N'poliwag', CAST(N'2024-07-13T18:16:29.857' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (81, N'spearow', CAST(N'2024-07-13T22:50:51.797' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (82, N'fearow', CAST(N'2024-07-13T22:50:51.803' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (83, N'ekans', CAST(N'2024-07-13T22:50:51.807' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (84, N'arbok', CAST(N'2024-07-13T22:50:51.810' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (85, N'pikachu', CAST(N'2024-07-13T22:50:51.813' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (86, N'raichu', CAST(N'2024-07-13T22:50:51.817' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (87, N'sandshrew', CAST(N'2024-07-13T22:50:51.817' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (88, N'sandslash', CAST(N'2024-07-13T22:50:51.820' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (89, N'nidoran-f', CAST(N'2024-07-13T22:50:51.823' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (90, N'nidorina', CAST(N'2024-07-13T22:50:51.827' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (91, N'nidoqueen', CAST(N'2024-07-13T22:50:51.830' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (92, N'nidoran-m', CAST(N'2024-07-13T22:50:51.833' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (93, N'nidorino', CAST(N'2024-07-13T22:50:51.837' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (94, N'nidoking', CAST(N'2024-07-13T22:50:51.840' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (95, N'clefairy', CAST(N'2024-07-13T22:50:51.843' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (96, N'clefable', CAST(N'2024-07-13T22:50:51.847' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (97, N'vulpix', CAST(N'2024-07-13T22:50:51.850' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (98, N'ninetales', CAST(N'2024-07-13T22:50:51.853' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (99, N'jigglypuff', CAST(N'2024-07-13T22:50:51.857' AS DateTime), 3)
GO
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (100, N'wigglytuff', CAST(N'2024-07-13T22:50:51.860' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (101, N'zubat', CAST(N'2024-07-13T22:50:51.863' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (102, N'golbat', CAST(N'2024-07-13T22:50:51.867' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (103, N'oddish', CAST(N'2024-07-13T22:50:51.870' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (104, N'gloom', CAST(N'2024-07-13T22:50:51.873' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (105, N'vileplume', CAST(N'2024-07-13T22:50:51.877' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (106, N'paras', CAST(N'2024-07-13T22:50:51.880' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (107, N'parasect', CAST(N'2024-07-13T22:50:51.883' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (108, N'venonat', CAST(N'2024-07-13T22:50:51.883' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (109, N'venomoth', CAST(N'2024-07-13T22:50:51.887' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (110, N'diglett', CAST(N'2024-07-13T22:50:51.890' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (111, N'dugtrio', CAST(N'2024-07-13T22:50:51.897' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (112, N'meowth', CAST(N'2024-07-13T22:50:51.900' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (113, N'persian', CAST(N'2024-07-13T22:50:51.907' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (114, N'psyduck', CAST(N'2024-07-13T22:50:51.907' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (115, N'golduck', CAST(N'2024-07-13T22:50:51.913' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (116, N'mankey', CAST(N'2024-07-13T22:50:51.913' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (117, N'primeape', CAST(N'2024-07-13T22:50:51.917' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (118, N'growlithe', CAST(N'2024-07-13T22:50:51.920' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (119, N'arcanine', CAST(N'2024-07-13T22:50:51.923' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (120, N'poliwag', CAST(N'2024-07-13T22:50:51.927' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (121, N'spearow', CAST(N'2024-07-16T19:06:49.357' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (122, N'fearow', CAST(N'2024-07-16T19:06:49.433' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (123, N'ekans', CAST(N'2024-07-16T19:06:49.443' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (124, N'arbok', CAST(N'2024-07-16T19:06:49.453' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (125, N'pikachu', CAST(N'2024-07-16T19:06:49.463' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (126, N'raichu', CAST(N'2024-07-16T19:06:49.470' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (127, N'sandshrew', CAST(N'2024-07-16T19:06:49.480' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (128, N'sandslash', CAST(N'2024-07-16T19:06:49.487' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (129, N'nidoran-f', CAST(N'2024-07-16T19:06:49.493' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (130, N'nidorina', CAST(N'2024-07-16T19:06:49.500' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (131, N'nidoqueen', CAST(N'2024-07-16T19:06:49.507' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (132, N'nidoran-m', CAST(N'2024-07-16T19:06:49.513' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (133, N'nidorino', CAST(N'2024-07-16T19:06:49.520' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (134, N'nidoking', CAST(N'2024-07-16T19:06:49.527' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (135, N'clefairy', CAST(N'2024-07-16T19:06:49.533' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (136, N'clefable', CAST(N'2024-07-16T19:06:49.540' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (137, N'vulpix', CAST(N'2024-07-16T19:06:49.547' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (138, N'ninetales', CAST(N'2024-07-16T19:06:49.557' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (139, N'jigglypuff', CAST(N'2024-07-16T19:06:49.563' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (140, N'wigglytuff', CAST(N'2024-07-16T19:06:49.570' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (141, N'zubat', CAST(N'2024-07-16T19:06:49.577' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (142, N'golbat', CAST(N'2024-07-16T19:06:49.583' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (143, N'oddish', CAST(N'2024-07-16T19:06:49.590' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (144, N'gloom', CAST(N'2024-07-16T19:06:49.597' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (145, N'vileplume', CAST(N'2024-07-16T19:06:49.603' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (146, N'paras', CAST(N'2024-07-16T19:06:49.613' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (147, N'parasect', CAST(N'2024-07-16T19:06:49.620' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (148, N'venonat', CAST(N'2024-07-16T19:06:49.627' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (149, N'venomoth', CAST(N'2024-07-16T19:06:49.633' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (150, N'diglett', CAST(N'2024-07-16T19:06:49.640' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (151, N'dugtrio', CAST(N'2024-07-16T19:06:49.647' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (152, N'meowth', CAST(N'2024-07-16T19:06:49.657' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (153, N'persian', CAST(N'2024-07-16T19:06:49.663' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (154, N'psyduck', CAST(N'2024-07-16T19:06:49.670' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (155, N'golduck', CAST(N'2024-07-16T19:06:49.677' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (156, N'mankey', CAST(N'2024-07-16T19:06:49.687' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (157, N'primeape', CAST(N'2024-07-16T19:06:49.693' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (158, N'growlithe', CAST(N'2024-07-16T19:06:49.700' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (159, N'arcanine', CAST(N'2024-07-16T19:06:49.707' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (160, N'poliwag', CAST(N'2024-07-16T19:06:49.713' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (161, N'spearow', CAST(N'2024-07-16T19:19:45.167' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (162, N'fearow', CAST(N'2024-07-16T19:19:45.180' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (163, N'ekans', CAST(N'2024-07-16T19:19:45.187' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (164, N'arbok', CAST(N'2024-07-16T19:19:45.190' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (165, N'pikachu', CAST(N'2024-07-16T19:19:45.197' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (166, N'raichu', CAST(N'2024-07-16T19:19:45.207' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (167, N'sandshrew', CAST(N'2024-07-16T19:19:45.210' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (168, N'sandslash', CAST(N'2024-07-16T19:19:45.220' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (169, N'nidoran-f', CAST(N'2024-07-16T19:19:45.227' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (170, N'nidorina', CAST(N'2024-07-16T19:19:45.230' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (171, N'nidoqueen', CAST(N'2024-07-16T19:19:45.237' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (172, N'nidoran-m', CAST(N'2024-07-16T19:19:45.243' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (173, N'nidorino', CAST(N'2024-07-16T19:19:45.250' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (174, N'nidoking', CAST(N'2024-07-16T19:19:45.253' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (175, N'clefairy', CAST(N'2024-07-16T19:19:45.260' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (176, N'clefable', CAST(N'2024-07-16T19:19:45.267' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (177, N'vulpix', CAST(N'2024-07-16T19:19:45.273' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (178, N'ninetales', CAST(N'2024-07-16T19:19:45.280' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (179, N'jigglypuff', CAST(N'2024-07-16T19:19:45.287' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (180, N'wigglytuff', CAST(N'2024-07-16T19:19:45.293' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (181, N'zubat', CAST(N'2024-07-16T19:19:45.297' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (182, N'golbat', CAST(N'2024-07-16T19:19:45.303' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (183, N'oddish', CAST(N'2024-07-16T19:19:45.310' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (184, N'gloom', CAST(N'2024-07-16T19:19:45.317' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (185, N'vileplume', CAST(N'2024-07-16T19:19:45.320' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (186, N'paras', CAST(N'2024-07-16T19:19:45.327' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (187, N'parasect', CAST(N'2024-07-16T19:19:45.333' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (188, N'venonat', CAST(N'2024-07-16T19:19:45.337' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (189, N'venomoth', CAST(N'2024-07-16T19:19:45.343' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (190, N'diglett', CAST(N'2024-07-16T19:19:45.350' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (191, N'dugtrio', CAST(N'2024-07-16T19:19:45.353' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (192, N'meowth', CAST(N'2024-07-16T19:19:45.360' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (193, N'persian', CAST(N'2024-07-16T19:19:45.367' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (194, N'psyduck', CAST(N'2024-07-16T19:19:45.370' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (195, N'golduck', CAST(N'2024-07-16T19:19:45.377' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (196, N'mankey', CAST(N'2024-07-16T19:19:45.380' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (197, N'primeape', CAST(N'2024-07-16T19:19:45.387' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (198, N'growlithe', CAST(N'2024-07-16T19:19:45.393' AS DateTime), 3)
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (199, N'arcanine', CAST(N'2024-07-16T19:19:45.400' AS DateTime), 3)
GO
INSERT [dbo].[TPokemon] ([PKM_Id], [PKM_NombrePokemon], [PKM_FechaRegistro], [PKM_Estado]) VALUES (200, N'poliwag', CAST(N'2024-07-16T19:19:45.407' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[TPokemon] OFF
GO
ALTER TABLE [dbo].[TLogin]  WITH CHECK ADD  CONSTRAINT [FK_TLogin_TCliente] FOREIGN KEY([LOG_Cliente])
REFERENCES [dbo].[TCliente] ([CLI_Id])
GO
ALTER TABLE [dbo].[TLogin] CHECK CONSTRAINT [FK_TLogin_TCliente]
GO
ALTER TABLE [dbo].[TLogin]  WITH CHECK ADD  CONSTRAINT [FK_TLogin_TPokemon] FOREIGN KEY([LOG_Pokemon])
REFERENCES [dbo].[TPokemon] ([PKM_Id])
GO
ALTER TABLE [dbo].[TLogin] CHECK CONSTRAINT [FK_TLogin_TPokemon]
GO
/****** Object:  StoredProcedure [dbo].[SP_CambioEstadoLogin]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Matias Echeverria
-- Create date: 2024/07/13
-- Description:	SP que permita habilitar y deshabilitar un login
-- =============================================
CREATE PROCEDURE [dbo].[SP_CambioEstadoLogin] 
    @LOG_Id INT,
    @LOG_Estado INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica si el estado es 1 (habilitado) o 2 (deshabilitado) y actualiza el estado del login.
    IF @LOG_Estado = 1 OR @LOG_Estado = 2
    BEGIN
        UPDATE [dbo].[TLogin]
        SET LOG_Estado = @LOG_Estado
        WHERE LOG_Id = @LOG_Id;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarCliente]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Matias Echeverria
-- Create date: 2024/07/13
-- Description:	SP que permite eliminar un cliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_EliminarCliente] 
    @CLI_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[TCliente]
    SET CLI_Estado = 3
    WHERE CLI_Id = @CLI_Id;
END
GO
/****** Object:  Trigger [dbo].[trgCambioFechaUltimaActivacion]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Matias Echeverria
-- Create date: 2024/07/13
-- Description:	Trigger que permite cambiar la fecha de ultima activacion cuando de habilite o deshabilite
-- =============================================
CREATE TRIGGER [dbo].[trgCambioFechaUltimaActivacion]
   ON [dbo].[TLogin]
   AFTER UPDATE
AS 
BEGIN
    SET NOCOUNT ON;

    -- Verificar si LOG_Estado ha sido modificado a 1 (habilitado) o 2 (deshabilitado).

    IF UPDATE(LOG_Estado)
    BEGIN
        -- Actualizar LOG_FechaUltimaActivacion a la fecha y hora actual si el estado cambio a habilitado o deshabilitado.

        UPDATE TLogin
        SET LOG_FechaUltimaActivacion = GETDATE()
        FROM Inserted i
        WHERE TLogin.LOG_Id = i.LOG_Id AND (i.LOG_Estado = 1 OR i.LOG_Estado = 2);
    END
END
GO
ALTER TABLE [dbo].[TLogin] ENABLE TRIGGER [trgCambioFechaUltimaActivacion]
GO
/****** Object:  Trigger [dbo].[trgLoginRegistrado]    Script Date: 16/7/2024 20:09:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Matias Echeverria
-- Create date: 2024/07/13
-- Description:	Trigger que permite realizar la auditoria de los logins registrados 
-- =============================================
CREATE TRIGGER [dbo].[trgLoginRegistrado] 
   ON  [DBRegistroPKM].[dbo].[TLogin]
   AFTER INSERT
AS 
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DBRegistroPKM.dbo.TAuditoria ([AUD_Tabla], [AUD_FechaCambio], [AUD_Accion], [AUD_Usuario], [AUD_DescripcionCambio])
    VALUES ('TLogin', GETDATE(), 'Insert', CURRENT_USER, 'Registro de nuevo Login ' + (SELECT LOG_User from inserted));
END
GO
ALTER TABLE [dbo].[TLogin] ENABLE TRIGGER [trgLoginRegistrado]
GO
USE [master]
GO
ALTER DATABASE [DBRegistroPKM] SET  READ_WRITE 
GO
