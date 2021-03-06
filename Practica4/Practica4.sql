USE [LABBD]
GO
/****** Object:  Table [dbo].[client]    Script Date: 13/03/2020 07:19:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoApellido] [varchar](50) NOT NULL,
	[NombreCompleto]  AS (((([Nombre]+' ')+[PrimerApellido])+' ')+[SegundoApellido]),
	[FechaNacimiento] [datetime] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNacimiento],getdate())),
	[email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallesVenta]    Script Date: 13/03/2020 07:19:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallesVenta](
	[Id] [uniqueidentifier] NOT NULL,
	[productId] [uniqueidentifier] NOT NULL,
	[CantidadProductos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 13/03/2020 07:19:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[Id] [uniqueidentifier] NOT NULL,
	[nombreProducto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendedor]    Script Date: 13/03/2020 07:19:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendedor](
	[Id] [uniqueidentifier] NOT NULL,
	[IdVenta] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoApellido] [varchar](50) NOT NULL,
	[NombreCompleto]  AS (((([Nombre]+' ')+[PrimerApellido])+' ')+[SegundoApellido]),
	[email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_vendedor_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 13/03/2020 07:19:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[Id] [uniqueidentifier] NOT NULL,
	[detallesVentaId] [uniqueidentifier] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[Total] [float] NOT NULL,
	[HorasTranscurrido]  AS (datediff(hour,[FechaCompra],getdate())),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detallesVenta]  WITH CHECK ADD  CONSTRAINT [FK_detallesVenta_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([Id])
GO
ALTER TABLE [dbo].[detallesVenta] CHECK CONSTRAINT [FK_detallesVenta_product]
GO
ALTER TABLE [dbo].[vendedor]  WITH CHECK ADD  CONSTRAINT [FK_vendedor_venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[venta] ([Id])
GO
ALTER TABLE [dbo].[vendedor] CHECK CONSTRAINT [FK_vendedor_venta]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_detallesVenta] FOREIGN KEY([detallesVentaId])
REFERENCES [dbo].[detallesVenta] ([Id])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK_venta_detallesVenta]
GO
ALTER TABLE [dbo].[client]  WITH CHECK ADD  CONSTRAINT [CHK_client_nacimiento] CHECK  (([FechaNacimiento]>=dateadd(year,(-18),getdate()) AND [FechaNacimiento]<=getdate()))
GO
ALTER TABLE [dbo].[client] CHECK CONSTRAINT [CHK_client_nacimiento]
GO
