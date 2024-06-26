USE [master]
GO
/****** Object:  Database [RH]    Script Date: 6/5/2023 9:52:29 a. m. ******/
CREATE DATABASE [RH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RH] SET ARITHABORT OFF 
GO
ALTER DATABASE [RH] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RH] SET  MULTI_USER 
GO
ALTER DATABASE [RH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RH] SET QUERY_STORE = OFF
GO
USE [RH]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 6/5/2023 9:52:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[N_Departamento] [varchar](40) NOT NULL,
	[Descripcion_departamento] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Apellido] [varchar](15) NOT NULL,
	[Fecha_Nacimiento] [varchar](40) NOT NULL,
	[Sexo] [varchar](10) NOT NULL,
	[Id_departamentos] [int] NOT NULL,
	[Id_Posicion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posiciones]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posiciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[N_Posicion] [varchar](40) NOT NULL,
	[Id_departamentos] [int] NULL,
	[Descripcion_posicion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departamentos] ON 

INSERT [dbo].[Departamentos] ([Id], [N_Departamento], [Descripcion_departamento]) VALUES (6, N'tecnología', N'Es la rama de un negocio encargada de los recursos tecnológicos. Entre sus tareas se encuentra el diseño, desarrollo, administración e implementación de sistemas de información.')
SET IDENTITY_INSERT [dbo].[Departamentos] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Fecha_Nacimiento], [Sexo], [Id_departamentos], [Id_Posicion]) VALUES (1, N'alejandro', N'torre', N'May 23 1994 12:00AM', N'masculino', 1, 1)
INSERT [dbo].[Empleados] ([Id], [Nombre], [Apellido], [Fecha_Nacimiento], [Sexo], [Id_departamentos], [Id_Posicion]) VALUES (4, N'Warner', N'Gomez', N'1998-02-10', N'masculino', 6, 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[posiciones] ON 

INSERT [dbo].[posiciones] ([Id], [N_Posicion], [Id_departamentos], [Descripcion_posicion]) VALUES (1, N'Sub Director', 6, N'Es en el cargado de dirigir el departamento de venta')
INSERT [dbo].[posiciones] ([Id], [N_Posicion], [Id_departamentos], [Descripcion_posicion]) VALUES (5, N'Auxiliar de venta', 1, N'Analisis de venta')
INSERT [dbo].[posiciones] ([Id], [N_Posicion], [Id_departamentos], [Descripcion_posicion]) VALUES (6, N'CEO', 3, N'Director ejecutivo')
SET IDENTITY_INSERT [dbo].[posiciones] OFF
/****** Object:  StoredProcedure [dbo].[sp_Agregar_departamento]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Agregar_departamento]
	@N_Departamento varchar(40) ,
	@Descripcion_departamento text 	 
AS
insert into Departamentos(N_Departamento,Descripcion_departamento)values (@N_Departamento,@Descripcion_departamento)
GO
/****** Object:  StoredProcedure [dbo].[sp_Agregar_Empleado]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Agregar_Empleado]
	@Nombre varchar(15),
	@Apellido varchar(15),
	@Fecha_Nacimiento date,
	@Sexo varchar(10),
	@Id_departamentos int,
	@Id_Posicion int 
	
AS
insert into Empleados(Nombre,Apellido, Fecha_Nacimiento,Sexo,Id_departamentos,Id_Posicion) 
values(@Nombre,@Apellido,@Fecha_Nacimiento,@Sexo,@Id_departamentos,@Id_Posicion)
GO
/****** Object:  StoredProcedure [dbo].[sp_Agregar_Posicion]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Agregar_Posicion]
	@N_Posicion varchar(40),
	@Id_departamentos int,
	@Descripcion_posicion text
	
AS
insert into posiciones(N_Posicion,Id_departamentos, Descripcion_posicion) values (@N_Posicion,@Id_departamentos,@Descripcion_posicion)
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_departamentos]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Delete_departamentos]
@id INT
AS 
DELETE FROM Departamentos WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Empleado]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Delete_Empleado]
@id INT
AS 
DELETE FROM Empleados WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_posiciones]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Delete_posiciones]
@id INT
AS 
DELETE FROM posiciones WHERE Id = @id
GO
/****** Object:  StoredProcedure [dbo].[sp_Read_departamento]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Read_departamento]
AS 
SELECT * FROM Departamentos 
GO
/****** Object:  StoredProcedure [dbo].[sp_Read_Empleado]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Read_Empleado]
AS 
SELECT * FROM Empleados
GO
/****** Object:  StoredProcedure [dbo].[sp_Read_posiciones]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Read_posiciones]
AS 
SELECT * FROM posiciones
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_departamento]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_departamento]
@Id int,
@N_Departamento varchar(40) ,
@Descripcion_departamento text 
AS

update Departamentos set
[N_Departamento]= @N_Departamento,
[Descripcion_departamento]= @Descripcion_departamento
where Id= @Id

GO
/****** Object:  StoredProcedure [dbo].[sp_Update_empleado]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_empleado]
@Id int,
@Nombre varchar(15),
@Apellido varchar(15),
@Fecha_Nacimiento date,
@Sexo varchar(10),
@Id_departamentos int,
@Id_Posicion int 
AS

update Empleados set
[Nombre]= @Nombre,
[Apellido]= @Apellido,
[Fecha_Nacimiento] = @Fecha_Nacimiento,
[Sexo]= @Sexo,
[Id_departamentos]=@Id_departamentos,
[Id_Posicion]= @Id_Posicion
where Id= @Id

GO
/****** Object:  StoredProcedure [dbo].[sp_Update_posiciones]    Script Date: 6/5/2023 9:52:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_posiciones]
@Id int,
@N_Posicion varchar(40) ,
@Id_departamentos int,
@Descripcion_posicion text 
AS

update posiciones set
[N_Posicion]= @N_Posicion,
[Id_departamentos] = @Id_departamentos,
[Descripcion_posicion]= @Descripcion_posicion
where Id= @Id

GO
USE [master]
GO
ALTER DATABASE [RH] SET  READ_WRITE 
GO
