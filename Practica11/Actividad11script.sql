USE [master]
GO
/****** Object:  Database [LBD]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  UserDefinedFunction [dbo].[NumStr]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[NumStr](@palabra as varchar(100), @numero as int)
returns varchar(150) AS
BEGIN
   return @palabra+CAST(@numero as varchar)
END
GO
/****** Object:  UserDefinedFunction [dbo].[reponerPorX]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[reponerPorX](@nombre varchar(100))
returns varchar(100) AS
BEGIN
declare @i int
declare @new varchar(100)
SET @i=1

	while @i<len(@nombre)
	BEGIN 
		SET @nombre= REPLACE(@nombre,SUBSTRING(@nombre,@i,@i),'X')
		SET @i=@i+1
	END
	return @nombre
END
GO
/****** Object:  Table [dbo].[AREA_TRABAJO]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[COMPRA]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[datosClientes]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[PERSONA]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  Table [dbo].[RespaldoPersonas]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RespaldoPersonas](
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
/****** Object:  Table [dbo].[Vendedor]    Script Date: 05/06/2020 04:26:38 p. m. ******/
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
/****** Object:  View [dbo].[personas_compras]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[personas_compras] AS(
SELECT nombre,Apellidos,direccion,Email,Total,Fecha  FROM PERSONA LEFT JOIN COMPRA ON codigo_cliente=Persona.codigo
WHERE PERSONA.codigo=(SELECT codigo_cliente FROM CLIENTE where PERSONA.codigo=codigo_cliente) 
GROUP BY nombre,Apellidos,direccion,Email,Total,Fecha
)
GO
/****** Object:  View [dbo].[producto_Proveedores]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[producto_Proveedores] AS (
SELECT Proveedor.nombre as nombreProveedor,dirección,telefono,PRODUCTOS.nombre,descripcion
FROM PRODUCTOS RIGHT JOIN PROVEEDOR ON PROVEEDOR.codigo=PRODUCTOS.codigo_proveedor
GROUP BY PRODUCTOS.nombre,descripcion,Proveedor.nombre,dirección,telefono
)
GO
/****** Object:  View [dbo].[productos_Compras]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[productos_Compras] AS (
SELECT PRODUCTOS.codigo AS codigoProducto,nombre,precio,COMPRA.codigo, Fecha FROM PRODUCTOS LEFT JOIN COMPRA ON codigo_compra=COMPRA.codigo
)
GO
/****** Object:  View [dbo].[puestos_portoma]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[puestos_portoma] AS(
SELECT codigo_vendedor,nombre,descripcion,Salario FROM AREA_TRABAJO CROSS JOIN Vendedor
GROUP BY codigo_vendedor,codigo_Area_Trabajo,nombre,descripcion,Salario HAVING codigo_vendedor!=codigo_Area_Trabajo
)
GO
/****** Object:  View [dbo].[vendedores_ventasActuales]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vendedores_ventasActuales] AS(
SELECT Persona.nombre as Nombre_vendedor,Apellidos,direccion,Email,fecha,Total,Cantidad_Productos 
FROM PERSONA LEFT JOIN COMPRA on Persona.codigo=COMPRA.codigo_vendedor
WHERE PERSONA.codigo=(SELECT codigo_vendedor FROM Vendedor where Persona.codigo=codigo_vendedor)
GROUP BY Persona.nombre,Apellidos,direccion,Email,fecha,Total,Cantidad_Productos
)
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
/****** Object:  StoredProcedure [dbo].[comprasUnProducto]    Script Date: 05/06/2020 04:26:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[comprasUnProducto](@codigoProducto as varchar(30)) AS
BEGIN
	SELECT * FROM productos_Compras WHERE codigo=(SELECT codigo FROM PRODUCTOS WHERE codigo=@codigoProducto)
END
GO
/****** Object:  StoredProcedure [dbo].[listPersonsForDireccion]    Script Date: 05/06/2020 04:26:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[listPersonsForDireccion](@direccion as varchar(50)) AS
BEGIN
 SELECT * FROM personas_compras WHERE direccion=@direccion
END
GO
/****** Object:  StoredProcedure [dbo].[order5BestWithMonth]    Script Date: 05/06/2020 04:26:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[order5BestWithMonth](@mes as varchar(2)) AS
BEGIN
     SELECT Top 5 *  FROM personas_compras WHERE MONTH(Fecha)='05' ORDER BY Total 
END
GO
/****** Object:  StoredProcedure [dbo].[primerLetNombre]    Script Date: 05/06/2020 04:26:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[primerLetNombre](@letra as varchar(1)) AS 
BEGIN
	SELECT * FROM personas_compras WHERE SUBSTRING(nombre,1,1)=@letra
END
GO
/****** Object:  StoredProcedure [dbo].[ventasDeVenedor]    Script Date: 05/06/2020 04:26:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ventasDeVenedor](@nombreVendedor as varchar(50)) AS
BEGIN
	SELECT * FROM vendedores_ventasActuales WHERE Nombre_vendedor=@nombreVendedor
END
GO
USE [master]
GO
ALTER DATABASE [LBD] SET  READ_WRITE 
GO
