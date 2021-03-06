USE [master]
GO
/****** Object:  Database [LBD]    Script Date: 05/06/2020 04:23:02 p. m. ******/
CREATE DATABASE [LBD] ON  PRIMARY 
( NAME = N'LBD', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL10.MSSQL15\MSSQL\DATA\LBD.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LBD_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL10.MSSQL15\MSSQL\DATA\LBD_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LBD] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [LBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LBD] SET  MULTI_USER 
GO
ALTER DATABASE [LBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LBD] SET DB_CHAINING OFF 
GO
USE [LBD]
GO
/****** Object:  Table [dbo].[AREA_TRABAJO]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AREA_TRABAJO](
	[codigo] [varchar](30) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[Salario] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[codigo_cliente] [varchar](30) NOT NULL,
	[numCompras] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[codigo] [varchar](30) NOT NULL,
	[Cantidad_Productos] [int] NOT NULL,
	[Total] [float] NOT NULL,
	[Fecha] [date] NOT NULL,
	[codigo_cliente] [varchar](30) NULL,
	[codigo_vendedor] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datosClientes]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datosClientes](
	[nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[nameclientlen] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[codigo] [varchar](30) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Email] [varchar](40) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[codigo] [varchar](30) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[precio] [float] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[peso] [float] NOT NULL,
	[codigo_compra] [varchar](30) NULL,
	[codigo_proveedor] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[codigo] [varchar](30) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[dirección] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 05/06/2020 04:23:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[codigo_vendedor] [varchar](30) NOT NULL,
	[codigo_Area_Trabajo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1001', N'Paqueteria', N'Guardado de articulos sin permiso a ingresar', 2200)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1002', N'Seguridad', N'Vigilancia a la tienda', 5300)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1003', N'Cajero', N'Atender las compras', 2400)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1004', N'Limpieza', N'Mantener limpias las instalaciones', 2000)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1006', N'Gerente', N'Encargado de organizar los trabajadores', 3400)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1007', N'Supervisor', N'Encargado de verificar que todo se trabaje correctamente', 3000)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1008', N'Mantenimiento', N'Apoyo para mantener correctas las instalaciones', 2600)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1009', N'Ayudante General', N'Apoyo para diversas actividades en las instalaciones', 2400)
INSERT [dbo].[AREA_TRABAJO] ([codigo], [nombre], [descripcion], [Salario]) VALUES (N'1010', N'Jefe', N'Dueño de la empresa', 7500)
GO
INSERT [dbo].[CLIENTE] ([codigo_cliente], [numCompras]) VALUES (N'1001L', 2)
INSERT [dbo].[CLIENTE] ([codigo_cliente], [numCompras]) VALUES (N'1004D', 6)
INSERT [dbo].[CLIENTE] ([codigo_cliente], [numCompras]) VALUES (N'1006O', 8)
INSERT [dbo].[CLIENTE] ([codigo_cliente], [numCompras]) VALUES (N'1007D', 1)
INSERT [dbo].[CLIENTE] ([codigo_cliente], [numCompras]) VALUES (N'1010M', 10)
GO
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00101', 10, 134.5, CAST(N'2020-05-12' AS Date), N'1004D', N'1002A')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00102', 2, 48, CAST(N'2020-05-18' AS Date), N'1001L', N'1008A')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00103', 5, 94, CAST(N'2020-04-09' AS Date), N'1004D', N'1009J')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00104', 12, 197, CAST(N'2020-01-03' AS Date), N'1007D', N'1008A')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00105', 8, 120.5, CAST(N'2020-03-28' AS Date), N'1010M', N'1002A')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00106', 15, 213, CAST(N'2020-03-16' AS Date), N'1006O', N'1002A')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00107', 7, 102, CAST(N'2020-04-21' AS Date), N'1004D', N'1009J')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00108', 21, 304, CAST(N'2020-02-20' AS Date), N'1007D', N'1002A')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00109', 1, 19.2, CAST(N'2020-01-30' AS Date), N'1001L', N'1009J')
INSERT [dbo].[COMPRA] ([codigo], [Cantidad_Productos], [Total], [Fecha], [codigo_cliente], [codigo_vendedor]) VALUES (N'00110', 9, 134, CAST(N'2020-05-05' AS Date), N'1004D', N'1008A')
GO
INSERT [dbo].[datosClientes] ([nombre], [Apellidos], [direccion], [Email], [nameclientlen]) VALUES (N'Leonardo Gadiel', N'Mendoza Contreras', N'Santa Catarina', N'leo24@hotmail.com', 15)
INSERT [dbo].[datosClientes] ([nombre], [Apellidos], [direccion], [Email], [nameclientlen]) VALUES (N'Diana Laura', N'Hernandez Cañedo', N'Santa Catarina', N'dianana@hotmail.com', 11)
INSERT [dbo].[datosClientes] ([nombre], [Apellidos], [direccion], [Email], [nameclientlen]) VALUES (N'Orlando Javier', N'Medina Melendez', N'Monterrey', N'orlandix@hotmail.com', 14)
INSERT [dbo].[datosClientes] ([nombre], [Apellidos], [direccion], [Email], [nameclientlen]) VALUES (N'Dibanhi Sarai', N'Rodriguez Bravo', N'San Pedro', N'dibaniuu@gmail.com', 13)
INSERT [dbo].[datosClientes] ([nombre], [Apellidos], [direccion], [Email], [nameclientlen]) VALUES (N'Michelle', N'Diaz Gutierrez', N'San Pedro', N'michelli@hotmail.com', 8)
GO
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1001L', N'Leonardo Gadiel', N'Mendoza Contreras', N'leo24@hotmail.com', N'80321181', N'Santa Catarina')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1002A', N'Andres', N'Martinez Reyna', N'andresMR@gmail.com', N'82918283', N'Santa Catarina')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1003E', N'Esteban ', N'Sanchez', N'estabansz@hotmail.com', N'81235614', N'Monterrey')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1004D', N'Diana Laura', N'Hernandez Cañedo', N'dianana@hotmail.com', N'80946327', N'Santa Catarina')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1005A', N'Amanda Guadalupe', N'Villela Trigo', N'amandagdp@gmail.com', N'82716645', N'San Nicolas')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1006O', N'Orlando Javier', N'Medina Melendez', N'orlandix@hotmail.com', N'81332452', N'Monterrey')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1007D', N'Dibanhi Sarai', N'Rodriguez Bravo', N'dibaniuu@gmail.com', N'84240123', N'San Pedro')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1008A', N'Ana Yareth', N'Hernandez Juan', N'anita@gmail.com', N'80942311', N'San Nicolas')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1009J', N'Jesus Javier', N'Mendoza Contreras', N'jesus@hotmail.com', N'83126433', N'Santa Catarina')
INSERT [dbo].[PERSONA] ([codigo], [nombre], [Apellidos], [Email], [Telefono], [direccion]) VALUES (N'1010M', N'Michelle', N'Diaz Gutierrez', N'michelli@hotmail.com', N'84129941', N'San Pedro')
GO
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10001', N'Galleta con malvabiscos', 10, N'Rainbow', 60.2, N'00106', N'001G')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10003', N'Refresco sabor piña 500ml', 12, N'Botecito', 480, N'00110', N'005P')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10004', N'Catsup 300ml', 18.5, N'Periquito', 290, N'00106', N'008D')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10005', N'Pan de concha 2pz', 15.5, N'Konchaz', 90, N'00101', N'003T')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10006', N'Leche pasteurizada 1L', 21, N'Vaca Lilu', 900, N'00106', N'010P')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10007', N'Papas a la francesa 70gr', 11, N'Saladz', 70, N'00107', N'004S')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10008', N'Galletas cubiertas de chocolate', 12, N'Pingus', 120, N'00109', N'001G')
INSERT [dbo].[PRODUCTOS] ([codigo], [descripcion], [precio], [nombre], [peso], [codigo_compra], [codigo_proveedor]) VALUES (N'10009', N'Papas freidas sabor jalapeño', 14, N'Tostistos', 60, N'00104', N'004S')
GO
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'001G', N'Gamesta', N'84356123', N'San Nicolas')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'002M', N'Mar y Nela', N'80134532', N'Monterrey')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'003T', N'Tia Lupe', N'84167387', N'San Nicolas')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'004S', N'Sabrotas', N'81937745', N'San Pedro')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'005P', N'Peisi', N'80654482', N'Santa Catarina')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'006B', N'Bokadito', N'81747734', N'Monterrey')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'007T', N'Tristrix', N'88934566', N'San Pedro')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'008D', N'Del Prado', N'81764434', N'Santa Catarina')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'009Z', N'Ziel', N'84839211', N'Monterrey')
INSERT [dbo].[PROVEEDOR] ([codigo], [nombre], [telefono], [dirección]) VALUES (N'010P', N'Plaint Country', N'89102344', N'San Nicolas')
GO
INSERT [dbo].[Vendedor] ([codigo_vendedor], [codigo_Area_Trabajo]) VALUES (N'1002A', N'1010')
INSERT [dbo].[Vendedor] ([codigo_vendedor], [codigo_Area_Trabajo]) VALUES (N'1008A', N'1002')
INSERT [dbo].[Vendedor] ([codigo_vendedor], [codigo_Area_Trabajo]) VALUES (N'1009J', N'1003')
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD FOREIGN KEY([codigo_cliente])
REFERENCES [dbo].[PERSONA] ([codigo])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([codigo_cliente])
REFERENCES [dbo].[CLIENTE] ([codigo_cliente])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([codigo_vendedor])
REFERENCES [dbo].[Vendedor] ([codigo_vendedor])
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD FOREIGN KEY([codigo_proveedor])
REFERENCES [dbo].[PROVEEDOR] ([codigo])
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD FOREIGN KEY([codigo_compra])
REFERENCES [dbo].[COMPRA] ([codigo])
GO
ALTER TABLE [dbo].[Vendedor]  WITH CHECK ADD FOREIGN KEY([codigo_vendedor])
REFERENCES [dbo].[PERSONA] ([codigo])
GO
ALTER TABLE [dbo].[Vendedor]  WITH CHECK ADD FOREIGN KEY([codigo_Area_Trabajo])
REFERENCES [dbo].[AREA_TRABAJO] ([codigo])
GO
USE [master]
GO
ALTER DATABASE [LBD] SET  READ_WRITE 
GO
