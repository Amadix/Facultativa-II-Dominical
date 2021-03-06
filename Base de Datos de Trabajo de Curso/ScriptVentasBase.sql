USE [master]
GO
/****** Object:  Database [BDAYDTest]    Script Date: 29/09/2017 22:16:07 ******/
CREATE DATABASE [BDBase]
GO
USE [BDBase]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDesencriptarPass]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 CREATE FUNCTION [dbo].[fnDesencriptarPass](@prmPassword varbinary(8000))
	 RETURNS nvarchar(50)
	  AS
	   BEGIN
	     DECLARE @password nvarchar(50)
		 SET @password = DECRYPTBYPASSPHRASE('Bibli0t3ca_8000',@prmPassword)
		 RETURN @password
    	END


GO
/****** Object:  UserDefinedFunction [dbo].[fnEncriptarPass]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	--Creamos las funciona para encriptar y desencriptar password
	CREATE FUNCTION [dbo].[fnEncriptarPass](@prmPassword nvarchar(50))
	RETURNS VARBINARY(8000)
	AS
	  BEGIN
	   DECLARE @password varbinary(8000)
	   SET @password = ENCRYPTBYPASSPHRASE('Bibli0t3ca_8000',@prmPassword)
	   RETURN @password
	  END 


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodCategoria]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    -- Creando funcion para categoria
 CREATE FUNCTION [dbo].[fnGenCodCategoria]()
  RETURNS nchar(6)
  as
   BEGIN
   DECLARE @CodCategoria nchar(6)
	 SET @CodCategoria = (SELECT MAX(Codigo_Cat) FROM Categoria)
	 SET @CodCategoria = 'CAT' + RIGHT('00'+LTRIM(RIGHT(ISNULL(@CodCategoria,'00'),3)+1),3)
	 RETURN @CodCategoria
   END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodProducto]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   -- Funcion para generar codigo producto
  CREATE FUNCTION [dbo].[fnGenCodProducto]()
  RETURNS nchar(6)
  as
   BEGIN
   DECLARE @CodProducto nchar(6)
	 SET @CodProducto = (SELECT MAX(Codigo_Prod) FROM Producto)
	 SET @CodProducto = 'P' + RIGHT('00000'+LTRIM(RIGHT(ISNULL(@CodProducto,'00000'),5)+1),5)
	 RETURN @CodProducto
   END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodProveedor]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  /*Creando mas funciones para generar codigos */
  -- Creando funcion para proveedor
  CREATE FUNCTION [dbo].[fnGenCodProveedor]()
  RETURNS nchar(6)
  as
   BEGIN
   DECLARE @CodProveedor nchar(6)
	 SET @CodProveedor = (SELECT MAX(Cod_Proveedor) FROM Proveedor)
	 SET @CodProveedor = 'PROV' + RIGHT('0'+LTRIM(RIGHT(ISNULL(@CodProveedor,'0'),2)+1),2)
	 RETURN @CodProveedor
   END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodUnidadMedida]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --SELECT DBO.fnDesencriptarPass() FROM Usuario

 --SELECT * FROM Usuario

 --  delete from Usuario 
 -- dbcc checkident('Usuario',reseed,0)

 --> Unidad de medida <--
 -- Creando funcion que genera codigo para unidad de medida
  CREATE FUNCTION [dbo].[fnGenCodUnidadMedida]()
  RETURNS NCHAR(5)
  AS
    BEGIN 
	 DECLARE @CodUnidadMedida NCHAR(5)
	 SET @CodUnidadMedida = (SELECT MAX(Codigo_Umed) FROM UnidadMedida)
	 SET @CodUnidadMedida = 'UM' + RIGHT('00'+LTRIM(RIGHT(ISNULL(@CodUnidadMedida,'00'),3)+1),3)
	 RETURN @CodUnidadMedida
	END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodUniMedida]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   -- Creando funcion para Unu. Medida
 CREATE FUNCTION  [dbo].[fnGenCodUniMedida]()
  RETURNS nchar(6)
  as
   BEGIN
   DECLARE @CodUniMedida nchar(5)
	 SET @CodUniMedida = (SELECT MAX(Id_Umed) FROM UnidadMedida)
	 SET @CodUniMedida = 'UM' + RIGHT('00'+LTRIM(RIGHT(ISNULL(@CodUniMedida,'00'),3)+1),3)
	 RETURN @CodUniMedida
   END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodUsuario]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




 --dbcc checkident('Sucursal',reseed,0)

 --delete from Sucursal

 --> Usuario <--
 -- Creamos la funcion que genera el codigo de los usuarios
	 CREATE FUNCTION [dbo].[fnGenCodUsuario]()
	 RETURNS NCHAR(4)
	 AS 
		 BEGIN
		 Declare @CodUsuario nchar(4) 
		set @CodUsuario =(SELECT MAX(Codigo_Usuario) FROM Usuario)
		SET @CodUsuario  = 'U' + RIGHT('00'+LTRIM(RIGHT (ISNULL( @CodUsuario ,'00'),3)+1),3)
		return  @CodUsuario 
		 END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGenCodVenta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE FUNCTION [dbo].[fnGenCodVenta]()
  RETURNS nchar(11)
  as
   BEGIN
   DECLARE @CodVenta nchar(11)
	 SET @CodVenta = (SELECT MAX(Codigo_Venta) FROM Venta)
	 SET @CodVenta = 'V' + RIGHT('000000000'+LTRIM(RIGHT(ISNULL(@CodVenta,'000000000'),10)+1),10)
	 RETURN @CodVenta

   END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGenerarCorrelativo]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGenerarCorrelativo](@id_tipcom int,@NumSerie nchar(4))
    RETURNS nchar(6)
	 as
	  BEGIN
     DECLARE @correlativo nchar(6)
	 SET @correlativo = (SELECT MAX(Correlativo_Venta) FROM Venta WHERE Id_TipCom_Venta=@id_tipcom AND Serie_Venta= @NumSerie)
	 SET @correlativo = RIGHT('00000'+LTRIM(RIGHT(ISNULL(@correlativo,'00000'),6)+1),6)
	 RETURN @correlativo
	  END


GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id_Cat] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Cat] [nchar](6) NOT NULL,
	[Nombre_Cat] [nvarchar](100) NOT NULL,
	[Descripcion_Cat] [nvarchar](200) NULL,
	[FechCreacion_Cat] [datetime] NOT NULL DEFAULT (getdate()),
	[UsuarioCreacion_Cat] [int] NULL,
	[FechUpdate_Cat] [datetime] NULL,
	[UsuarioUpdate_Cat] [int] NULL,
	[Estado_Categoria] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id_Cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Id_TipDoc_Cliente] [int] NOT NULL,
	[NumeroDoc_Cliente] [nchar](15) NOT NULL,
	[Nombre_Cliente] [nvarchar](300) NOT NULL,
	[FechaNac_Cliente] [datetime] NULL,
	[Sexo_Cliente] [nchar](1) NULL,
	[Telefono_Cliente] [nchar](8) NULL,
	[Celular_Cliente] [nchar](9) NULL,
	[Correo_Cliente] [nvarchar](100) NULL,
	[Direccion_Cliente] [nvarchar](200) NULL,
	[Estado_Cliente] [bit] NOT NULL DEFAULT ((1)),
	[FechCreacion_Cliente] [datetime] NOT NULL DEFAULT (getdate()),
	[UsuarioCreacion_Cliente] [int] NULL,
	[FechUpdate_Cliente] [datetime] NULL,
	[UsuarioUpdate_Cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[Id_Det] [int] IDENTITY(1,1) NOT NULL,
	[Id_Prod_Det] [int] NOT NULL,
	[Id_Venta_Det] [int] NOT NULL,
	[PrecProd_Det] [decimal](5, 2) NOT NULL,
	[Cantidad_Det] [int] NOT NULL,
	[Total_Det]  AS ([PrecProd_Det]*[Cantidad_Det]),
PRIMARY KEY CLUSTERED 
(
	[Id_Det] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Material]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id_Material] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Material] [nvarchar](200) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[Id_Moneda] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_Moneda] [nvarchar](50) NOT NULL,
	[imbolo_Moneda] [nchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[Id_Mov] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Mov] [nchar](8) NOT NULL,
	[Id_TipMov_Mov] [int] NOT NULL,
	[Id_Usuario_Mov] [int] NOT NULL,
	[Id_Moneda_Mov] [int] NOT NULL,
	[Monto_Mov] [decimal](5, 2) NOT NULL,
	[Descripcion_Mov] [nvarchar](300) NULL,
	[Fecha_Mov] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Mov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NivelAcceso]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelAcceso](
	[Id_NivelAcc] [int] IDENTITY(1,1) NOT NULL,
	[Numero_NivelAcc] [nchar](2) NOT NULL,
	[Descripcion_NivelAcc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_NivelAcc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_Prod] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cat_prod] [int] NOT NULL,
	[Id_Umed_prod] [int] NOT NULL,
	[Id_Proveedor_Producto] [int] NOT NULL,
	[Codigo_Prod] [nchar](6) NOT NULL,
	[Nombre_Prod] [nvarchar](100) NOT NULL,
	[Marca_Prod] [nvarchar](50) NULL,
	[PrecioCompra_Prod] [decimal](5, 2) NULL,
	[Precio_Prod] [decimal](5, 2) NOT NULL,
	[Stock_Prod] [int] NOT NULL,
	[StockProm_Prod] [int] NULL,
	[StockMin_Prod] [int] NOT NULL CONSTRAINT [DF__Producto__StockM__276EDEB3]  DEFAULT ((0)),
	[FechCreacion_Prod] [datetime] NOT NULL CONSTRAINT [DF__Producto__FechCr__286302EC]  DEFAULT (getdate()),
	[UsuarioCreacion_Prod] [int] NULL,
	[FechUpdate_Prod] [datetime] NULL,
	[UsuarioUpdate_Prod] [int] NULL,
	[Estado_Prod] [bit] NULL DEFAULT ((1)),
	[IdMaterial] [int] NULL,
 CONSTRAINT [PK__Producto__3A592ADF93B1CF68] PRIMARY KEY CLUSTERED 
(
	[Id_Prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Proveedor] [nchar](6) NOT NULL,
	[RazSocial_Proveedor] [nvarchar](200) NOT NULL,
	[Ruc_Proveedor] [nchar](11) NOT NULL,
	[Direccion_Proveedor] [nvarchar](300) NOT NULL,
	[Telefono_Proveedor] [nchar](8) NULL,
	[Celular_Proveedor] [nchar](9) NULL,
	[Correo_Proveedor] [nvarchar](100) NULL,
	[Estado_Proveedor] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Serie]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serie](
	[Id_Serie] [int] IDENTITY(1,1) NOT NULL,
	[Id_Sucursal_Serie] [int] NOT NULL,
	[Id_TipCom_Serie] [int] NOT NULL,
	[Numero_Serie] [nchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Serie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[Id_Suc] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Suc] [nchar](5) NOT NULL,
	[Direccion_Suc] [nvarchar](300) NULL,
	[Estado_Suc] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Suc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipDocumento]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipDocumento](
	[Id_TipDoc] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_TipDoc] [nvarchar](50) NOT NULL,
	[Abreviatura_TipDoc] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TipDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoComprobante]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoComprobante](
	[Id_TipCom] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_TipCom] [nchar](5) NOT NULL,
	[Id_TipMov_TipCom] [int] NOT NULL,
	[Nombre_TipCom] [nvarchar](100) NOT NULL,
	[Descripcion_TipCom] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TipCom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[Id_TipMov] [int] IDENTITY(1,1) NOT NULL,
	[Identificador_TipDoc] [nchar](1) NOT NULL,
	[Descripcion_TipDoc] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TipMov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoPago]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
	[Id_TipPago] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_TipPago] [nchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TipPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[Id_Umed] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Umed] [nchar](5) NOT NULL,
	[Descripcion_Umed] [nvarchar](50) NOT NULL,
	[Abreviatura_Umed] [nchar](20) NOT NULL,
	[Estado_Umed] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[Id_Umed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Usuario] [nchar](4) NOT NULL,
	[Id_nivelAcc_Usuario] [int] NOT NULL,
	[Id_Suc_Usuario] [int] NOT NULL,
	[Nombre_Usuario] [nvarchar](200) NOT NULL,
	[Login_Usuario] [nchar](8) NOT NULL,
	[Password_Usuario] [varbinary](8000) NOT NULL,
	[Telefono_Usuario] [nchar](8) NULL,
	[Celular_Usuario] [nchar](9) NULL,
	[Correo_Usuario] [nvarchar](100) NULL,
	[Estado_Usuario] [bit] NOT NULL DEFAULT ((1)),
	[Expiracion_Usuario] [datetime] NULL,
	[FechCreacion_Usuario] [datetime] NOT NULL DEFAULT (getdate()),
	[UsuarioCreacion_Usuario] [int] NULL,
	[FechUpdate_Usuario] [datetime] NULL,
	[UsuarioUpdate_Usuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Venta] [nchar](11) NOT NULL,
	[Id_Cliente_Venta] [int] NOT NULL,
	[Id_Usuario_Venta] [int] NOT NULL,
	[Id_Suc_Venta] [int] NOT NULL,
	[Id_TipCom_Venta] [int] NOT NULL,
	[Id_Moneda_Venta] [int] NOT NULL,
	[Id_TipPago_Venta] [int] NOT NULL,
	[Serie_Venta] [nchar](4) NOT NULL,
	[Correlativo_Venta] [nchar](6) NULL,
	[Igv_Venta] [int] NOT NULL,
	[FechaVenta] [datetime] NOT NULL CONSTRAINT [DF__Venta__FechaVent__3A81B327]  DEFAULT (getdate()),
	[Estado_Venta] [nchar](1) NOT NULL,
	[Descuento_Venta] [decimal](10, 2) NULL CONSTRAINT [DF__Venta__Descuento__41B8C09B]  DEFAULT ((0)),
	[Desc_Venta] [nvarchar](200) NULL,
 CONSTRAINT [PK__Venta__B3C9EABD61492CD5] PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id_Cat], [Codigo_Cat], [Nombre_Cat], [Descripcion_Cat], [FechCreacion_Cat], [UsuarioCreacion_Cat], [FechUpdate_Cat], [UsuarioUpdate_Cat], [Estado_Categoria]) VALUES (1, N'CAT001', N'POLARIZADOS', N'', CAST(N'2016-11-05 14:02:43.980' AS DateTime), 1, NULL, NULL, 1)
INSERT [dbo].[Categoria] ([Id_Cat], [Codigo_Cat], [Nombre_Cat], [Descripcion_Cat], [FechCreacion_Cat], [UsuarioCreacion_Cat], [FechUpdate_Cat], [UsuarioUpdate_Cat], [Estado_Categoria]) VALUES (2, N'CAT002', N'ACCESORIOS', N'', CAST(N'2016-11-05 14:02:56.290' AS DateTime), 1, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([Id_Cliente], [Id_TipDoc_Cliente], [NumeroDoc_Cliente], [Nombre_Cliente], [FechaNac_Cliente], [Sexo_Cliente], [Telefono_Cliente], [Celular_Cliente], [Correo_Cliente], [Direccion_Cliente], [Estado_Cliente], [FechCreacion_Cliente], [UsuarioCreacion_Cliente], [FechUpdate_Cliente], [UsuarioUpdate_Cliente]) VALUES (1, 3, N'10234545656    ', N'COTER', CAST(N'2016-11-05 00:00:00.000' AS DateTime), N'M', N'        ', N'         ', N'', N'', 0, CAST(N'2016-11-05 14:01:35.617' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Cliente] ([Id_Cliente], [Id_TipDoc_Cliente], [NumeroDoc_Cliente], [Nombre_Cliente], [FechaNac_Cliente], [Sexo_Cliente], [Telefono_Cliente], [Celular_Cliente], [Correo_Cliente], [Direccion_Cliente], [Estado_Cliente], [FechCreacion_Cliente], [UsuarioCreacion_Cliente], [FechUpdate_Cliente], [UsuarioUpdate_Cliente]) VALUES (2, 6, N'DESCONOCIDO    ', N'DESCONOCIDO', CAST(N'2016-11-05 00:00:00.000' AS DateTime), N'M', N'        ', N'         ', N'', N'', 1, CAST(N'2016-11-05 19:49:59.967' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (1, 1, 1, CAST(95.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (2, 22, 2, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (4, 22, 4, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (5, 80, 5, CAST(18.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (6, 144, 5, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (7, 95, 5, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (8, 35, 5, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (9, 17, 5, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (11, 83, 7, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (12, 125, 7, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (13, 123, 7, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (14, 45, 7, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (15, 97, 7, CAST(85.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (16, 44, 7, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (17, 86, 7, CAST(30.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (18, 21, 8, CAST(40.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (19, 144, 8, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (20, 95, 8, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (21, 99, 8, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (22, 123, 8, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (23, 129, 9, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (24, 100, 9, CAST(3.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (25, 63, 9, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (26, 144, 9, CAST(55.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (27, 59, 9, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (28, 19, 9, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (29, 96, 9, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (30, 48, 10, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (31, 145, 10, CAST(80.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (32, 40, 10, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (33, 45, 10, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (34, 63, 10, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (35, 84, 11, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (36, 3, 11, CAST(90.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (37, 136, 11, CAST(13.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (38, 100, 11, CAST(3.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (39, 153, 11, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (40, 181, 12, CAST(10.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (41, 109, 13, CAST(100.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (42, 144, 13, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (43, 95, 13, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (44, 155, 13, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (45, 51, 13, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (46, 123, 14, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (47, 129, 14, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (48, 99, 14, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (49, 128, 14, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (50, 26, 14, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (51, 4, 14, CAST(90.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (52, 153, 15, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (53, 75, 15, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (54, 22, 15, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (55, 59, 15, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (56, 127, 16, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (57, 99, 16, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (58, 61, 16, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (59, 36, 16, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (60, 11, 17, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (61, 97, 17, CAST(85.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (62, 160, 17, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (63, 101, 17, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (64, 139, 17, CAST(12.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (65, 179, 17, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (66, 83, 18, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (67, 178, 18, CAST(45.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (68, 144, 19, CAST(55.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (69, 95, 19, CAST(15.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (70, 181, 19, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (71, 83, 19, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (72, 123, 19, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (73, 35, 19, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (74, 107, 20, CAST(95.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (75, 79, 20, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (76, 105, 20, CAST(20.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (77, 32, 21, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (78, 37, 21, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (79, 61, 21, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (80, 181, 21, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (81, 3, 21, CAST(90.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (82, 80, 22, CAST(18.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (83, 144, 22, CAST(55.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (84, 126, 22, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (85, 104, 22, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (86, 85, 22, CAST(16.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (87, 49, 22, CAST(30.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (88, 117, 23, CAST(30.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (89, 122, 23, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (90, 116, 23, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (98, 110, 25, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (99, 178, 25, CAST(45.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (100, 19, 25, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (101, 80, 25, CAST(18.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (102, 176, 25, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (103, 59, 26, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (104, 131, 26, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (105, 174, 26, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (106, 70, 27, CAST(16.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (107, 175, 27, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (108, 105, 27, CAST(20.00 AS Decimal(5, 2)), 4)
GO
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (109, 106, 27, CAST(20.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (110, 124, 27, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (111, 68, 27, CAST(18.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (112, 9, 28, CAST(170.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (113, 98, 28, CAST(18.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (114, 124, 28, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (115, 99, 29, CAST(15.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (116, 109, 29, CAST(100.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (117, 27, 29, CAST(5.00 AS Decimal(5, 2)), 10)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (118, 56, 29, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (119, 86, 30, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (120, 124, 30, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (121, 178, 30, CAST(45.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (122, 99, 30, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (123, 122, 30, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (124, 19, 30, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (125, 84, 31, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (126, 181, 31, CAST(10.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (127, 86, 31, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (129, 123, 33, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (130, 86, 34, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (131, 116, 35, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (132, 181, 36, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (133, 181, 37, CAST(10.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (134, 149, 38, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (135, 89, 39, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (136, 123, 40, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (137, 153, 41, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (138, 124, 42, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (139, 64, 43, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (140, 3, 44, CAST(90.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (141, 21, 45, CAST(40.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (142, 122, 46, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (143, 85, 47, CAST(16.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (144, 123, 48, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (145, 181, 49, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (146, 123, 50, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (147, 23, 51, CAST(18.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (148, 126, 51, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (149, 181, 51, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (150, 60, 51, CAST(8.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (151, 93, 51, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (152, 48, 51, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (153, 37, 52, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (154, 26, 53, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (155, 153, 53, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (156, 97, 53, CAST(85.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (157, 43, 53, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (158, 124, 54, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (159, 48, 55, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (160, 173, 56, CAST(50.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (161, 177, 56, CAST(30.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (162, 150, 56, CAST(180.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (163, 176, 56, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (164, 47, 56, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (165, 149, 56, CAST(35.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (166, 13, 56, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (167, 131, 56, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (168, 144, 57, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (169, 95, 58, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (170, 59, 59, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (171, 184, 60, CAST(20.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (172, 193, 61, CAST(1.00 AS Decimal(5, 2)), 10)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (173, 130, 62, CAST(20.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (174, 11, 63, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (175, 193, 64, CAST(1.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (176, 124, 65, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (177, 179, 66, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (178, 193, 67, CAST(1.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (179, 97, 68, CAST(85.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (180, 62, 69, CAST(12.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (181, 30, 70, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (182, 29, 71, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (183, 123, 72, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (184, 21, 73, CAST(40.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (185, 176, 74, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (186, 123, 75, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (187, 4, 76, CAST(90.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (188, 123, 77, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (189, 114, 78, CAST(22.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (190, 125, 79, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (191, 98, 79, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (192, 193, 80, CAST(1.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (193, 144, 81, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (194, 95, 82, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (195, 138, 83, CAST(12.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (196, 193, 84, CAST(1.00 AS Decimal(5, 2)), 19)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (197, 26, 84, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (198, 124, 85, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (199, 126, 86, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (200, 181, 87, CAST(10.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (201, 181, 88, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (202, 64, 89, CAST(35.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (203, 193, 89, CAST(1.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (204, 144, 90, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (205, 35, 91, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (206, 144, 92, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (207, 95, 92, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (208, 17, 93, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (209, 123, 93, CAST(15.00 AS Decimal(5, 2)), 1)
GO
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (210, 19, 94, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (211, 116, 95, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (212, 117, 95, CAST(30.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (213, 122, 95, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (214, 62, 96, CAST(12.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (215, 70, 97, CAST(16.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (216, 74, 97, CAST(16.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (217, 100, 97, CAST(3.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (218, 144, 98, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (219, 98, 99, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (220, 178, 99, CAST(45.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (221, 98, 100, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (222, 44, 101, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (223, 144, 102, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (224, 193, 103, CAST(1.00 AS Decimal(5, 2)), 5)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (225, 18, 104, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (226, 189, 105, CAST(15.00 AS Decimal(5, 2)), 4)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (227, 86, 106, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (228, 26, 107, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (229, 21, 108, CAST(40.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (230, 111, 109, CAST(25.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (231, 144, 110, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (232, 94, 110, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (233, 104, 111, CAST(25.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (234, 88, 112, CAST(4.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (235, 192, 113, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (236, 181, 113, CAST(10.00 AS Decimal(5, 2)), 3)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (237, 192, 114, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (238, 181, 114, CAST(10.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (239, 86, 115, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (240, 124, 115, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (241, 96, 116, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (242, 98, 117, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (243, 27, 117, CAST(4.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (244, 123, 118, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (245, 181, 119, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (246, 22, 120, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (247, 98, 121, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (248, 193, 122, CAST(1.00 AS Decimal(5, 2)), 14)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (249, 194, 123, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (250, 176, 124, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (251, 14, 125, CAST(55.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (252, 181, 126, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (253, 91, 127, CAST(35.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (254, 124, 127, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (255, 83, 128, CAST(10.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (256, 64, 129, CAST(35.00 AS Decimal(5, 2)), 2)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (257, 100, 129, CAST(3.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (258, 102, 129, CAST(20.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (259, 86, 130, CAST(23.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (260, 61, 131, CAST(15.00 AS Decimal(5, 2)), 1)
INSERT [dbo].[DetalleVenta] ([Id_Det], [Id_Prod_Det], [Id_Venta_Det], [PrecProd_Det], [Cantidad_Det]) VALUES (261, 96, 132, CAST(15.00 AS Decimal(5, 2)), 1)
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Id_Material], [Nombre_Material], [Estado]) VALUES (1, N'NO APLICA', 1)
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Moneda] ON 

INSERT [dbo].[Moneda] ([Id_Moneda], [Descripcion_Moneda], [imbolo_Moneda]) VALUES (1, N'Soles', N'S/')
INSERT [dbo].[Moneda] ([Id_Moneda], [Descripcion_Moneda], [imbolo_Moneda]) VALUES (2, N'Dolares', N'$ ')
SET IDENTITY_INSERT [dbo].[Moneda] OFF
SET IDENTITY_INSERT [dbo].[NivelAcceso] ON 

INSERT [dbo].[NivelAcceso] ([Id_NivelAcc], [Numero_NivelAcc], [Descripcion_NivelAcc]) VALUES (1, N'1 ', N'Acceso total para usuario maestro de la aplicacion de la aplicacion')
INSERT [dbo].[NivelAcceso] ([Id_NivelAcc], [Numero_NivelAcc], [Descripcion_NivelAcc]) VALUES (2, N'2 ', N'Acceso con restricciones definidad por el usuario')
SET IDENTITY_INSERT [dbo].[NivelAcceso] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (1, 1, 3, 1, N'P00001', N'FUNDAS DE CUERINA UNIVERSAL- ALTO', N'', CAST(65.00 AS Decimal(5, 2)), CAST(95.00 AS Decimal(5, 2)), 20, 8, 1, CAST(N'2016-11-05 14:09:37.800' AS DateTime), 1, NULL, NULL, 0, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (2, 1, 1, 1, N'P00002', N'', N'', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-05 14:23:11.590' AS DateTime), 1, NULL, NULL, 0, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (3, 2, 3, 1, N'P00003', N'FUNDAS UNIVERSAL CUERINA BAJO', N'', CAST(65.00 AS Decimal(5, 2)), CAST(90.00 AS Decimal(5, 2)), 11, 5, 1, CAST(N'2016-11-05 18:33:29.630' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (4, 2, 3, 1, N'P00004', N'FUNDAS UNIVERSAL CUERINA ALTO', N'', CAST(65.00 AS Decimal(5, 2)), CAST(90.00 AS Decimal(5, 2)), 2, 1, 1, CAST(N'2016-11-05 18:34:20.447' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (5, 2, 3, 1, N'P00005', N'FUNDAS CUERINA HILUX ANTIGUA', N'', CAST(120.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(5, 2)), 2, 1, 1, CAST(N'2016-11-05 18:36:18.280' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (6, 2, 3, 1, N'P00006', N'FUNDA CUERINA HILUX REVO', N'', CAST(120.00 AS Decimal(5, 2)), CAST(180.00 AS Decimal(5, 2)), 3, 1, 1, CAST(N'2016-11-05 18:38:00.103' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (7, 2, 3, 1, N'P00007', N'FUNDAS CUERINA HYUNDAI ELANTRA', N'', CAST(110.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 18:39:16.470' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (8, 2, 3, 1, N'P00008', N'FUNDAS CUERINA CHEVROLET SAIL', N'', CAST(95.00 AS Decimal(5, 2)), CAST(135.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 18:40:28.373' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (9, 2, 3, 1, N'P00009', N'FUNDAS CUERINA KIA RIO', N'', CAST(110.00 AS Decimal(5, 2)), CAST(170.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 18:41:19.217' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (10, 2, 3, 1, N'P00010', N'FUNDAS CUERINA HYUNDAI ACCENT', N'', CAST(100.00 AS Decimal(5, 2)), CAST(140.00 AS Decimal(5, 2)), 1, 1, 1, CAST(N'2016-11-05 18:43:05.563' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (11, 2, 3, 2, N'P00011', N'FUNDAS MAYA GRUESA AZUL BAJO', N'', CAST(37.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 6, 2, 1, CAST(N'2016-11-05 18:51:41.083' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (12, 2, 3, 2, N'P00012', N'FUNDAS MAYA GRUESA AZUL ALTO', N'', CAST(37.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-05 18:56:47.843' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (13, 2, 3, 2, N'P00013', N'FUNDAS MAYA GRUESA PLOMO ALTO', N'', CAST(37.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 3, 1, 1, CAST(N'2016-11-05 18:57:49.333' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (14, 2, 3, 2, N'P00014', N'FUNDAS MAYA GRUESA PLOMO BAJO', N'', CAST(37.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 7, 2, 1, CAST(N'2016-11-05 18:58:20.247' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (15, 2, 3, 2, N'P00015', N'FUNDAS MAYA GRUESA ROJO BAJO', N'', CAST(37.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-05 18:59:06.503' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (16, 2, 3, 2, N'P00016', N'FUNDAS MAYA GRUESA ROJO ALTO', N'', CAST(37.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-05 18:59:38.837' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (17, 2, 3, 3, N'P00017', N'ESCARPINES DE  NISSAN', N'', CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-05 19:07:14.763' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (18, 2, 3, 3, N'P00018', N'ESCARPINES DE JEBE TOYOTA', N'', CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 7, 2, 1, CAST(N'2016-11-05 19:08:37.783' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (19, 2, 3, 2, N'P00019', N'ESCARPINES DE JEBE SIN NOMBRE', N'', CAST(11.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 6, 2, 1, CAST(N'2016-11-05 19:18:17.650' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (20, 2, 2, 3, N'P00020', N'ESPEJOS LATERALES NACIONALES', N'COROLLA', CAST(12.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 19:28:44.373' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (21, 2, 1, 2, N'P00021', N'ESPALDARES BOLITAS CON CABECERA', N'', CAST(23.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 1, 2, 1, CAST(N'2016-11-05 19:31:53.847' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (22, 2, 1, 2, N'P00022', N'ESPALDARES DE BOLITA SIN CABECERA', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 2, 2, 1, CAST(N'2016-11-05 19:32:43.007' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (23, 2, 1, 2, N'P00023', N'SIRENA DE 6 TONOS', N'', CAST(9.00 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-05 19:34:09.040' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (24, 2, 1, 2, N'P00024', N'ESPEJO RETROVISOR INTERIOR CON BASE', N'', CAST(15.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 19:35:45.250' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (25, 2, 1, 2, N'P00025', N'PORTANOTAS', N'', CAST(5.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 19:36:33.493' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (26, 2, 2, 2, N'P00026', N'PORTAPLACA DE PLASTICO', N'', CAST(1.50 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 16, 4, 1, CAST(N'2016-11-05 19:37:43.357' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (27, 2, 6, 2, N'P00027', N'FILETE CROMADO', N'', CAST(1.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), 138, 2, 1, CAST(N'2016-11-05 19:41:55.220' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (28, 2, 2, 2, N'P00028', N'PLUMILLA SIMPLE 16', N'', CAST(4.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 10, 2, 1, CAST(N'2016-11-05 19:43:28.440' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (29, 2, 1, 4, N'P00029', N'CABLE DE REMOLQUE 5 TONELADAS', N'ACERO', CAST(17.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 2, 1, 1, CAST(N'2016-11-05 19:59:03.417' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (30, 2, 1, 4, N'P00030', N'CABLE DE BATERIA DE 400 AMPERIOS', N'', CAST(18.50 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 3, 1, 1, CAST(N'2016-11-05 20:00:52.817' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (31, 2, 1, 4, N'P00031', N'GATA BOTELLA DE 2 TON', N'', CAST(29.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-05 20:03:31.370' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (32, 2, 1, 4, N'P00032', N'GATA BOTELLA DE 4 TON', N'', CAST(38.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-05 20:04:15.830' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (33, 2, 1, 4, N'P00033', N'GATA BOTELLA 6 TON', N'', CAST(48.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:04:49.283' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (34, 2, 1, 4, N'P00034', N'GATA CASTILLO 1 TON', N'', CAST(28.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 20:05:14.210' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (35, 2, 1, 4, N'P00035', N'SEGURO DE RUEDA', N'TOYOTA 1.5', CAST(9.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 7, 2, 1, CAST(N'2016-11-05 20:06:42.520' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (36, 2, 1, 4, N'P00036', N'SEGURO DE RUEDA', N'NISSAN 1.25', CAST(9.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-05 20:07:27.650' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (37, 2, 1, 4, N'P00037', N'LLAVE DE RUEDAS', N'CROMADA', CAST(13.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 6, 1, 1, CAST(N'2016-11-05 20:08:06.323' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (38, 2, 1, 4, N'P00038', N'ANTENA DE RADIO TIPO PIONER', N'NEGRA', CAST(10.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:09:30.350' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (39, 2, 1, 4, N'P00039', N'ANTENA DE RADIO TIPO PIONER', N'AZUL', CAST(10.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:09:49.770' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (40, 2, 1, 4, N'P00040', N'ANTENA DE RADIO TIPO PIONER', N'CROMADA', CAST(10.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:10:09.183' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (41, 2, 1, 4, N'P00041', N'ANTENA DE RADIO TIPO PIONER', N'ROJO', CAST(10.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:10:24.370' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (42, 2, 1, 4, N'P00042', N'ANTENA DE RADIO TIPO PIONER', N'BLANCA', CAST(10.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:10:39.023' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (43, 2, 1, 4, N'P00043', N'PERILLA DE TIMON', N'NEGRO', CAST(9.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:11:19.743' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (44, 2, 1, 4, N'P00044', N'PERILLA DE TIMON', N'AZUL', CAST(9.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:11:39.553' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (45, 2, 1, 4, N'P00045', N'PERILLA DE PALANCA CUERO', N'NEGRA', CAST(12.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), 8, 1, 1, CAST(N'2016-11-05 20:12:08.983' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (46, 2, 1, 4, N'P00046', N'PORTA CELULAR TIPO ARAÑA', N'', CAST(10.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:13:45.863' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (47, 2, 1, 4, N'P00047', N'PORTA CELULAR GIRATORIO', N'', CAST(9.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:14:13.787' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (48, 2, 1, 4, N'P00048', N'PORTA CELULAR NEGRO CON CROMADO', N'', CAST(8.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 4, 0, 0, CAST(N'2016-11-05 20:17:10.357' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (49, 2, 1, 4, N'P00049', N'PORTA CELULAR GIRATORIO MOD 2', N'', CAST(12.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:20:07.220' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (50, 2, 1, 4, N'P00050', N'VENTILADOR 12 VOLTEOS', N'', CAST(23.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 20:21:50.553' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (51, 2, 1, 4, N'P00051', N'ALARMA DE RETROCESO', N'BIBIBI', CAST(7.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 9, 2, 1, CAST(N'2016-11-05 20:22:55.627' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (52, 2, 1, 4, N'P00052', N'ALARMA DE RETOCESO', N'INDUSTRIAL', CAST(31.00 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:23:38.003' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (53, 2, 1, 4, N'P00053', N'PORTA PLACA CROMADA', N'', CAST(14.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 14, 2, 1, CAST(N'2016-11-05 20:25:23.580' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (54, 2, 1, 4, N'P00054', N'ANTENA DECORATIVA', N'LARGA BLANCA', CAST(5.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 20:26:40.487' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (55, 2, 1, 4, N'P00055', N'ANTENA DECORATIVA', N'PEQUEÑA BLANCA', CAST(5.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:27:19.990' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (56, 2, 1, 4, N'P00056', N'ANTENA DECORATIVA', N'PEQUEÑA NEGRA', CAST(5.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:27:56.897' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (57, 2, 1, 4, N'P00057', N'ENCEDEDOR DE CIGARRO', N'LUZ VERDE', CAST(9.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:29:42.573' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (58, 2, 1, 4, N'P00058', N'ENCEDEDOR DE CIGARRO', N'UNIVERSAL', CAST(5.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:29:59.710' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (59, 2, 1, 4, N'P00059', N'FORRO DE TIMON CUERINA', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 16, 5, 1, CAST(N'2016-11-05 20:32:24.243' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (60, 2, 1, 4, N'P00060', N'MEDIDOR DE AIRE', N'ECONOMICA', CAST(2.60 AS Decimal(5, 2)), CAST(8.00 AS Decimal(5, 2)), 9, 2, 1, CAST(N'2016-11-05 20:34:39.243' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (61, 2, 1, 4, N'P00061', N'MEDIDOR DE AIRE', N'DOBLE CABEZA', CAST(6.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 2, 1, 1, CAST(N'2016-11-05 20:35:21.387' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (62, 2, 1, 4, N'P00062', N'MEDIDOR DE AIRE', N'TIPO FRENTE', CAST(5.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-05 20:35:59.893' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (63, 2, 1, 4, N'P00063', N'TAPASOL DE CARTON', N'PLATEADO', CAST(4.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 8, 2, 1, CAST(N'2016-11-05 20:37:15.170' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (64, 2, 1, 4, N'P00064', N'PORTA PLACA LED', N'AZUL', CAST(18.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 0, 1, 1, CAST(N'2016-11-05 20:38:07.033' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (65, 2, 1, 4, N'P00065', N'PORTA PLACA LED', N'BLANCA', CAST(18.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 20:38:42.317' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (66, 2, 1, 4, N'P00066', N'LUZ DE SALON DE NEON BLANCA PEQUEÑA', N'', CAST(10.50 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:40:09.917' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (67, 2, 1, 4, N'P00067', N'LUZ DE SALON DE NEON AZUL PEQUEÑA', N'', CAST(10.50 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 20:41:07.890' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (68, 2, 1, 4, N'P00068', N'LUZ DE SALON DE NEON BLANCO GRANDE', N'', CAST(8.23 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:42:49.397' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (69, 2, 1, 4, N'P00069', N'LUZ DE SALON DE NEON AZUL GRANDE', N'', CAST(8.23 AS Decimal(5, 2)), CAST(18.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 20:43:26.823' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (70, 2, 1, 4, N'P00070', N'CORTADORA BLANCA', N'', CAST(9.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:45:01.893' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (71, 2, 1, 4, N'P00071', N'CORTADORA AZUL', N'', CAST(9.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 20:45:41.740' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (72, 2, 1, 4, N'P00072', N'CORTADORA ROJA', N'', CAST(9.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 20:46:07.023' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (73, 2, 1, 4, N'P00073', N'CORTADORA LILA', N'', CAST(9.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 20:46:32.447' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (74, 2, 1, 4, N'P00074', N'CORTADORA VERDE', N'', CAST(9.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-05 20:46:59.183' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (75, 2, 2, 4, N'P00075', N'BOTA AGUA LED BLANCO', N'', CAST(3.60 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 9, 2, 1, CAST(N'2016-11-05 20:48:17.990' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (76, 2, 2, 4, N'P00076', N'BOTA AGUA LEZ AZUL', N'', CAST(3.60 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 10, 2, 1, CAST(N'2016-11-05 20:49:24.357' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (77, 2, 2, 4, N'P00077', N'BOTA AGUA LED ROJO', N'', CAST(3.60 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 5, 0, 0, CAST(N'2016-11-05 20:50:06.620' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (78, 2, 2, 4, N'P00078', N'BOTA AGUA LED VERDE', N'', CAST(3.60 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-05 20:50:43.507' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (79, 2, 2, 4, N'P00079', N'ESPEJO LATERAL CON LUZ CROMO', N'', CAST(31.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 20:52:38.867' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (80, 2, 1, 4, N'P00080', N'CLAXON PLATILLO', N'', CAST(8.84 AS Decimal(5, 2)), CAST(22.00 AS Decimal(5, 2)), 7, 0, 0, CAST(N'2016-11-05 20:53:27.453' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (81, 2, 1, 4, N'P00081', N'PLUMILLA ERGONOMICA 18', N'', CAST(3.77 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 20, 4, 1, CAST(N'2016-11-05 20:55:05.197' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (82, 2, 1, 4, N'P00082', N'PLUMILLA ERGONOMICA 16', N'', CAST(3.77 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 20, 4, 1, CAST(N'2016-11-05 20:55:42.853' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (83, 2, 1, 4, N'P00083', N'TAPASOL DE MAYA', N'', CAST(4.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 16, 4, 1, CAST(N'2016-11-05 20:57:05.950' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (84, 2, 1, 4, N'P00084', N'ESPEJO PANORAMICO INTERIOR SIN BASE', N'', CAST(7.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 13, 3, 2, CAST(N'2016-11-05 20:57:51.670' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (85, 2, 1, 4, N'P00085', N'ESPALDARES DE ALAMBRE DELGADO', N'', CAST(10.00 AS Decimal(5, 2)), CAST(16.00 AS Decimal(5, 2)), 3, 1, 1, CAST(N'2016-11-05 20:59:05.260' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (86, 2, 1, 4, N'P00086', N'ESPALDARES DE ALAMBRE GRUESO', N'', CAST(15.00 AS Decimal(5, 2)), CAST(23.00 AS Decimal(5, 2)), 8, 1, 1, CAST(N'2016-11-05 20:59:40.907' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (87, 1, 5, 5, N'P00087', N'STIKER IMPRESOS', N'NACIONALES', CAST(1.50 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), 30, 5, 1, CAST(N'2016-11-05 21:03:41.377' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (88, 1, 1, 5, N'P00088', N'LETREROS EN CHORROSPUN', N'FUERA DE SERVICIO', CAST(0.50 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), 47, 5, 1, CAST(N'2016-11-05 21:08:49.467' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (89, 2, 3, 1, N'P00089', N'PISOS METALICOS DE 4 PIEZAS NEGRO', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-05 21:10:42.063' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (90, 2, 3, 1, N'P00090', N'PISOS METALICOS DE 4 PIEZAS CROMADO', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 21:11:10.667' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (91, 2, 3, 1, N'P00091', N'PISOS METALICOS DE 4 PIEZAS ROJO', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 21:11:30.263' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (92, 2, 3, 1, N'P00092', N'PISOS METALICOS DE 4 PIEZAS AZUL', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 21:11:59.217' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (93, 2, 3, 1, N'P00093', N'PISOS METALICOS DE 4 PIEZAS CARBON', N'', CAST(20.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-05 21:12:29.660' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (94, 2, 3, 1, N'P00094', N'SEGURO DE COPA ESCALERA', N'', CAST(4.80 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 9, 1, 0, CAST(N'2016-11-05 21:13:38.013' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (95, 2, 3, 1, N'P00095', N'SEGURO DE COPA CENTRAL', N'', CAST(4.80 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 7, 1, 0, CAST(N'2016-11-05 21:14:22.610' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (96, 2, 3, 1, N'P00096', N'SEGURO DE COPA ALAMBRE', N'', CAST(4.80 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 12, 1, 0, CAST(N'2016-11-05 21:15:15.640' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (97, 2, 1, 1, N'P00097', N'ESPALDAR FRESCO ORIGINAL', N'', CAST(60.00 AS Decimal(5, 2)), CAST(85.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 21:16:14.360' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (98, 2, 1, 1, N'P00098', N'SILICONA UV3', N'SIMONIZ', CAST(10.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 16, 1, 0, CAST(N'2016-11-05 21:17:27.237' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (99, 2, 1, 1, N'P00099', N'SILICONA EN SPRAY', N'MARGARITO', CAST(9.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 17, 1, 0, CAST(N'2016-11-05 21:18:27.203' AS DateTime), 1, NULL, NULL, 1, 1)
GO
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (100, 2, 1, 1, N'P00100', N'AMBIENTADORES ECONOMICOS', N'ROCKI', CAST(0.50 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), 43, 1, 0, CAST(N'2016-11-05 21:19:49.163' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (101, 2, 1, 1, N'P00101', N'TAPASOL METALICO CON DISEÑO', N'', CAST(3.80 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 11, 1, 0, CAST(N'2016-11-05 21:21:09.577' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (102, 2, 1, 1, N'P00102', N'AMBIENTADOR PARA AIRE ACONDICIONADO', N'SHICK', CAST(10.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 9, 1, 0, CAST(N'2016-11-05 21:22:46.323' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (103, 2, 1, 1, N'P00103', N'PORTA PLACA DE NEON AZUL', N'', CAST(15.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 10, 1, 0, CAST(N'2016-11-05 21:23:45.387' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (104, 2, 1, 1, N'P00104', N'PORTA PLACA DE NEON BLANCA', N'', CAST(15.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 7, 1, 0, CAST(N'2016-11-05 21:24:06.280' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (105, 2, 6, 1, N'P00105', N'TIRAS LED SILICONADAS BLANCO', N'', CAST(5.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 10, 1, 0, CAST(N'2016-11-05 21:26:04.760' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (106, 2, 6, 1, N'P00106', N'TIRAS LED SILICONADAS AZUL', N'', CAST(5.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 14, 1, 0, CAST(N'2016-11-05 21:27:57.770' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (107, 2, 2, 1, N'P00107', N'ESPEJO LATERAL IMPORTADO COROLLA', N'', CAST(65.00 AS Decimal(5, 2)), CAST(95.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 21:29:21.637' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (108, 2, 1, 1, N'P00108', N'COVERTOR PESADO M', N'', CAST(70.00 AS Decimal(5, 2)), CAST(95.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 21:31:00.767' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (109, 2, 1, 1, N'P00109', N'COVERTOR PESADO L', N'', CAST(75.00 AS Decimal(5, 2)), CAST(100.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 21:31:19.067' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (110, 2, 1, 1, N'P00110', N'PLUMILLA SIMPLE 18', N'', CAST(3.50 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 19, 2, 0, CAST(N'2016-11-05 21:34:22.233' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (111, 2, 2, 1, N'P00111', N'PLUMILLA METALICA 16', N'NIZUMI', CAST(8.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 13, 1, 0, CAST(N'2016-11-05 21:37:01.190' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (112, 2, 2, 1, N'P00112', N'PLUMILLA METALICA 18', N'NIZUMI', CAST(8.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 16, 1, 0, CAST(N'2016-11-05 21:37:32.643' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (113, 2, 2, 1, N'P00113', N'PLUMILLA METALICA 20', N'NIZUMI', CAST(8.50 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 15, 1, 0, CAST(N'2016-11-05 21:38:02.033' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (114, 2, 1, 1, N'P00114', N'CONO DE SEGURIDAD 45 CM', N'JEBE', CAST(12.00 AS Decimal(5, 2)), CAST(22.00 AS Decimal(5, 2)), 14, 2, 0, CAST(N'2016-11-05 21:39:51.393' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (115, 2, 1, 1, N'P00115', N'CONO DE SEGURIDAD 70 CM', N'JEBE', CAST(25.00 AS Decimal(5, 2)), CAST(42.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 21:40:35.330' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (116, 2, 1, 1, N'P00116', N'BOTIQUIN DE CARTON', N'', CAST(4.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 17, 2, 0, CAST(N'2016-11-05 21:42:33.817' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (117, 2, 1, 1, N'P00117', N'EXTINTOR 1 KL', N'', CAST(18.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 13, 2, 0, CAST(N'2016-11-05 21:43:51.350' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (118, 2, 1, 1, N'P00118', N'EXTINTOR 2 KL', N'', CAST(22.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-05 21:44:20.650' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (119, 2, 1, 1, N'P00119', N'EXTINTOR 4 KL', N'', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-05 21:46:08.193' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (120, 2, 1, 1, N'P00120', N'EXTINTOR 6 KL', N'', CAST(45.00 AS Decimal(5, 2)), CAST(75.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 21:47:13.907' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (121, 2, 3, 1, N'P00121', N'ARCO CROMADO', N'', CAST(10.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 5, 0, 0, CAST(N'2016-11-05 21:48:50.730' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (122, 2, 2, 1, N'P00122', N'TRIANGULOS DE SEGURIDAD', N'PLASTICO', CAST(6.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 8, 0, 0, CAST(N'2016-11-05 21:49:53.420' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (123, 2, 1, 1, N'P00123', N'FORRO DE TIMON REFLEXTIVO', N'', CAST(6.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 17, 1, 0, CAST(N'2016-11-05 21:51:02.130' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (124, 2, 1, 1, N'P00124', N'FORRO DE TIMON ENCHAROLADO', N'', CAST(8.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 1, 1, 0, CAST(N'2016-11-05 21:51:34.140' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (125, 2, 3, 1, N'P00125', N'PISOS DE JEBE IMPORTADO TOYOTA', N'', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 2, 1, 0, CAST(N'2016-11-05 21:52:40.297' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (126, 2, 3, 1, N'P00126', N'PISOS DE JEBE IMPORTADO HYUNDAI', N'', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 1, 1, 0, CAST(N'2016-11-05 21:53:08.377' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (127, 2, 3, 1, N'P00127', N'PISOS DE JEBE IMPORTADO KIA', N'', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 3, 1, 0, CAST(N'2016-11-05 21:53:28.890' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (128, 2, 3, 1, N'P00128', N'PISOS DE JEBE IMPORTADO NISSAN', N'', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 1, 1, 0, CAST(N'2016-11-05 21:53:49.043' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (129, 2, 3, 1, N'P00129', N'PISOS DE JEBE IMPORTADO SIN MARCA', N'', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 0, 1, 0, CAST(N'2016-11-05 21:54:12.867' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (130, 2, 1, 1, N'P00130', N'CINTURON DE SEGURIDAD 2 PUNTAS', N'', CAST(9.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 9, 2, 0, CAST(N'2016-11-05 21:56:19.247' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (131, 2, 1, 6, N'P00131', N'ANTENA DE TIBURON', N'', CAST(3.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 8, 2, 0, CAST(N'2016-11-05 22:00:24.297' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (132, 2, 1, 6, N'P00132', N'ECUALIZADOR 7COL', N'', CAST(32.00 AS Decimal(5, 2)), CAST(80.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 22:03:26.773' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (133, 2, 1, 6, N'P00133', N'ECUALIZADOR AZUL', N'', CAST(32.00 AS Decimal(5, 2)), CAST(75.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-05 22:04:01.790' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (134, 2, 1, 6, N'P00134', N'EMBLEMA PESCADO JESUS', N'CROMADO', CAST(3.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:05:15.840' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (135, 2, 1, 6, N'P00135', N'EMBLEMA TRD', N'', CAST(6.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:06:32.400' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (136, 2, 1, 6, N'P00136', N'EMBLEMA MONSTER', N'', CAST(2.50 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-05 22:08:29.840' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (137, 2, 1, 6, N'P00137', N'EMBLEMA ALACRAN', N'', CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:10:04.900' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (138, 2, 1, 6, N'P00138', N'EMBLEMA ALAS BATMAN', N'', CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 4, 0, 0, CAST(N'2016-11-05 22:10:33.110' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (139, 2, 1, 6, N'P00139', N'EMBLEMA ARAÑA', N'', CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-05 22:11:41.617' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (140, 2, 1, 6, N'P00140', N'EMBLEMA HELLO KITTY', N'', CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-05 22:12:14.197' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (141, 2, 1, 6, N'P00141', N'EMBLEMA MANCHA DE PINTURA', N'NEGRO', CAST(2.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:16:06.420' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (142, 2, 1, 6, N'P00142', N'EMBLEMA MANCHA DE PINTURA', N'CROMADO', CAST(2.50 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:16:32.703' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (143, 2, 1, 6, N'P00143', N'EMBLEMA FOX', N'', CAST(2.50 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:17:47.583' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (144, 2, 3, 6, N'P00144', N'COPAS PLOMO CON NEGRO 13 Y 14', N'MEXICANAS', CAST(35.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 22:19:25.503' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (145, 2, 3, 6, N'P00145', N'COPAS PLOMO CON NEGRO 15', N'MEXICANAS', CAST(50.00 AS Decimal(5, 2)), CAST(80.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-05 22:20:11.603' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (146, 1, 5, 6, N'P00146', N'STIKER 45X30CM', N'', CAST(4.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 14, 2, 1, CAST(N'2016-11-05 23:05:37.770' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (147, 2, 1, 6, N'P00147', N'EMBLEMA IGUANA', N'', CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 23:08:16.207' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (148, 2, 1, 6, N'P00148', N'EMBLEMA CALABERA FUEGO', N'', CAST(2.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-05 23:08:39.300' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (149, 2, 1, 4, N'P00149', N'BARRAS DE TACO', N'', CAST(18.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 13, 3, 1, CAST(N'2016-11-06 00:21:46.843' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (150, 2, 2, 4, N'P00150', N'BARRAS DE ALUMINIO', N'', CAST(115.00 AS Decimal(5, 2)), CAST(180.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-06 01:17:33.217' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (151, 2, 2, 4, N'P00151', N'BARRAS DE ALUMINIO  CON LLAVE', N'', CAST(150.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-06 01:19:00.930' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (152, 2, 2, 4, N'P00152', N'BARRA DE ALUMINIO DE GANCHO', N'', CAST(150.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-06 01:21:34.117' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (153, 2, 1, 3, N'P00153', N'BOTIQUIN ACRILICO', N'', CAST(5.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 1, 1, 1, CAST(N'2016-11-06 08:11:07.910' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (154, 2, 1, 4, N'P00154', N'MEDIDOR DE AIRE CAMION', N'', CAST(13.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-06 08:43:28.170' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (155, 1, 1, 1, N'P00155', N'FAROLAS', N'', CAST(5.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-06 14:45:30.040' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (156, 2, 1, 7, N'P00156', N'PARRILLA CHICA', N'', CAST(217.00 AS Decimal(5, 2)), CAST(320.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-08 15:54:18.663' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (157, 2, 1, 7, N'P00157', N'PARRILLA MEDIANA', N'', CAST(218.00 AS Decimal(5, 2)), CAST(350.00 AS Decimal(5, 2)), 1, 0, 0, CAST(N'2016-11-08 15:54:42.340' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (158, 2, 1, 7, N'P00158', N'LUZ DE FRENO DE 60 LED', N'', CAST(14.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-08 15:55:39.400' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (159, 2, 1, 7, N'P00159', N'PORTAPLACA DE MOTO', N'', CAST(15.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-08 15:56:10.580' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (160, 2, 3, 8, N'P00160', N'ESCARPINES JEBE RECICLADO', N'', CAST(6.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 4, 0, 0, CAST(N'2016-11-15 14:52:02.067' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (161, 2, 3, 8, N'P00161', N'COLETAS DE JEBE', N'JEBE RECICLADO', CAST(7.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 5, 0, 0, CAST(N'2016-11-15 14:54:02.133' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (162, 2, 3, 4, N'P00162', N'PISOS DE JEBE 4 PZ', N'', CAST(22.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-19 16:22:56.807' AS DateTime), 1, NULL, NULL, 0, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (163, 2, 3, 4, N'P00163', N'PEDALES DEPORTIVOS CARBON', N'', CAST(12.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 6, 2, 1, CAST(N'2016-11-19 16:25:17.377' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (164, 2, 3, 4, N'P00164', N'PEDALES DE ALUMINIO ROJO', N'ROJO', CAST(12.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 3, 1, 0, CAST(N'2016-11-19 16:26:49.163' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (165, 2, 1, 4, N'P00165', N'PEDALES DEPORTIVOS', N'', CAST(12.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 6, 2, 0, CAST(N'2016-11-19 17:20:06.887' AS DateTime), 1, NULL, NULL, 0, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (166, 2, 1, 4, N'P00166', N'PEDAL DE ALUMINIO COLOR NEGRO', N'', CAST(17.70 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 3, 1, 0, CAST(N'2016-11-19 17:23:41.483' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (167, 2, 1, 1, N'P00167', N'PEDALES DE ALUMINIO COLOR AZUL', N'', CAST(11.70 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 3, 0, 0, CAST(N'2016-11-19 17:30:54.060' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (170, 1, 1, 1, N'P00168', N'PRUEBA 2', N'', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-19 17:42:31.650' AS DateTime), 1, NULL, NULL, 0, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (171, 2, 3, 4, N'P00169', N'PAÑOS DE FIBRA', N'', CAST(2.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), 5, 1, 0, CAST(N'2016-11-19 17:50:14.807' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (172, 2, 3, 4, N'P00170', N'PISOS DE JEBE DE 4 PZ', N'', CAST(22.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 2, 1, 1, CAST(N'2016-11-19 18:01:41.500' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (173, 2, 3, 4, N'P00171', N'PISOS DE JEBE DE 3 PZ UNIVERSALES', N'', CAST(28.00 AS Decimal(5, 2)), CAST(50.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-19 18:02:24.607' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (174, 2, 3, 4, N'P00172', N'PISOS ALFOMBRADOS DE 5 PZ', N'', CAST(28.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 4, 1, 0, CAST(N'2016-11-19 18:03:18.510' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (175, 2, 3, 4, N'P00173', N'FOCO DE LED PARA SALON', N'', CAST(2.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 9, 1, 0, CAST(N'2016-11-19 18:03:56.817' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (176, 2, 2, 4, N'P00174', N'TAPASOL DE MAYA PEQUEÑOS', N'', CAST(2.50 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 6, 1, 0, CAST(N'2016-11-19 18:04:53.530' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (177, 2, 2, 4, N'P00175', N'TAPASOL TIPO PERSIANA', N'', CAST(11.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 1, 1, 0, CAST(N'2016-11-19 18:05:39.073' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (178, 2, 1, 4, N'P00176', N'ESPALDAR FRESCO IMITACION', N'', CAST(28.00 AS Decimal(5, 2)), CAST(45.00 AS Decimal(5, 2)), 11, 1, 0, CAST(N'2016-11-19 18:06:53.580' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (179, 2, 1, 4, N'P00177', N'EMBLEMA CROMADO DIABLITO', N'', CAST(2.50 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 3, 1, 0, CAST(N'2016-11-19 18:07:31.970' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (180, 2, 1, 4, N'P00178', N'EMBLEMA CROMADO PATITAS', N'', CAST(2.50 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 2, 1, 0, CAST(N'2016-11-19 18:09:02.940' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (181, 2, 6, 4, N'P00179', N'CINTA ROJA Y BLANCA', N'3M', CAST(6.00 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 23, 5, 2, CAST(N'2016-11-19 18:30:56.307' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (182, 2, 2, 4, N'P00180', N'ESPEJO LATERAL CON LUZ NEGRO', N'', CAST(31.00 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-26 13:40:46.203' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (183, 2, 1, 4, N'P00181', N'SEGURO DE ARO ANCHO', N'', CAST(12.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 5, 1, 1, CAST(N'2016-11-26 13:47:35.343' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (184, 2, 6, 1, N'P00182', N'TIRAS LED SILICONADAS ROJO', N'', CAST(5.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 4, 1, 1, CAST(N'2016-11-26 13:57:30.593' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (185, 2, 3, 1, N'P00183', N'test estable version', N'', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2016-11-26 14:09:39.910' AS DateTime), 1, NULL, NULL, 0, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (186, 2, 2, 1, N'P00184', N'COLETAS DE HILUX TRASEROS', N'', CAST(18.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 2, 0, 0, CAST(N'2016-11-29 17:34:43.487' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (187, 2, 2, 1, N'P00185', N'COLETAS DE HILUX DELANTEROS', N'', CAST(18.00 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 2, 1, 1, CAST(N'2016-11-29 17:35:25.543' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (188, 2, 2, 1, N'P00186', N'COLETAS DE PVC', N'', CAST(9.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8, 1, 1, CAST(N'2016-11-29 17:36:54.817' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (189, 2, 1, 1, N'P00187', N'CINTA REFLEXTIVA 3M VERDE LIMON', N'', CAST(7.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 41, 3, 1, CAST(N'2016-11-29 17:45:25.480' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (190, 2, 1, 1, N'P00188', N'CINTA REFLEXTIVA 3M NARANJA', N'', CAST(7.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 45, 4, 1, CAST(N'2016-11-29 17:45:59.937' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (191, 2, 1, 1, N'P00189', N'CINTA REFLEXTIVA 3M VERDE BLANCA', N'', CAST(6.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 45, 4, 1, CAST(N'2016-11-29 17:46:38.677' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (192, 2, 1, 1, N'P00190', N'CINTA REFLEXTIVA 3M  ROJO', N'', CAST(6.00 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 43, 4, 1, CAST(N'2016-11-29 17:46:58.550' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (193, 1, 1, 1, N'P00191', N'SERVICIO 0 REMACHE', N'', CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), 936, 0, 0, CAST(N'2016-11-30 12:06:09.997' AS DateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (194, 1, 1, 1, N'P00192', N'PORTACELULAR  MOD NUEVO', N'', CAST(9.00 AS Decimal(5, 2)), CAST(35.00 AS Decimal(5, 2)), 9, 3, 1, CAST(N'2016-12-07 11:38:34.093' AS DateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[Producto] ([Id_Prod], [Id_Cat_prod], [Id_Umed_prod], [Id_Proveedor_Producto], [Codigo_Prod], [Nombre_Prod], [Marca_Prod], [PrecioCompra_Prod], [Precio_Prod], [Stock_Prod], [StockProm_Prod], [StockMin_Prod], [FechCreacion_Prod], [UsuarioCreacion_Prod], [FechUpdate_Prod], [UsuarioUpdate_Prod], [Estado_Prod], [IdMaterial]) VALUES (195, 2, 3, 1, N'P00193', N'', N'', CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(5, 2)), 0, 0, 0, CAST(N'2017-06-18 23:02:38.357' AS DateTime), 1, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (1, N'PROV01', N'AVIL', N'20556401811', N'AV AVIACION 871 LIMA - LA VICTORIA', N'        ', N'         ', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (2, N'PROV02', N'KARYSA', N'10460758764', N'JR FRANCIA Nº 1707 URB SAN PABLO - LIMA LA VICTORIA', N'95699097', N'975711205', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (3, N'PROV03', N'DESCONOCIDO', N'           ', N'', N'        ', N'         ', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (4, N'PROV04', N'A R IMPORT SAC', N'20535939251', N'JR CARLOS GUTIERRES 489 LA VICTORIA LIMA', N'4284832 ', N'994553796', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (5, N'PROV05', N'GROUP TITO', N'20563661489', N'AV AVIACION Nº 971 LA VICTORIA LIMA', N'01 32554', N'         ', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (6, N'PROV06', N'ROMA IMPORT', N'20514432768', N'AV AVIACION 895 LA VICTORIA LIMA', N'94508924', N'         ', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (7, N'PROV07', N'SAFARI SAC', N'20509622451', N'AV. AVIACION 1070 URB LA POLVORA LA VICTORIA LIMA', N'        ', N'         ', N'', 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Cod_Proveedor], [RazSocial_Proveedor], [Ruc_Proveedor], [Direccion_Proveedor], [Telefono_Proveedor], [Celular_Proveedor], [Correo_Proveedor], [Estado_Proveedor]) VALUES (8, N'PROV08', N'LEONCIO TIRADO CHAVEZ', N'           ', N'', N'96981478', N'         ', N'', 1)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
SET IDENTITY_INSERT [dbo].[Serie] ON 

INSERT [dbo].[Serie] ([Id_Serie], [Id_Sucursal_Serie], [Id_TipCom_Serie], [Numero_Serie]) VALUES (1, 1, 1, N'0001')
INSERT [dbo].[Serie] ([Id_Serie], [Id_Sucursal_Serie], [Id_TipCom_Serie], [Numero_Serie]) VALUES (2, 1, 5, N'0001')
SET IDENTITY_INSERT [dbo].[Serie] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([Id_Suc], [Codigo_Suc], [Direccion_Suc], [Estado_Suc]) VALUES (1, N'SUC01', N'AV FEDERICO VILLAREAL 1048 INT. "C"', 1)
INSERT [dbo].[Sucursal] ([Id_Suc], [Codigo_Suc], [Direccion_Suc], [Estado_Suc]) VALUES (2, N'SUC02', N'AV FEDERICO VILLAREAL 594 TRUJILLO LA LIBERTAD', 1)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[TipDocumento] ON 

INSERT [dbo].[TipDocumento] ([Id_TipDoc], [Nombre_TipDoc], [Abreviatura_TipDoc]) VALUES (1, N'LIBRETA ELECTORAL O DNI', N'L.E / DNI')
INSERT [dbo].[TipDocumento] ([Id_TipDoc], [Nombre_TipDoc], [Abreviatura_TipDoc]) VALUES (2, N'CARNET DE EXTRANJERIA', N'CEX')
INSERT [dbo].[TipDocumento] ([Id_TipDoc], [Nombre_TipDoc], [Abreviatura_TipDoc]) VALUES (3, N'REG. UNICO DE CONTRIBUYENTES', N'RUC')
INSERT [dbo].[TipDocumento] ([Id_TipDoc], [Nombre_TipDoc], [Abreviatura_TipDoc]) VALUES (4, N'PASAPORTE', N'PASAPORTE')
INSERT [dbo].[TipDocumento] ([Id_TipDoc], [Nombre_TipDoc], [Abreviatura_TipDoc]) VALUES (5, N'PART. DE NACIMIENTO-IDENTIDAD', N'P. NAC.')
INSERT [dbo].[TipDocumento] ([Id_TipDoc], [Nombre_TipDoc], [Abreviatura_TipDoc]) VALUES (6, N'OTROS', N'OTROS')
SET IDENTITY_INSERT [dbo].[TipDocumento] OFF
SET IDENTITY_INSERT [dbo].[TipoComprobante] ON 

INSERT [dbo].[TipoComprobante] ([Id_TipCom], [Codigo_TipCom], [Id_TipMov_TipCom], [Nombre_TipCom], [Descripcion_TipCom]) VALUES (1, N'CV001', 1, N'Boleta', N'')
INSERT [dbo].[TipoComprobante] ([Id_TipCom], [Codigo_TipCom], [Id_TipMov_TipCom], [Nombre_TipCom], [Descripcion_TipCom]) VALUES (2, N'CV002', 1, N'Factura', N'')
INSERT [dbo].[TipoComprobante] ([Id_TipCom], [Codigo_TipCom], [Id_TipMov_TipCom], [Nombre_TipCom], [Descripcion_TipCom]) VALUES (3, N'CV003', 2, N'Nota de credito', N'La devolución que hiciera el cliente de los bienes que le vendieron, por estar defectuosos o en general, cualquier descuento que se debiera realizar de alguna venta efectuada, para la cual ya existe una factura.')
INSERT [dbo].[TipoComprobante] ([Id_TipCom], [Codigo_TipCom], [Id_TipMov_TipCom], [Nombre_TipCom], [Descripcion_TipCom]) VALUES (4, N'CV004', 1, N'Nota de cargo', N'un cargo por algún servicio extra que se realice, algún aumento en el precio previamente acordado o cualquier aumento que se debiera realizar sobre alguna venta efectuada para la cual existe ya una factura.')
INSERT [dbo].[TipoComprobante] ([Id_TipCom], [Codigo_TipCom], [Id_TipMov_TipCom], [Nombre_TipCom], [Descripcion_TipCom]) VALUES (5, N'CV004', 1, N'Nota de venta', N'Ventas sin emision de comprobante')
SET IDENTITY_INSERT [dbo].[TipoComprobante] OFF
SET IDENTITY_INSERT [dbo].[TipoMovimiento] ON 

INSERT [dbo].[TipoMovimiento] ([Id_TipMov], [Identificador_TipDoc], [Descripcion_TipDoc]) VALUES (1, N'I', N'Todos los ingresos de dinero')
INSERT [dbo].[TipoMovimiento] ([Id_TipMov], [Identificador_TipDoc], [Descripcion_TipDoc]) VALUES (2, N'E', N'Todos los egresos de dinero')
SET IDENTITY_INSERT [dbo].[TipoMovimiento] OFF
SET IDENTITY_INSERT [dbo].[TipoPago] ON 

INSERT [dbo].[TipoPago] ([Id_TipPago], [Descripcion_TipPago]) VALUES (1, N'Pago en efectivo                                  ')
INSERT [dbo].[TipoPago] ([Id_TipPago], [Descripcion_TipPago]) VALUES (2, N'Pago con tarjeta de crédito                       ')
INSERT [dbo].[TipoPago] ([Id_TipPago], [Descripcion_TipPago]) VALUES (3, N'Pago contra reembolso                             ')
INSERT [dbo].[TipoPago] ([Id_TipPago], [Descripcion_TipPago]) VALUES (4, N'Ingreso en cuenta                                 ')
SET IDENTITY_INSERT [dbo].[TipoPago] OFF
SET IDENTITY_INSERT [dbo].[UnidadMedida] ON 

INSERT [dbo].[UnidadMedida] ([Id_Umed], [Codigo_Umed], [Descripcion_Umed], [Abreviatura_Umed], [Estado_Umed]) VALUES (1, N'UM001', N'UNIDADES', N'UNI                 ', 1)
INSERT [dbo].[UnidadMedida] ([Id_Umed], [Codigo_Umed], [Descripcion_Umed], [Abreviatura_Umed], [Estado_Umed]) VALUES (2, N'UM002', N'PARES', N'PARES               ', 1)
INSERT [dbo].[UnidadMedida] ([Id_Umed], [Codigo_Umed], [Descripcion_Umed], [Abreviatura_Umed], [Estado_Umed]) VALUES (3, N'UM003', N'JUEGO', N'JGO                 ', 1)
INSERT [dbo].[UnidadMedida] ([Id_Umed], [Codigo_Umed], [Descripcion_Umed], [Abreviatura_Umed], [Estado_Umed]) VALUES (4, N'UM004', N'ROLLO', N'ROLLO               ', 1)
INSERT [dbo].[UnidadMedida] ([Id_Umed], [Codigo_Umed], [Descripcion_Umed], [Abreviatura_Umed], [Estado_Umed]) VALUES (5, N'UM005', N'PLANCHA', N'PLANCHA             ', 1)
INSERT [dbo].[UnidadMedida] ([Id_Umed], [Codigo_Umed], [Descripcion_Umed], [Abreviatura_Umed], [Estado_Umed]) VALUES (6, N'UM006', N'METRO', N'METRO               ', 1)
SET IDENTITY_INSERT [dbo].[UnidadMedida] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id_Usuario], [Codigo_Usuario], [Id_nivelAcc_Usuario], [Id_Suc_Usuario], [Nombre_Usuario], [Login_Usuario], [Password_Usuario], [Telefono_Usuario], [Celular_Usuario], [Correo_Usuario], [Estado_Usuario], [Expiracion_Usuario], [FechCreacion_Usuario], [UsuarioCreacion_Usuario], [FechUpdate_Usuario], [UsuarioUpdate_Usuario]) VALUES (1, N'U001', 1, 1, N'Elvis Abel Cotrina Evangelista', N'master  ', 0x01000000146FEEC5B0F4A5099BC222FDCA034A1B36810F1C32081AF11E0B660ED698110E, NULL, NULL, NULL, 1, CAST(N'2020-01-10 00:00:00.000' AS DateTime), CAST(N'2016-11-05 13:51:27.530' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id_Usuario], [Codigo_Usuario], [Id_nivelAcc_Usuario], [Id_Suc_Usuario], [Nombre_Usuario], [Login_Usuario], [Password_Usuario], [Telefono_Usuario], [Celular_Usuario], [Correo_Usuario], [Estado_Usuario], [Expiracion_Usuario], [FechCreacion_Usuario], [UsuarioCreacion_Usuario], [FechUpdate_Usuario], [UsuarioUpdate_Usuario]) VALUES (2, N'U002', 2, 1, N'KENYI', N'KENYI   ', 0x010000002A2605818FD7EED939218D4F32695D4CF07E7FB1C967A464B6099FEA08B17A23, N'        ', N'         ', N'@default.com', 1, CAST(N'2020-01-14 00:00:00.000' AS DateTime), CAST(N'2016-11-05 14:00:47.013' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Usuario] ([Id_Usuario], [Codigo_Usuario], [Id_nivelAcc_Usuario], [Id_Suc_Usuario], [Nombre_Usuario], [Login_Usuario], [Password_Usuario], [Telefono_Usuario], [Celular_Usuario], [Correo_Usuario], [Estado_Usuario], [Expiracion_Usuario], [FechCreacion_Usuario], [UsuarioCreacion_Usuario], [FechUpdate_Usuario], [UsuarioUpdate_Usuario]) VALUES (3, N'U003', 1, 2, N'COLABORADOR LOCAL 2', N'david   ', 0x01000000EB05E95A9CDB701738D069226B83F8CDBF1C90B741AB52550E827AF30B9F04EF, N'        ', N'         ', N'@default.com@default.com', 1, CAST(N'2019-11-21 00:00:00.000' AS DateTime), CAST(N'2016-11-26 14:34:03.173' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Usuario] ([Id_Usuario], [Codigo_Usuario], [Id_nivelAcc_Usuario], [Id_Suc_Usuario], [Nombre_Usuario], [Login_Usuario], [Password_Usuario], [Telefono_Usuario], [Celular_Usuario], [Correo_Usuario], [Estado_Usuario], [Expiracion_Usuario], [FechCreacion_Usuario], [UsuarioCreacion_Usuario], [FechUpdate_Usuario], [UsuarioUpdate_Usuario]) VALUES (4, N'U004', 1, 2, N'', N'        ', 0x0100000024B5CA36DA308E6F4CC04A0303359AC3C5A7706C7F0EFDD3, N'        ', N'         ', N'@default.com', 0, CAST(N'2016-11-28 00:00:00.000' AS DateTime), CAST(N'2016-11-28 06:23:33.487' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Usuario] ([Id_Usuario], [Codigo_Usuario], [Id_nivelAcc_Usuario], [Id_Suc_Usuario], [Nombre_Usuario], [Login_Usuario], [Password_Usuario], [Telefono_Usuario], [Celular_Usuario], [Correo_Usuario], [Estado_Usuario], [Expiracion_Usuario], [FechCreacion_Usuario], [UsuarioCreacion_Usuario], [FechUpdate_Usuario], [UsuarioUpdate_Usuario]) VALUES (5, N'U005', 1, 2, N'', N'        ', 0x010000000C854CEC2952AD511E80E0A69E0479C449C9A96A544EC99E, N'        ', N'         ', N'@default.com', 0, CAST(N'2016-11-28 00:00:00.000' AS DateTime), CAST(N'2016-11-28 06:26:18.187' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Usuario] ([Id_Usuario], [Codigo_Usuario], [Id_nivelAcc_Usuario], [Id_Suc_Usuario], [Nombre_Usuario], [Login_Usuario], [Password_Usuario], [Telefono_Usuario], [Celular_Usuario], [Correo_Usuario], [Estado_Usuario], [Expiracion_Usuario], [FechCreacion_Usuario], [UsuarioCreacion_Usuario], [FechUpdate_Usuario], [UsuarioUpdate_Usuario]) VALUES (6, N'U006', 2, 1, N'DENNIS ECHEVERRIA', N'MASTEREU', 0x01000000688643A8BC268DF37C52C25F0E6D5E4F760B97690FD3E0222CA7DCE4CD2DC65DE40F962332BB2CD4, N'        ', N'         ', N'@default.com', 1, CAST(N'2017-07-22 00:00:00.000' AS DateTime), CAST(N'2016-12-17 11:34:59.570' AS DateTime), 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (1, N'V0000000001', 1, 1, 1, 1, 1, 1, N'0001', N'000001', 0, CAST(N'2016-11-05 14:12:56.217' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (2, N'V0000000002', 2, 1, 1, 5, 1, 1, N'0001', N'000001', 0, CAST(N'2016-11-05 19:50:16.507' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (3, N'V0000000003', 2, 1, 1, 5, 1, 1, N'0001', N'000002', 0, CAST(N'2016-11-19 10:35:52.790' AS DateTime), N'A', CAST(0.00 AS Decimal(10, 2)), N'descripcion breve')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (4, N'V0000000004', 2, 1, 1, 5, 1, 1, N'0001', N'000003', 0, CAST(N'2016-11-19 11:05:03.703' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (5, N'V0000000005', 2, 1, 1, 5, 1, 1, N'0001', N'000004', 0, CAST(N'2016-11-19 11:12:47.307' AS DateTime), N'E', CAST(23.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (6, N'V0000000006', 2, 1, 1, 5, 1, 1, N'0001', N'000005', 0, CAST(N'2016-11-19 11:18:19.000' AS DateTime), N'A', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (7, N'V0000000007', 2, 1, 1, 5, 1, 1, N'0001', N'000006', 0, CAST(N'2016-11-19 13:03:59.590' AS DateTime), N'E', CAST(31.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (8, N'V0000000008', 2, 1, 1, 5, 1, 1, N'0001', N'000007', 0, CAST(N'2016-11-19 18:16:45.350' AS DateTime), N'E', CAST(23.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (9, N'V0000000009', 2, 1, 1, 5, 1, 1, N'0001', N'000008', 0, CAST(N'2016-11-19 18:23:19.430' AS DateTime), N'E', CAST(26.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (10, N'V0000000010', 2, 1, 1, 5, 1, 1, N'0001', N'000009', 0, CAST(N'2016-11-19 18:26:05.273' AS DateTime), N'E', CAST(18.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (11, N'V0000000011', 2, 1, 1, 5, 1, 1, N'0001', N'000010', 0, CAST(N'2016-11-19 18:29:19.167' AS DateTime), N'E', CAST(15.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (12, N'V0000000012', 2, 1, 1, 5, 1, 1, N'0001', N'000011', 0, CAST(N'2016-11-19 18:32:51.657' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (13, N'V0000000013', 2, 1, 1, 5, 1, 1, N'0001', N'000012', 0, CAST(N'2016-11-19 18:35:29.550' AS DateTime), N'E', CAST(17.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (14, N'V0000000014', 2, 1, 1, 5, 1, 1, N'0001', N'000013', 0, CAST(N'2016-11-19 18:43:43.787' AS DateTime), N'E', CAST(27.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (15, N'V0000000015', 2, 1, 1, 5, 1, 1, N'0001', N'000014', 0, CAST(N'2016-11-19 18:46:22.837' AS DateTime), N'E', CAST(13.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (16, N'V0000000016', 2, 1, 1, 5, 1, 1, N'0001', N'000015', 0, CAST(N'2016-11-19 18:52:14.000' AS DateTime), N'E', CAST(10.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (17, N'V0000000017', 2, 1, 1, 5, 1, 1, N'0001', N'000016', 0, CAST(N'2016-11-21 21:43:08.120' AS DateTime), N'E', CAST(8.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (18, N'V0000000018', 2, 1, 1, 5, 1, 1, N'0001', N'000017', 0, CAST(N'2016-11-21 21:45:46.767' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (19, N'V0000000019', 2, 1, 1, 5, 1, 1, N'0001', N'000018', 0, CAST(N'2016-11-22 13:49:41.133' AS DateTime), N'E', CAST(24.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (20, N'V0000000020', 2, 1, 1, 5, 1, 1, N'0001', N'000019', 0, CAST(N'2016-11-23 19:42:45.170' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (21, N'V0000000021', 2, 1, 1, 5, 1, 1, N'0001', N'000020', 0, CAST(N'2016-11-24 18:16:17.787' AS DateTime), N'E', CAST(19.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (22, N'V0000000022', 2, 1, 1, 5, 1, 1, N'0001', N'000021', 0, CAST(N'2016-11-24 18:23:54.167' AS DateTime), N'E', CAST(29.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (23, N'V0000000023', 2, 1, 1, 5, 1, 1, N'0001', N'000022', 0, CAST(N'2016-11-24 18:25:01.403' AS DateTime), N'E', CAST(15.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (24, N'V0000000024', 2, 1, 1, 5, 1, 1, N'0001', N'000023', 0, CAST(N'2016-11-24 18:29:56.780' AS DateTime), N'A', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (25, N'V0000000025', 2, 1, 1, 5, 1, 1, N'0001', N'000024', 0, CAST(N'2016-11-24 18:35:04.163' AS DateTime), N'E', CAST(13.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (26, N'V0000000026', 2, 1, 1, 5, 1, 1, N'0001', N'000025', 0, CAST(N'2016-11-24 18:37:20.787' AS DateTime), N'E', CAST(15.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (27, N'V0000000027', 2, 1, 1, 5, 1, 1, N'0001', N'000026', 0, CAST(N'2016-11-25 22:18:43.123' AS DateTime), N'E', CAST(23.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (28, N'V0000000028', 2, 1, 1, 5, 1, 1, N'0001', N'000027', 0, CAST(N'2016-11-25 22:20:48.870' AS DateTime), N'E', CAST(32.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (29, N'V0000000029', 2, 1, 1, 5, 1, 1, N'0001', N'000028', 0, CAST(N'2016-11-25 22:29:01.420' AS DateTime), N'E', CAST(24.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (30, N'V0000000030', 2, 1, 1, 5, 1, 1, N'0001', N'000029', 0, CAST(N'2016-11-25 22:35:52.810' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (31, N'V0000000031', 2, 1, 1, 5, 1, 1, N'0001', N'000030', 0, CAST(N'2016-11-25 22:37:00.757' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (32, N'V0000000032', 2, 1, 2, 5, 1, 1, N'0001', N'000031', 0, CAST(N'2016-11-28 06:48:29.047' AS DateTime), N'A', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (33, N'V0000000033', 2, 1, 2, 5, 1, 1, N'0001', N'000032', 0, CAST(N'2016-11-28 06:52:42.340' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (34, N'V0000000034', 2, 1, 2, 5, 1, 1, N'0001', N'000033', 0, CAST(N'2016-11-28 10:07:30.620' AS DateTime), N'E', CAST(3.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (35, N'V0000000035', 2, 1, 2, 5, 1, 1, N'0001', N'000034', 0, CAST(N'2016-11-28 10:17:41.900' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (36, N'V0000000036', 2, 1, 2, 5, 1, 1, N'0001', N'000035', 0, CAST(N'2016-11-28 10:20:13.177' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (37, N'V0000000037', 2, 1, 2, 5, 1, 1, N'0001', N'000036', 0, CAST(N'2016-11-28 10:43:10.783' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (38, N'V0000000038', 2, 1, 2, 5, 1, 1, N'0001', N'000037', 0, CAST(N'2016-11-28 12:01:53.773' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (39, N'V0000000039', 2, 1, 2, 5, 1, 1, N'0001', N'000038', 0, CAST(N'2016-11-28 12:52:10.080' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (40, N'V0000000040', 2, 1, 2, 5, 1, 1, N'0001', N'000039', 0, CAST(N'2016-11-28 12:53:06.050' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (41, N'V0000000041', 2, 1, 2, 5, 1, 1, N'0001', N'000040', 0, CAST(N'2016-11-28 13:31:32.763' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (42, N'V0000000042', 2, 1, 2, 5, 1, 1, N'0001', N'000041', 0, CAST(N'2016-11-28 14:02:38.303' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (43, N'V0000000043', 2, 1, 2, 5, 1, 1, N'0001', N'000042', 0, CAST(N'2016-11-28 16:03:46.957' AS DateTime), N'E', CAST(1.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (44, N'V0000000044', 2, 1, 2, 5, 1, 1, N'0001', N'000043', 0, CAST(N'2016-11-29 08:53:47.543' AS DateTime), N'E', CAST(10.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (45, N'V0000000045', 2, 1, 2, 5, 1, 1, N'0001', N'000044', 0, CAST(N'2016-11-29 08:54:57.627' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (46, N'V0000000046', 2, 1, 2, 5, 1, 1, N'0001', N'000045', 0, CAST(N'2016-11-29 08:56:25.597' AS DateTime), N'E', CAST(7.00 AS Decimal(10, 2)), N'solo una unidad')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (47, N'V0000000047', 2, 1, 2, 5, 1, 1, N'0001', N'000046', 0, CAST(N'2016-11-29 10:44:59.500' AS DateTime), N'E', CAST(1.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (48, N'V0000000048', 2, 1, 2, 5, 1, 1, N'0001', N'000047', 0, CAST(N'2016-11-29 11:46:30.020' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (49, N'V0000000049', 2, 1, 2, 5, 1, 1, N'0001', N'000048', 0, CAST(N'2016-11-29 11:47:09.350' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (50, N'V0000000050', 2, 1, 2, 5, 1, 1, N'0001', N'000049', 0, CAST(N'2016-11-29 15:31:26.230' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (51, N'V0000000051', 2, 1, 1, 5, 1, 1, N'0001', N'000050', 0, CAST(N'2016-11-29 17:40:53.707' AS DateTime), N'E', CAST(16.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (52, N'V0000000052', 2, 1, 1, 5, 1, 1, N'0001', N'000051', 0, CAST(N'2016-11-29 17:41:25.433' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (53, N'V0000000053', 2, 1, 1, 5, 1, 1, N'0001', N'000052', 0, CAST(N'2016-11-29 17:44:01.177' AS DateTime), N'E', CAST(4.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (54, N'V0000000054', 2, 3, 1, 5, 1, 1, N'0001', N'000053', 0, CAST(N'2016-11-30 08:23:34.667' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (55, N'V0000000055', 2, 3, 1, 5, 1, 1, N'0001', N'000054', 0, CAST(N'2016-11-30 08:47:25.233' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (56, N'V0000000056', 2, 1, 1, 5, 1, 1, N'0001', N'000055', 0, CAST(N'2016-11-30 11:21:02.623' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (57, N'V0000000057', 2, 1, 1, 5, 1, 1, N'0001', N'000056', 0, CAST(N'2016-11-30 11:56:13.823' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (58, N'V0000000058', 2, 1, 1, 5, 1, 1, N'0001', N'000057', 0, CAST(N'2016-11-30 11:57:35.260' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (59, N'V0000000059', 2, 1, 1, 5, 1, 1, N'0001', N'000058', 0, CAST(N'2016-11-30 11:58:07.850' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (60, N'V0000000060', 2, 1, 1, 5, 1, 1, N'0001', N'000059', 0, CAST(N'2016-11-30 12:04:14.117' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'SOLO ES MEDIO METRO')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (61, N'V0000000061', 2, 1, 1, 5, 1, 1, N'0001', N'000060', 0, CAST(N'2016-11-30 12:07:38.003' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'REMACHES')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (62, N'V0000000062', 2, 1, 1, 5, 1, 1, N'0001', N'000061', 0, CAST(N'2016-11-30 12:46:18.350' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (63, N'V0000000063', 2, 3, 2, 5, 1, 1, N'0001', N'000062', 0, CAST(N'2016-11-30 12:53:00.980' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (64, N'V0000000064', 2, 1, 1, 5, 1, 1, N'0001', N'000063', 0, CAST(N'2016-11-30 13:32:54.203' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'SERVICIO LIMPIEZA DE ESTIKER')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (65, N'V0000000065', 2, 3, 2, 5, 1, 1, N'0001', N'000064', 0, CAST(N'2016-11-30 13:34:53.133' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (66, N'V0000000066', 2, 3, 2, 5, 1, 1, N'0001', N'000065', 0, CAST(N'2016-11-30 14:12:05.050' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (67, N'V0000000067', 2, 1, 1, 5, 1, 1, N'0001', N'000066', 0, CAST(N'2016-11-30 14:32:48.833' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'REMACHES')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (68, N'V0000000068', 2, 3, 2, 5, 1, 1, N'0001', N'000067', 0, CAST(N'2016-11-30 15:28:41.073' AS DateTime), N'E', CAST(10.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (69, N'V0000000069', 2, 3, 2, 5, 1, 1, N'0001', N'000068', 0, CAST(N'2016-11-30 15:29:31.730' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (70, N'V0000000070', 2, 3, 2, 5, 1, 1, N'0001', N'000069', 0, CAST(N'2016-11-30 15:30:11.083' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (71, N'V0000000071', 2, 3, 2, 5, 1, 1, N'0001', N'000070', 0, CAST(N'2016-11-30 15:32:28.493' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (72, N'V0000000072', 2, 1, 1, 5, 1, 1, N'0001', N'000071', 0, CAST(N'2016-12-01 09:58:33.487' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (73, N'V0000000073', 2, 3, 2, 5, 1, 1, N'0001', N'000072', 0, CAST(N'2016-12-01 09:59:26.317' AS DateTime), N'E', CAST(3.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (74, N'V0000000074', 2, 3, 2, 5, 1, 1, N'0001', N'000073', 0, CAST(N'2016-12-01 10:46:07.977' AS DateTime), N'E', CAST(1.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (75, N'V0000000075', 2, 3, 2, 5, 1, 1, N'0001', N'000074', 0, CAST(N'2016-12-01 10:46:40.960' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (76, N'V0000000076', 2, 3, 2, 5, 1, 1, N'0001', N'000075', 0, CAST(N'2016-12-01 12:51:12.470' AS DateTime), N'E', CAST(10.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (77, N'V0000000077', 2, 3, 2, 5, 1, 1, N'0001', N'000076', 0, CAST(N'2016-12-01 12:51:40.207' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (78, N'V0000000078', 2, 3, 2, 5, 1, 1, N'0001', N'000077', 0, CAST(N'2016-12-01 13:38:37.967' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (79, N'V0000000079', 2, 1, 1, 5, 1, 2, N'0001', N'000078', 0, CAST(N'2016-12-01 14:26:17.293' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'VIS')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (80, N'V0000000080', 2, 3, 2, 5, 1, 1, N'0001', N'000079', 0, CAST(N'2016-12-01 15:05:04.607' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (81, N'V0000000081', 2, 3, 2, 5, 1, 1, N'0001', N'000080', 0, CAST(N'2016-12-02 09:07:12.053' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (82, N'V0000000082', 2, 3, 2, 5, 1, 1, N'0001', N'000081', 0, CAST(N'2016-12-02 09:07:55.020' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (83, N'V0000000083', 2, 3, 2, 5, 1, 1, N'0001', N'000082', 0, CAST(N'2016-12-02 09:13:08.870' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (84, N'V0000000084', 2, 1, 1, 5, 1, 1, N'0001', N'000083', 0, CAST(N'2016-12-02 13:31:29.397' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (85, N'V0000000085', 2, 3, 2, 5, 1, 1, N'0001', N'000084', 0, CAST(N'2016-12-02 13:38:55.260' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (86, N'V0000000086', 2, 3, 2, 5, 1, 1, N'0001', N'000085', 0, CAST(N'2016-12-02 13:43:42.107' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (87, N'V0000000087', 2, 3, 2, 5, 1, 1, N'0001', N'000086', 0, CAST(N'2016-12-02 14:27:21.540' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (88, N'V0000000088', 2, 3, 2, 5, 1, 1, N'0001', N'000087', 0, CAST(N'2016-12-02 15:30:12.277' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (89, N'V0000000089', 2, 1, 1, 5, 1, 1, N'0001', N'000088', 0, CAST(N'2016-12-02 16:43:22.063' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (90, N'V0000000090', 2, 3, 2, 5, 1, 1, N'0001', N'000089', 0, CAST(N'2016-12-03 08:04:16.970' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (91, N'V0000000091', 2, 3, 2, 5, 1, 1, N'0001', N'000090', 0, CAST(N'2016-12-03 08:06:59.540' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (92, N'V0000000092', 2, 3, 2, 5, 1, 1, N'0001', N'000091', 0, CAST(N'2016-12-03 08:08:26.780' AS DateTime), N'E', CAST(10.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (93, N'V0000000093', 2, 3, 2, 5, 1, 1, N'0001', N'000092', 0, CAST(N'2016-12-03 09:50:34.207' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (94, N'V0000000094', 2, 3, 2, 5, 1, 1, N'0001', N'000093', 0, CAST(N'2016-12-03 09:51:15.537' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (95, N'V0000000095', 2, 3, 2, 5, 1, 1, N'0001', N'000094', 0, CAST(N'2016-12-03 09:53:01.327' AS DateTime), N'E', CAST(15.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (96, N'V0000000096', 2, 3, 2, 5, 1, 1, N'0001', N'000095', 0, CAST(N'2016-12-03 10:16:19.850' AS DateTime), N'E', CAST(3.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (97, N'V0000000097', 2, 3, 2, 5, 1, 1, N'0001', N'000096', 0, CAST(N'2016-12-03 11:38:55.583' AS DateTime), N'E', CAST(3.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (98, N'V0000000098', 2, 3, 2, 5, 1, 1, N'0001', N'000097', 0, CAST(N'2016-12-03 14:29:23.617' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (99, N'V0000000099', 2, 1, 1, 5, 1, 1, N'0001', N'000098', 0, CAST(N'2016-12-05 06:27:18.373' AS DateTime), N'E', CAST(6.00 AS Decimal(10, 2)), N'')
GO
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (100, N'V0000000100', 2, 3, 2, 5, 1, 1, N'0001', N'000099', 0, CAST(N'2016-12-05 07:59:48.053' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (101, N'V0000000101', 2, 3, 2, 5, 1, 1, N'0001', N'000100', 0, CAST(N'2016-12-05 08:11:01.793' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (102, N'V0000000102', 2, 1, 1, 5, 1, 1, N'0001', N'000101', 0, CAST(N'2016-12-05 08:48:11.110' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (103, N'V0000000103', 2, 1, 1, 5, 1, 1, N'0001', N'000102', 0, CAST(N'2016-12-05 08:49:32.817' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (104, N'V0000000104', 2, 1, 1, 5, 1, 1, N'0001', N'000103', 0, CAST(N'2016-12-05 08:51:08.120' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (105, N'V0000000105', 2, 3, 2, 5, 1, 1, N'0001', N'000104', 0, CAST(N'2016-12-05 10:46:17.633' AS DateTime), N'E', CAST(7.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (106, N'V0000000106', 2, 3, 2, 5, 1, 1, N'0001', N'000105', 0, CAST(N'2016-12-05 10:47:18.373' AS DateTime), N'E', CAST(3.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (107, N'V0000000107', 2, 1, 1, 5, 1, 1, N'0001', N'000106', 0, CAST(N'2016-12-05 16:03:12.130' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (108, N'V0000000108', 2, 3, 2, 5, 1, 1, N'0001', N'000107', 0, CAST(N'2016-12-06 09:06:38.027' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (109, N'V0000000109', 2, 3, 2, 5, 1, 1, N'0001', N'000108', 0, CAST(N'2016-12-06 09:22:12.963' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (110, N'V0000000110', 2, 3, 2, 5, 1, 1, N'0001', N'000109', 0, CAST(N'2016-12-06 11:26:29.123' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (111, N'V0000000111', 2, 3, 2, 5, 1, 1, N'0001', N'000110', 0, CAST(N'2016-12-06 13:07:23.123' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (112, N'V0000000112', 2, 1, 1, 5, 1, 1, N'0001', N'000111', 0, CAST(N'2016-12-06 13:46:36.863' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (113, N'V0000000113', 2, 1, 1, 5, 1, 1, N'0001', N'000112', 0, CAST(N'2016-12-06 14:39:39.630' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (114, N'V0000000114', 2, 1, 1, 5, 1, 1, N'0001', N'000113', 0, CAST(N'2016-12-06 14:42:36.853' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (115, N'V0000000115', 2, 1, 1, 5, 1, 1, N'0001', N'000114', 0, CAST(N'2016-12-07 06:38:38.970' AS DateTime), N'E', CAST(7.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (116, N'V0000000116', 2, 1, 1, 5, 1, 1, N'0001', N'000115', 0, CAST(N'2016-12-07 10:30:51.797' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (117, N'V0000000117', 2, 3, 2, 5, 1, 1, N'0001', N'000116', 0, CAST(N'2016-12-07 12:33:23.367' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (118, N'V0000000118', 2, 3, 2, 5, 1, 1, N'0001', N'000117', 0, CAST(N'2016-12-07 13:26:43.110' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (119, N'V0000000119', 2, 3, 2, 5, 1, 1, N'0001', N'000118', 0, CAST(N'2016-12-07 13:27:34.450' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (120, N'V0000000120', 2, 1, 1, 5, 1, 1, N'0001', N'000119', 0, CAST(N'2016-12-07 13:34:49.137' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (121, N'V0000000121', 2, 1, 1, 5, 1, 1, N'0001', N'000120', 0, CAST(N'2016-12-07 13:39:26.610' AS DateTime), N'E', CAST(1.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (122, N'V0000000122', 2, 1, 1, 5, 1, 1, N'0001', N'000121', 0, CAST(N'2016-12-07 13:43:59.213' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (123, N'V0000000123', 2, 1, 1, 5, 1, 1, N'0001', N'000122', 0, CAST(N'2016-12-07 15:21:17.293' AS DateTime), N'E', CAST(5.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (124, N'V0000000124', 2, 3, 2, 5, 1, 1, N'0001', N'000123', 0, CAST(N'2016-12-07 15:44:49.370' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (125, N'V0000000125', 2, 1, 1, 5, 1, 1, N'0001', N'000124', 0, CAST(N'2016-12-08 07:34:56.540' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (126, N'V0000000126', 2, 1, 1, 5, 1, 1, N'0001', N'000125', 0, CAST(N'2016-12-08 07:35:23.820' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (127, N'V0000000127', 2, 3, 2, 5, 1, 1, N'0001', N'000126', 0, CAST(N'2016-12-08 10:25:09.167' AS DateTime), N'E', CAST(2.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (128, N'V0000000128', 2, 3, 2, 5, 1, 1, N'0001', N'000127', 0, CAST(N'2016-12-08 10:25:56.023' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (129, N'V0000000129', 2, 3, 2, 5, 1, 1, N'0001', N'000128', 0, CAST(N'2016-12-08 10:31:19.090' AS DateTime), N'E', CAST(6.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (130, N'V0000000130', 2, 3, 2, 5, 1, 1, N'0001', N'000129', 0, CAST(N'2016-12-08 10:55:34.130' AS DateTime), N'E', CAST(3.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (131, N'V0000000131', 2, 3, 2, 5, 1, 1, N'0001', N'000130', 0, CAST(N'2016-12-08 13:16:08.553' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (132, N'V0000000132', 2, 1, 1, 5, 1, 1, N'0001', N'000131', 0, CAST(N'2016-12-08 14:19:09.563' AS DateTime), N'E', CAST(0.00 AS Decimal(10, 2)), N'')
INSERT [dbo].[Venta] ([Id_Venta], [Codigo_Venta], [Id_Cliente_Venta], [Id_Usuario_Venta], [Id_Suc_Venta], [Id_TipCom_Venta], [Id_Moneda_Venta], [Id_TipPago_Venta], [Serie_Venta], [Correlativo_Venta], [Igv_Venta], [FechaVenta], [Estado_Venta], [Descuento_Venta], [Desc_Venta]) VALUES (133, N'V0000000133', 2, 1, 1, 1, 1, 1, N'0001', N'000002', 0, CAST(N'2017-06-18 23:07:13.597' AS DateTime), N'A', CAST(0.00 AS Decimal(10, 2)), N'')
SET IDENTITY_INSERT [dbo].[Venta] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [iNombre_Cliente]    Script Date: 29/09/2017 22:16:08 ******/
CREATE NONCLUSTERED INDEX [iNombre_Cliente] ON [dbo].[Cliente]
(
	[Nombre_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [iNumeroDoc_Cliente]    Script Date: 29/09/2017 22:16:08 ******/
CREATE NONCLUSTERED INDEX [iNumeroDoc_Cliente] ON [dbo].[Cliente]
(
	[NumeroDoc_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movimiento] ADD  DEFAULT (getdate()) FOR [Fecha_Mov]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [fkId_TipDoc_Cliente] FOREIGN KEY([Id_TipDoc_Cliente])
REFERENCES [dbo].[TipDocumento] ([Id_TipDoc])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [fkId_TipDoc_Cliente]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [fkId_Prod_Det] FOREIGN KEY([Id_Prod_Det])
REFERENCES [dbo].[Producto] ([Id_Prod])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [fkId_Prod_Det]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [fkId_Venta_Det] FOREIGN KEY([Id_Venta_Det])
REFERENCES [dbo].[Venta] ([Id_Venta])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [fkId_Venta_Det]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [fkId_Moneda_Mov] FOREIGN KEY([Id_Moneda_Mov])
REFERENCES [dbo].[Moneda] ([Id_Moneda])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [fkId_Moneda_Mov]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [fkId_TipMov_Mov] FOREIGN KEY([Id_TipMov_Mov])
REFERENCES [dbo].[TipoMovimiento] ([Id_TipMov])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [fkId_TipMov_Mov]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [fkId_Usuario_Mov] FOREIGN KEY([Id_Usuario_Mov])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [fkId_Usuario_Mov]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fkId_Cat_prod] FOREIGN KEY([Id_Cat_prod])
REFERENCES [dbo].[Categoria] ([Id_Cat])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fkId_Cat_prod]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fkId_Proveedor_Producto] FOREIGN KEY([Id_Proveedor_Producto])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fkId_Proveedor_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fkId_Umed_prod] FOREIGN KEY([Id_Umed_prod])
REFERENCES [dbo].[UnidadMedida] ([Id_Umed])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fkId_Umed_prod]
GO
ALTER TABLE [dbo].[Serie]  WITH CHECK ADD  CONSTRAINT [fk_Id_Sucursal_Serie] FOREIGN KEY([Id_Sucursal_Serie])
REFERENCES [dbo].[Sucursal] ([Id_Suc])
GO
ALTER TABLE [dbo].[Serie] CHECK CONSTRAINT [fk_Id_Sucursal_Serie]
GO
ALTER TABLE [dbo].[Serie]  WITH CHECK ADD  CONSTRAINT [fk_Id_TipCom_Serie] FOREIGN KEY([Id_TipCom_Serie])
REFERENCES [dbo].[TipoComprobante] ([Id_TipCom])
GO
ALTER TABLE [dbo].[Serie] CHECK CONSTRAINT [fk_Id_TipCom_Serie]
GO
ALTER TABLE [dbo].[TipoComprobante]  WITH CHECK ADD  CONSTRAINT [fkId_TipMov_TipCom] FOREIGN KEY([Id_TipMov_TipCom])
REFERENCES [dbo].[TipoMovimiento] ([Id_TipMov])
GO
ALTER TABLE [dbo].[TipoComprobante] CHECK CONSTRAINT [fkId_TipMov_TipCom]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [fkId_nivelAcc_Usuario] FOREIGN KEY([Id_nivelAcc_Usuario])
REFERENCES [dbo].[NivelAcceso] ([Id_NivelAcc])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [fkId_nivelAcc_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [fkId_Suc_Usuario] FOREIGN KEY([Id_Suc_Usuario])
REFERENCES [dbo].[Sucursal] ([Id_Suc])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [fkId_Suc_Usuario]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkId_Cliente_Venta] FOREIGN KEY([Id_Cliente_Venta])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkId_Cliente_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkId_Moneda_Venta] FOREIGN KEY([Id_Moneda_Venta])
REFERENCES [dbo].[Moneda] ([Id_Moneda])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkId_Moneda_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkId_Suc_Venta] FOREIGN KEY([Id_Suc_Venta])
REFERENCES [dbo].[Sucursal] ([Id_Suc])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkId_Suc_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkId_TipCom_Venta] FOREIGN KEY([Id_TipCom_Venta])
REFERENCES [dbo].[TipoComprobante] ([Id_TipCom])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkId_TipCom_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkId_TipPago_Venta] FOREIGN KEY([Id_TipPago_Venta])
REFERENCES [dbo].[TipoPago] ([Id_TipPago])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkId_TipPago_Venta]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fkId_Usuario_Venta] FOREIGN KEY([Id_Usuario_Venta])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fkId_Usuario_Venta]
GO
/****** Object:  StoredProcedure [dbo].[spAnularBoletaXid]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAnularBoletaXid]
		@prmId_venta int
		as
		 BEGIN
	     UPDATE Venta set Estado_Venta='A',
		                  Descuento_Venta=0 WHERE Id_Venta=@prmId_venta
		 DELETE FROM DetalleVenta where Id_Venta_Det=@prmId_venta
		 END

GO
/****** Object:  StoredProcedure [dbo].[spAnularComprobante]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	 CREATE PROCEDURE [dbo].[spAnularComprobante]
	 @Serie nchar(4),
	 @correlativo nchar(6),
	 @idtipcom int
	  as
	   BEGIN
	   DECLARE @idVenta int = (SELECT Id_Venta FROM Venta WHERE Serie_Venta=@Serie AND Correlativo_Venta=@correlativo 
	   AND Id_TipCom_Venta=@idtipcom)
	    UPDATE Venta set Estado_Venta='A',
		Descuento_Venta=0 WHERE Serie_Venta=@Serie AND Correlativo_Venta=@correlativo AND Id_TipCom_Venta=@idtipcom
		DELETE FROM DetalleVenta where Id_Venta_Det=@idVenta
	   END


GO
/****** Object:  StoredProcedure [dbo].[spBuscarCategoria]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   -- Buscar categoria (click en datagridview)
    CREATE PROCEDURE [dbo].[spBuscarCategoria] 
   @prmidCat int
   as
    BEGIN
	 SET NOCOUNT ON
	  SELECT Id_Cat, Codigo_Cat, Nombre_Cat, Descripcion_Cat FROM Categoria
	  WHERE Id_Cat = @prmidCat
	 SET NOCOUNT OFF
	END 


GO
/****** Object:  StoredProcedure [dbo].[spBuscarCliente]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	CREATE PROCEDURE [dbo].[spBuscarCliente]
	@prmidCliente int,
	@prmNroDoc nchar(15)
	 as 
	  BEGIN
	   SET NOCOUNT ON
	   IF(@prmidCliente!= 0)
	    BEGIN
	     SELECT c.Id_Cliente,c.Id_TipDoc_Cliente, c.NumeroDoc_Cliente, c.Nombre_Cliente,
		 c.Telefono_Cliente, c.Celular_Cliente, c.Correo_Cliente, c.Direccion_Cliente,c.FechaNac_Cliente,c.Sexo_Cliente,
		 td.Nombre_TipDoc
		 FROM Cliente c INNER JOIN TipDocumento td ON c.Id_TipDoc_Cliente=td.Id_TipDoc
		  WHERE Id_Cliente=@prmidCliente
		 END
		  ELSE
		    BEGIN
			 SELECT c.Id_Cliente,c.Id_TipDoc_Cliente, c.NumeroDoc_Cliente, c.Nombre_Cliente,
		      c.Telefono_Cliente, c.Celular_Cliente, c.Correo_Cliente, c.Direccion_Cliente,c.FechaNac_Cliente,c.Sexo_Cliente,
		      td.Nombre_TipDoc
		 FROM Cliente c INNER JOIN TipDocumento td ON c.Id_TipDoc_Cliente=td.Id_TipDoc WHERE NumeroDoc_Cliente=@prmNroDoc
	     END
	   SET NOCOUNT OFF
	  END 


GO
/****** Object:  StoredProcedure [dbo].[spBuscarMtaerial]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[spBuscarMtaerial] 
   @id int
   as 
   BEGIN
    SELECT Id_Material,Nombre_Material FROM Material where Id_Material = @id
   END

GO
/****** Object:  StoredProcedure [dbo].[spBuscarProdAvanzada]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarProdAvanzada] --3,'15.20'
	@prmTipEntrada int,
	@prmValorEntrada nvarchar(50)
	as  
	BEGIN
	 SET NOCOUNT ON
	 IF(@prmTipEntrada = 1)
	  BEGIN -------------------------------------------------------
	  SELECT p.Id_Prod,Codigo_Prod, p.Nombre_Prod, p.Marca_Prod,c.Nombre_Cat,um.Descripcion_Umed,p.Precio_Prod,p.Stock_Prod,m.Nombre_Material
	  FROM Producto p INNER JOIN Categoria c ON p.Id_Cat_prod=c.Id_Cat
	                  INNER JOIN UnidadMedida um ON p.Id_Umed_prod=um.Id_Umed
					  INNER JOIN Proveedor pr ON p.Id_Proveedor_Producto = pr.Id_Proveedor 
					  INNER JOIN Material m ON p.IdMaterial = m.Id_Material
					  where p.Nombre_Prod LIKE '%'+@prmValorEntrada+'%' AND p.Estado_Prod=1		 
        END ----------------------------------------------------------
		 ELSE IF(@prmTipEntrada = 2)
		  BEGIN-------------------------------------------------------
		   	  SELECT p.Id_Prod,Codigo_Prod, p.Nombre_Prod, p.Marca_Prod,c.Nombre_Cat,um.Descripcion_Umed,p.Precio_Prod,p.Stock_Prod,m.Nombre_Material
	             FROM Producto p INNER JOIN Categoria c ON p.Id_Cat_prod=c.Id_Cat
	                  INNER JOIN UnidadMedida um ON p.Id_Umed_prod=um.Id_Umed
					  INNER JOIN Proveedor pr ON p.Id_Proveedor_Producto = pr.Id_Proveedor 
					  INNER JOIN Material m ON p.IdMaterial = m.Id_Material
					  where c.Nombre_Cat LIKE '%'+@prmValorEntrada+'%' AND p.Estado_Prod=1	
		  END---------------------------------------------------------
		   ELSE
		    BEGIN----------------------------------------------------
				  SELECT p.Id_Prod,Codigo_Prod, p.Nombre_Prod, p.Marca_Prod,c.Nombre_Cat,um.Descripcion_Umed,p.Precio_Prod,p.Stock_Prod,m.Nombre_Material
	              FROM Producto p INNER JOIN Categoria c ON p.Id_Cat_prod=c.Id_Cat
	                  INNER JOIN UnidadMedida um ON p.Id_Umed_prod=um.Id_Umed
					  INNER JOIN Proveedor pr ON p.Id_Proveedor_Producto = pr.Id_Proveedor 
					  INNER JOIN Material m ON p.IdMaterial = m.Id_Material
					  where p.Precio_Prod LIKE '%'+@prmValorEntrada+'%' AND p.Estado_Prod=1	
			END-------------------------------------------------------
	 SET NOCOUNT OFF
	END


GO
/****** Object:  StoredProcedure [dbo].[spBuscarProducto]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spBuscarProducto] 
	@prmId_Prod int
	as
	 BEGIN
	  SET NOCOUNT ON
	   SELECT p.Id_Prod,p.Codigo_Prod, p.Nombre_Prod, p.Marca_Prod,p.PrecioCompra_Prod,p.Precio_Prod,
	   p.Stock_Prod,p.StockProm_Prod,p.StockMin_Prod,c.Id_Cat,um.Id_Umed,pr.Id_Proveedor,m.Id_Material
	  FROM Producto p INNER JOIN Categoria c ON p.Id_Cat_prod=c.Id_Cat
	                  INNER JOIN UnidadMedida um ON p.Id_Umed_prod=um.Id_Umed
					  INNER JOIN Proveedor pr ON p.Id_Proveedor_Producto = pr.Id_Proveedor
					  INNER JOIN Material m ON p.IdMaterial = m.Id_Material  where Estado_Prod=1
					  AND p.Id_Prod = @prmId_Prod
	  SET NOCOUNT OFF
	 END 

GO
/****** Object:  StoredProcedure [dbo].[spBuscarProveedor]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spBuscarProveedor] 
	@prmid_Proveedor int
	as
	 BEGIN
	  SELECT Id_Proveedor, Cod_Proveedor, RazSocial_Proveedor, Ruc_Proveedor, Direccion_Proveedor, 
	  Telefono_Proveedor, Celular_Proveedor, Correo_Proveedor FROM Proveedor WHERE Id_Proveedor = @prmid_Proveedor and Estado_Proveedor=1
	 END


GO
/****** Object:  StoredProcedure [dbo].[spBuscarUnMedida]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spBuscarUnMedida] 
	@prmidUniMed int
	as
	 BEGIN
	  SET NOCOUNT ON
	   SELECT Id_Umed, Codigo_Umed, Descripcion_Umed, Abreviatura_Umed FROM UnidadMedida WHERE Id_Umed = @prmidUniMed AND Estado_Umed=1
	  SET NOCOUNT OFF
	 END


GO
/****** Object:  StoredProcedure [dbo].[spBuscarUsuario]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spBuscarUsuario] --'Id','4'
	 @prmBusqueda nchar(8),
	 @prmValor nchar(8)
	 as
	   BEGIN
		 IF(@prmBusqueda ='Login')
			 BEGIN
				SELECT u.Id_Usuario, u.Codigo_Usuario, u.Nombre_Usuario, u.Login_Usuario,dbo.fnDesencriptarPass(u.Password_Usuario) as Password_Usuario,
					   u.Telefono_Usuario,u.Celular_Usuario,u.Correo_Usuario,
						u.Estado_Usuario, u.Expiracion_Usuario,na.Id_NivelAcc,na.Numero_NivelAcc,s.Id_Suc,s.Direccion_Suc,s.Codigo_Suc FROM Usuario u INNER JOIN NivelAcceso na ON
						u.Id_nivelAcc_Usuario = na.Id_NivelAcc INNER JOIN Sucursal s ON
						U.Id_Suc_Usuario = s.Id_Suc WHERE Login_Usuario=@prmValor
			  END
		  ELSE IF(@prmBusqueda ='Codigo')
			 BEGIN
				SELECT u.Id_Usuario, u.Codigo_Usuario, u.Nombre_Usuario, u.Login_Usuario,dbo.fnDesencriptarPass(u.Password_Usuario) as Password_Usuario,
					   u.Telefono_Usuario,u.Celular_Usuario,u.Correo_Usuario,
						u.Estado_Usuario, u.Expiracion_Usuario,na.Id_NivelAcc,na.Numero_NivelAcc,s.Id_Suc,s.Direccion_Suc,s.Codigo_Suc FROM Usuario u INNER JOIN NivelAcceso na ON
						u.Id_nivelAcc_Usuario = na.Id_NivelAcc INNER JOIN Sucursal s ON
						u.Id_Suc_Usuario = s.Id_Suc WHERE Codigo_Usuario=@prmValor
			 END
			ELSE IF(@prmBusqueda ='Id')
			 BEGIN
			 SELECT u.Id_Usuario, u.Codigo_Usuario, u.Nombre_Usuario, u.Login_Usuario,dbo.fnDesencriptarPass(u.Password_Usuario) as Password_Usuario,
					   u.Telefono_Usuario,u.Celular_Usuario,u.Correo_Usuario,
						u.Estado_Usuario, u.Expiracion_Usuario,na.Id_NivelAcc,na.Numero_NivelAcc,s.Id_Suc,s.Direccion_Suc,s.Codigo_Suc FROM Usuario u INNER JOIN NivelAcceso na ON
						u.Id_nivelAcc_Usuario = na.Id_NivelAcc INNER JOIN Sucursal s ON
						u.Id_Suc_Usuario = s.Id_Suc WHERE Id_Usuario=@prmValor
			 END
	   END

GO
/****** Object:  StoredProcedure [dbo].[spBusquedaSensitiva]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	CREATE PROCEDURE [dbo].[spBusquedaSensitiva] 
	@prmNom_Cli nvarchar(30)
	as 
	 BEGIN
	  SET NOCOUNT ON
	    SELECT c.Id_Cliente,c.Id_TipDoc_Cliente, c.NumeroDoc_Cliente, c.Nombre_Cliente,
		 c.Telefono_Cliente, c.Celular_Cliente, c.Correo_Cliente, c.Direccion_Cliente,c.FechaNac_Cliente,c.Sexo_Cliente,
		 td.Nombre_TipDoc
		 FROM Cliente c INNER JOIN TipDocumento td ON c.Id_TipDoc_Cliente=td.Id_TipDoc
		 WHERE Nombre_Cliente LIKE '%'+@prmNom_Cli+'%'
	     SET NOCOUNT OFF
		 END


GO
/****** Object:  StoredProcedure [dbo].[spCargarCorrelativo]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	 CREATE PROCEDURE [dbo].[spCargarCorrelativo] --1,'0001'
	 @id_tipcom int,
	 @NumSerie nchar(6)
	  as
	   BEGIN
		 DECLARE @correlativo nchar(6)
		 SET @correlativo = (SELECT MAX(Correlativo_Venta) FROM Venta WHERE Id_TipCom_Venta=@id_tipcom AND Serie_Venta= @NumSerie)
		 SET @correlativo = RIGHT('00000'+LTRIM(RIGHT(ISNULL(@correlativo,'00000'),6)+1),6)
		 SELECT  @correlativo AS Correlativo
	 END


GO
/****** Object:  StoredProcedure [dbo].[spCargarSerie]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spCargarSerie]
	@prmIdSuc int,
	@prmIdTipcom int
	as
	 BEGIN
	 SELECT Id_Serie, Id_Sucursal_Serie, Id_TipCom_Serie, Numero_Serie FROM Serie 
	 WHERE Id_Sucursal_Serie=@prmIdSuc AND Id_TipCom_Serie = @prmIdTipcom
	 END


GO
/****** Object:  StoredProcedure [dbo].[spCrearMaterial]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCrearMaterial] 
@nombre nvarchar(200)
as
 BEGIN
   INSERT INTO Material Values(@nombre,1)
 END

GO
/****** Object:  StoredProcedure [dbo].[spEditarMaterial]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEditarMaterial]
@Id int,
@name nvarchar(200)
as
  BEGIN
  update Material SET Nombre_Material = @name WHERE Id_Material=@Id
  END

GO
/****** Object:  StoredProcedure [dbo].[spEliminarMaterial]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[spEliminarMaterial]
  @Id int
  AS
   BEGIN
    UPDATE Material SET Estado =0 WHERE Id_Material = @Id
   END

GO
/****** Object:  StoredProcedure [dbo].[spGuardarVenta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
	CREATE PROCEDURE [dbo].[spGuardarVenta]
	@Cadxml varchar(max),
	@TIPO_DOC_VENTA int
	as
	 BEGIN
	  DECLARE @h int, @smsmError nvarchar(500),@idVenta int
	   EXEC SP_XML_PREPAREDOCUMENT @h output, @Cadxml
	    BEGIN TRY
		 BEGIN TRANSACTION
		 -- Control para venta no sea mayor que stock
		 IF(SELECT COUNT(*) FROM OpenXML(@h,'root/venta/detalle',1)WITH(
		   idproducto int,
		   cantidad int
		   )dt INNER JOIN Producto p on p.Id_Prod=dt.idproducto WHERE p.Stock_Prod<dt.cantidad)>0
		  BEGIN
		   RAISERROR('Uno ó mas productos no cuentan con el stock suficiente',16,1)
		  END

		  INSERT INTO Venta(Codigo_Venta, Id_Cliente_Venta, Id_Usuario_Venta, Id_Suc_Venta, Id_TipCom_Venta, Id_Moneda_Venta, 
		                         Id_TipPago_Venta,Serie_Venta,Correlativo_Venta, Igv_Venta, FechaVenta, Estado_Venta,Descuento_Venta,Desc_Venta)
           SELECT dbo.fnGenCodVenta(),v.idcliente,v.idusuario,v.idsucursal,v.istipcom,v.idmoneda,v.idtipopago,v.serie,
		   dbo.fnGenerarCorrelativo(@TIPO_DOC_VENTA,v.serie),v.igv,GETDATE(),'E',v.descuento,v.descripcion
		   FROM OpenXML(@h,'root/venta',1)WITH(
		   idcliente int,
		   idusuario int,
		   idsucursal int,
		   istipcom int,
		   idmoneda int,
		   idtipopago int,
		   igv int,
		   serie nchar(4),
		   descuento decimal(10,2),
		   descripcion nvarchar(200)
		   )v  
		   set @idVenta=@@IDENTITY
		   
		   INSERT INTO DetalleVenta(Id_Prod_Det, Id_Venta_Det, PrecProd_Det, Cantidad_Det) 
		   SELECT dt.idproducto,@idVenta,dt.precioprod,dt.cantidad
		   FROM OpenXML(@h,'root/venta/detalle',1)WITH(
		   idproducto int,
		   precioprod decimal(5,2),
		   cantidad int
		   )dt   
		   
		   IF(@@TRANCOUNT>0) COMMIT TRANSACTION
		END TRY

		BEGIN CATCH
		 IF(@@TRANCOUNT>0)
		   BEGIN
			 ROLLBACK TRANSACTION
			 SELECT @smsmError = ERROR_MESSAGE()
			 RAISERROR(@smsmError,16,1)
		   END
		END CATCH
	 END


GO
/****** Object:  StoredProcedure [dbo].[spInsEditElimCategoria]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[spInsEditElimCategoria]
   @prmCadXml nvarchar(max)
    as
	 BEGIN
	  DECLARE @h int, @smsError varchar(500)
	  EXEC SP_XML_PREPAREDOCUMENT @h output, @prmCadXml
	   BEGIN TRY
	     BEGIN TRANSACTION
		   --Ingresar nuevo registro 
		   INSERT INTO Categoria(Codigo_Cat, Nombre_Cat, Descripcion_Cat, UsuarioCreacion_Cat)
		   SELECT dbo.fnGenCodCategoria(),c.nombre,c.descripcion,c.usuariocreacion
		   FROM OpenXml(@h,'root/categoria',1)WITH(
		   nombre nvarchar(100),
		   descripcion nvarchar(200),
		   usuariocreacion int,
		   tipoedicion int
		   )c WHERE tipoedicion=1

		   -- Actualizando registro
		   UPDATE Cat
		          SET Cat.Nombre_Cat=c.nombre,
				      Cat.Descripcion_Cat = c.descripcion,
					  Cat.UsuarioUpdate_Cat = c.usuarioupdate
           FROM OpenXml(@h,'root/categoria',1)with(
		   idcategoria int,
		   nombre nvarchar(100),
		   descripcion nvarchar(200),
		   usuarioupdate int,
		   tipoedicion int
		   )c INNER JOIN Categoria Cat ON c.idcategoria= Cat.Id_Cat WHERE c.tipoedicion=2

		   -- Elimnado registro (actualiza estado)
		    UPDATE Cat
		          SET Cat.Estado_Categoria= 0
           FROM OpenXml(@h,'root/categoria',1)with(
		   idcategoria int,
		   tipoedicion int
		   )c INNER JOIN Categoria Cat ON c.idcategoria= Cat.Id_Cat WHERE c.tipoedicion=3

		   IF (@@TRANCOUNT>0) COMMIT TRANSACTION
	    END TRY
		BEGIN CATCH
		 IF (@@TRANCOUNT>0) ROLLBACK TRANSACTION
		 SELECT @smsError = ERROR_MESSAGE()
		 RAISERROR(@smsError,16,1)
		END CATCH
	 END


GO
/****** Object:  StoredProcedure [dbo].[spInsEditElimCliente]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
   CREATE PROCEDURE [dbo].[spInsEditElimCliente]
   @prmCadXml nvarchar(max)
    as
	 BEGIN
	  DECLARE @h int, @smsError varchar(500)
	  EXEC SP_XML_PREPAREDOCUMENT @h output, @prmCadXml
	   BEGIN TRY
	     BEGIN TRANSACTION
		   --Ingresar nuevo registro 
		   INSERT INTO Cliente(Id_TipDoc_Cliente, NumeroDoc_Cliente, Nombre_Cliente, FechaNac_Cliente, Sexo_Cliente,
		    Telefono_Cliente, Celular_Cliente, Correo_Cliente, Direccion_Cliente,UsuarioCreacion_Cliente)
			SELECT c.idtipdoc,c.nrodoc,c.nombre,c.fechanac,c.sexo,c.telefono,c.celular,c.correo,c.direccion,c.usuariocreacion
		   FROM OpenXml(@h,'root/cliente',1)WITH(
		   idtipdoc int,
		   nrodoc nchar(15),
		   nombre  nvarchar(300),
		   fechanac datetime,
		   sexo char(1),
		   telefono nchar(8),
		   celular nchar(9),
		   correo nvarchar(100),
		   direccion nvarchar(200),
		   usuariocreacion int,
		   tipoedicion int
		   )c WHERE tipoedicion=1

		   -- Actualizando registro
		   UPDATE cl
		          SET cl.Id_TipDoc_Cliente = c.idtipdoc,
				      cl.NumeroDoc_Cliente = c.nrodoc,
					  cl.Nombre_Cliente = c.nombre,
					  cl.FechaNac_Cliente = c.fechanac,
					  cl.Sexo_Cliente = c.sexo,
					  cl.Telefono_Cliente = c.telefono,
					  cl.Celular_Cliente = c.celular,
					  cl.Correo_Cliente = c.correo,
					  cl.Direccion_Cliente = c.direccion,
					  cl.UsuarioUpdate_Cliente = c.usuarioupdate,
					  cl.FechUpdate_Cliente = getdate()
           FROM OpenXml(@h,'root/cliente',1)with(
		   idcliente int,
		   idtipdoc int,
		   nrodoc nchar(15),
		   nombre  nvarchar(300),
		   fechanac datetime,
		   sexo char(1),
		   telefono nchar(8),
		   celular nchar(9),
		   correo nvarchar(100),
		   direccion nvarchar(200),
		   usuarioupdate int,
		   tipoedicion int
		   )c INNER JOIN Cliente cl ON c.idcliente=cl.Id_Cliente WHERE c.tipoedicion=2

		   -- Elimnado registro (actualiza estado)
		    UPDATE cl 
			SET cl.Estado_Cliente=0
           FROM OpenXml(@h,'root/cliente',1)with(
		   idcliente int,
		   tipoedicion int
		   )c INNER JOIN Cliente cl ON c.idcliente=cl.Id_Cliente WHERE c.tipoedicion=3

		   IF (@@TRANCOUNT>0) COMMIT TRANSACTION
	    END TRY
		BEGIN CATCH
		 IF (@@TRANCOUNT>0) ROLLBACK TRANSACTION
		 SELECT @smsError = ERROR_MESSAGE()
		 RAISERROR(@smsError,16,1)
		END CATCH
	 END


GO
/****** Object:  StoredProcedure [dbo].[spInsEditElimProducto]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[spInsEditElimProducto]
   @prmCadXml nvarchar(max)
    as
	 BEGIN
	  DECLARE @h int, @smsError varchar(500)
	  EXEC SP_XML_PREPAREDOCUMENT @h output, @prmCadXml
	   BEGIN TRY
	     BEGIN TRANSACTION
		   --Ingresar nuevo registro 
		   INSERT INTO Producto(Id_Cat_prod, Id_Umed_prod, Id_Proveedor_Producto, Codigo_Prod, Nombre_Prod, Marca_Prod, 
		                        PrecioCompra_Prod, Precio_Prod, Stock_Prod, StockProm_Prod, StockMin_Prod,UsuarioCreacion_Prod,IdMaterial)
		   SELECT p.idcat,p.idunmed,p.idprov,dbo.fnGenCodProducto(),p.nombre,p.marca,p.preciocompra,p.precio,
		          p.stock,p.stockprom,p.stockmin,p.usuariocreacion,p.idmaterial
		   FROM OpenXml(@h,'root/producto',1)WITH(
		   idcat int,
		   idunmed int,
		   idprov int,
		   nombre nvarchar(100),
		   marca nvarchar(50),
		   preciocompra decimal(5,2),
		   precio decimal(5,2),
		   stock int,
		   stockprom int,
		   stockmin int,
		   usuariocreacion int,
		   tipoedicion int,
		   idmaterial int
		   )p WHERE tipoedicion=1

		   -- Actualizando registro
		   UPDATE pro
		          SET pro.Id_Cat_prod=p.idcat,
				      pro.Id_Umed_prod=p.idunmed,
					  pro.Id_Proveedor_Producto=p.idprov,
					  pro.Nombre_Prod=p.nombre,
					  pro.Marca_Prod=p.marca,
					  pro.PrecioCompra_Prod=p.preciocompra,
					  pro.Precio_Prod=p.precio,
					  pro.Stock_Prod=p.stock,
					  pro.StockProm_Prod=p.stockprom,
					  pro.StockMin_Prod=p.stockmin,
					  pro.UsuarioUpdate_Prod = p.usuarioupdate,
					  pro.IdMaterial=p.idmaterial
           FROM OpenXml(@h,'root/producto',1)with(
		   idproducto int,
		   idcat int,
		   idunmed int,
		   idprov int,
		   nombre nvarchar(100),
		   marca nvarchar(50),
		   preciocompra decimal(5,2),
		   precio decimal(5,2),
		   stock int,
		   stockprom int,
		   stockmin int,
		   usuarioupdate int,
		   tipoedicion int,
		   idmaterial int
		   )p INNER JOIN Producto pro ON p.idproducto = pro.Id_Prod WHERE p.tipoedicion=2

		   -- Elimnado registro (actualiza estado)
		    UPDATE  pro
		          SET pro.Estado_Prod=0
           FROM OpenXml(@h,'root/producto',1)with(
		   idproducto int,
		   tipoedicion int
		   )p INNER JOIN Producto pro ON p.idproducto = pro.Id_Prod WHERE p.tipoedicion=3

		   IF (@@TRANCOUNT>0) COMMIT TRANSACTION
	    END TRY
		BEGIN CATCH
		 IF (@@TRANCOUNT>0) ROLLBACK TRANSACTION
		 SELECT @smsError = ERROR_MESSAGE()
		 RAISERROR(@smsError,16,1)
		END CATCH
	 END

GO
/****** Object:  StoredProcedure [dbo].[spInsEditElimProveedor]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[spInsEditElimProveedor]
   @prmCadXml nvarchar(max)
    as
	 BEGIN
	  DECLARE @h int, @smsError varchar(500)
	  EXEC SP_XML_PREPAREDOCUMENT @h output, @prmCadXml
	   BEGIN TRY
	     BEGIN TRANSACTION
		   --Ingresar nuevo registro 
		   INSERT INTO Proveedor(Cod_Proveedor, RazSocial_Proveedor, Ruc_Proveedor, Direccion_Proveedor, 
		               Telefono_Proveedor, Celular_Proveedor, Correo_Proveedor)
		   SELECT dbo.fnGenCodProveedor(),pr.razonsocial,pr.ruc,pr.direccion,pr.telefono,pr.celular,pr.correo
		   FROM OpenXml(@h,'root/proveedor',1)WITH(
		   razonsocial nvarchar(200),
		   ruc nchar(11),
		   direccion nvarchar(300),
		   telefono nchar(8),
		   celular nchar(9),
		   correo nvarchar(100),
		   tipoedicion int
		   )pr WHERE tipoedicion=1

		   -- Actualizando registro
		   UPDATE pro
		          SET pro.RazSocial_Proveedor=pr.razonsocial,
				  pro.Ruc_Proveedor = pr.ruc,
				  pro.Direccion_Proveedor = pr.direccion,
				  pro.Telefono_Proveedor = pr.telefono,
				  pro.Celular_Proveedor = pr.celular,
				  pro.Correo_Proveedor = pr.correo
           FROM OpenXml(@h,'root/proveedor',1)with(
		   idprove int,
		   razonsocial nvarchar(200),
		   ruc nchar(11),
		   direccion nvarchar(300),
		   telefono nchar(8),
		   celular nchar(9),
		   correo nvarchar(100),
		   tipoedicion int
		   )pr INNER JOIN Proveedor pro ON pr.idprove = pro.Id_Proveedor WHERE pr.tipoedicion=2

		   -- Elimnado registro (actualiza estado)
		    UPDATE pro
		          SET pro.Estado_Proveedor=0
           FROM OpenXml(@h,'root/proveedor',1)with(
		   idprove int,
		   tipoedicion int
		   )pr INNER JOIN Proveedor pro ON pr.idprove = pro.Id_Proveedor WHERE pr.tipoedicion=3

		   IF (@@TRANCOUNT>0) COMMIT TRANSACTION
	    END TRY
		BEGIN CATCH
		 IF (@@TRANCOUNT>0) ROLLBACK TRANSACTION
		 SELECT @smsError = ERROR_MESSAGE()
		 RAISERROR(@smsError,16,1)
		END CATCH
	 END


GO
/****** Object:  StoredProcedure [dbo].[spInsEditElimUnidMed]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[spInsEditElimUnidMed]
   @prmCadXml nvarchar(max)
    as
	 BEGIN
	  DECLARE @h int, @smsError varchar(500)
	  EXEC SP_XML_PREPAREDOCUMENT @h output, @prmCadXml
	   BEGIN TRY
	     BEGIN TRANSACTION
		   --Ingresar nuevo registro 
		   INSERT INTO UnidadMedida(Codigo_Umed, Descripcion_Umed, Abreviatura_Umed)
		   SELECT dbo.fnGenCodUnidadMedida(),um.descripcion,um.abreviatura
		   FROM OpenXml(@h,'root/unmedida',1)WITH(
		   descripcion nvarchar(50),
		   abreviatura nchar(20),
		   tipoedicion int
		   )um WHERE tipoedicion=1

		   -- Actualizando registro
		   UPDATE umda
		          SET umda.Descripcion_Umed =um.descripcion,
				      umda.Abreviatura_Umed = um.abreviatura
           FROM OpenXml(@h,'root/unmedida',1)with(
		   idunmedida int,
		   descripcion nvarchar(50),
		   abreviatura nchar(20),
		   tipoedicion int
		   )um INNER JOIN UnidadMedida umda ON um.idunmedida=umda.Id_Umed  WHERE um.tipoedicion=2

		   -- Elimnado registro (actualiza estado)
		    UPDATE umda
		          SET umda.Estado_Umed = 0    
           FROM OpenXml(@h,'root/unmedida',1)with(
		   idunmedida int,
		   tipoedicion int
		   )um INNER JOIN UnidadMedida umda ON um.idunmedida=umda.Id_Umed  WHERE um.tipoedicion=3

		   IF (@@TRANCOUNT>0) COMMIT TRANSACTION
	    END TRY
		BEGIN CATCH
		 IF (@@TRANCOUNT>0) ROLLBACK TRANSACTION
		 SELECT @smsError = ERROR_MESSAGE()
		 RAISERROR(@smsError,16,1)
		END CATCH
	 END


GO
/****** Object:  StoredProcedure [dbo].[spInsEditElimUsario]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 -- Procedure mantinimiento de usuario

  CREATE PROCEDURE [dbo].[spInsEditElimUsario]
  @Cadxml varchar(max)
  as
  BEGIN
    DECLARE @h int,@smsError nvarchar(300)
	 EXEC SP_XML_PREPAREDOCUMENT @h output, @Cadxml
	  BEGIN TRY
	   BEGIN TRANSACTION
	      -- Insertando nuevo usuario
		  INSERT INTO Usuario(Codigo_Usuario, Id_nivelAcc_Usuario, Id_Suc_Usuario, Nombre_Usuario, Login_Usuario,
		                      Password_Usuario, Telefono_Usuario, Celular_Usuario, Correo_Usuario, Estado_Usuario, 
							  Expiracion_Usuario, FechCreacion_Usuario, UsuarioCreacion_Usuario)-- end
		  SELECT dbo.fnGenCodUsuario(),u.idnivelacceso, u.idsucusuario, u.nombre, u.logeo,dbo.fnEncriptarPass(u.pass), u.telefono,
		         u.celular, u.correo, u.estado,u.expiracion,GETDATE(), u.usuariocreacion --end
		  FROM OpenXML(@h,'root/usuario',1)WITH(
		  idnivelacceso int, idsucusuario int, nombre nvarchar(200), logeo nchar(8), pass nvarchar(50),
		  telefono nchar(8), celular nchar(9), correo nvarchar(100), estado bit, expiracion datetime,
		  usuariocreacion int, tipoedicion int)u WHERE tipoedicion=1 --end
		
		  -- editando usuario
		  UPDATE u 
		      SET u.Id_nivelAcc_Usuario = us.idnivelacceso,
			      u.Id_Suc_Usuario = us.idsucusuario,
				  u.Nombre_Usuario = us.nombre,
				  u.Login_Usuario = us.logeo,
				  u.Password_Usuario = dbo.fnEncriptarPass(us.pass),
				  u.Telefono_Usuario = us.telefono,
				  u.Celular_Usuario = us.celular,
				  u.Correo_Usuario = us.correo,
				  u.Estado_Usuario = us.estado,
				  u.Expiracion_Usuario = us.expiracion,
				  u.UsuarioCreacion_Usuario = us.usuariocreacion
		  FROM OpenXML(@h,'root/usuario',1)WITH(
		  idusuario int,idnivelacceso int, idsucusuario int, nombre nvarchar(200), logeo nchar(8), pass nvarchar(50),
		  telefono nchar(8), celular nchar(9), correo nvarchar(100), estado bit, expiracion datetime,
		  usuariocreacion int, tipoedicion int)us INNER JOIN Usuario u ON us.idusuario=u.Id_Usuario WHERE tipoedicion=2--end

		  --Eliminando usuario(Cambio estado)
		   UPDATE u 
		      SET u.Estado_Usuario = 0
		  FROM OpenXML(@h,'root/usuario',1)WITH(
		  idusuario int, tipoedicion int)us INNER JOIN Usuario u ON us.idusuario=u.Id_Usuario WHERE tipoedicion=3--end

		 IF @@TRANCOUNT > 0 COMMIT TRANSACTION
		
	  END TRY

	  BEGIN CATCH
	    IF @@TRANCOUNT>0 ROLLBACK TRANSACTION
		SET @smsError= ERROR_MESSAGE()
		RAISERROR(@smsError,16,1)
	  END CATCH
  END


GO
/****** Object:  StoredProcedure [dbo].[spListaNivelAcceso]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[spListaNivelAcceso]
  as
  BEGIN
    SET NOCOUNT ON
	 SELECT * FROM NivelAcceso
	SET NOCOUNT OFF
  END 


GO
/****** Object:  StoredProcedure [dbo].[spListarCategoria]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


   /*Procedures --> mantenimiento de categoria*/

   CREATE PROCEDURE [dbo].[spListarCategoria]
   as
    BEGIN
	  SET NOCOUNT ON 
	  SELECT Id_Cat, Codigo_Cat, Nombre_Cat, Descripcion_Cat,Estado_Categoria FROM Categoria
	  WHERE Estado_Categoria=1
	  SET NOCOUNT OFF
	END


GO
/****** Object:  StoredProcedure [dbo].[spListarCliente]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

   CREATE PROCEDURE [dbo].[spListarCliente]
   as
    BEGIN
	SET NOCOUNT ON
	 SELECT c.Id_Cliente, td.Nombre_TipDoc, c.NumeroDoc_Cliente, c.Nombre_Cliente,
	 c.Telefono_Cliente, c.Celular_Cliente, c.Correo_Cliente, c.Direccion_Cliente
	 FROM Cliente c INNER JOIN TipDocumento td ON C.Id_TipDoc_Cliente=TD.Id_TipDoc
	 WHERE C.Estado_Cliente=1
	SET NOCOUNT OFF
	END


GO
/****** Object:  StoredProcedure [dbo].[spListarMaterial]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spListarMaterial]
as
 BEGIN
   SELECT Id_Material,Nombre_Material FROM Material WHERE Estado = 1
 END

GO
/****** Object:  StoredProcedure [dbo].[spListarMoneda]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spListarMoneda]
	 as
	  BEGIN
	   SET NOCOUNT ON
	    SELECT Id_Moneda,Descripcion_Moneda FROM Moneda
	   SET NOCOUNT OFF
	  END


GO
/****** Object:  StoredProcedure [dbo].[splistarProdIndicador]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[splistarProdIndicador]
		  @prmname nvarchar(100)
		  as
		   BEGIN
		   SET NOCOUNT ON
		   SELECT p.Id_Prod,p.Codigo_Prod,p.Nombre_Prod,p.PrecioCompra_Prod,p.Precio_Prod,p.Stock_Prod,p.StockProm_Prod,p.StockMin_Prod,
		           c.Nombre_Cat,um.Abreviatura_Umed,m.Nombre_Material FROM Producto p INNER JOIN UnidadMedida um ON p.Id_Umed_prod = um.Id_Umed 
		                          INNER JOIN Categoria c ON p.Id_Cat_prod = c.Id_Cat 
								  INNER JOIN Material m ON p.IdMaterial= m.Id_Material WHERE p.Estado_Prod=1
								  AND Nombre_Prod LIKE '%'+@prmname+'%' ORDER BY p.Stock_Prod
		   SET NOCOUNT OFF
		   END

GO
/****** Object:  StoredProcedure [dbo].[spListarProdStatus]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarProdStatus]  --'',9,0
		 @prmCodigo nchar(6),
		 @prmcat int,
		 @prmstockrango int
		 as
		  BEGIN
		  IF(@prmstockrango=0)
		    BEGIN
		   SELECT p.Id_Prod,p.Codigo_Prod,p.Nombre_Prod,p.PrecioCompra_Prod,p.Precio_Prod,p.Stock_Prod,p.StockProm_Prod,p.StockMin_Prod,
		           c.Nombre_Cat,um.Abreviatura_Umed,m.Nombre_Material FROM Producto p INNER JOIN UnidadMedida um ON p.Id_Umed_prod = um.Id_Umed 
		                          INNER JOIN Categoria c ON p.Id_Cat_prod = c.Id_Cat 
								  INNER JOIN Material m ON p.IdMaterial = m.Id_Material
								  WHERE p.Estado_Prod=1
								  AND(p.Codigo_Prod=@prmCodigo OR c.Id_Cat=@prmcat AND p.Stock_Prod=0 )
       
		     END
		   ELSE IF(@prmstockrango=1)
		    BEGIN
			SELECT p.Id_Prod,p.Codigo_Prod,p.Nombre_Prod,p.PrecioCompra_Prod,p.Precio_Prod,p.Stock_Prod,p.StockProm_Prod,p.StockMin_Prod,
		           c.Nombre_Cat,um.Abreviatura_Umed,m.Nombre_Material FROM Producto p INNER JOIN UnidadMedida um ON p.Id_Umed_prod = um.Id_Umed 
		                          INNER JOIN Categoria c ON p.Id_Cat_prod = c.Id_Cat 
								  INNER JOIN Material m ON p.IdMaterial = m.Id_Material WHERE p.Estado_Prod=1
								  AND(p.Codigo_Prod=@prmCodigo OR c.Id_Cat=@prmcat AND (p.Stock_Prod BETWEEN 0 AND p.StockMin_Prod))
			END

			ELSE IF(@prmstockrango=2)
		     BEGIN
            SELECT p.Id_Prod,p.Codigo_Prod,p.Nombre_Prod,p.PrecioCompra_Prod,p.Precio_Prod,p.Stock_Prod,p.StockProm_Prod,p.StockMin_Prod,
		           c.Nombre_Cat,um.Abreviatura_Umed,m.Nombre_Material FROM Producto p INNER JOIN UnidadMedida um ON p.Id_Umed_prod = um.Id_Umed 
		                          INNER JOIN Categoria c ON p.Id_Cat_prod = c.Id_Cat 
								  INNER JOIN Material m ON p.IdMaterial = m.Id_Material WHERE p.Estado_Prod=1
								  AND(p.Codigo_Prod=@prmCodigo OR c.Id_Cat=@prmcat AND (p.Stock_Prod BETWEEN p.StockMin_Prod+1 AND p.StockProm_Prod))
			END

			ELSE 
		     BEGIN
			SELECT p.Id_Prod,p.Codigo_Prod,p.Nombre_Prod,p.PrecioCompra_Prod,p.Precio_Prod,p.Stock_Prod,p.StockProm_Prod,p.StockMin_Prod,
		           c.Nombre_Cat,um.Abreviatura_Umed,m.Nombre_Material FROM Producto p INNER JOIN UnidadMedida um ON p.Id_Umed_prod = um.Id_Umed 
		                          INNER JOIN Categoria c ON p.Id_Cat_prod = c.Id_Cat 
								  INNER JOIN Material m ON p.IdMaterial = m.Id_Material WHERE p.Estado_Prod=1
								  AND(p.Codigo_Prod=@prmCodigo OR c.Id_Cat=@prmcat AND p.Stock_Prod>=0)
			END

		  END


GO
/****** Object:  StoredProcedure [dbo].[spListarProducto]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spListarProducto]
	as
	 BEGIN
	  SET NOCOUNT ON
	  SELECT Id_Prod,Codigo_Prod, Nombre_Prod, Marca_Prod,c.Nombre_Cat,um.Descripcion_Umed,pr.RazSocial_Proveedor
	  FROM Producto p INNER JOIN Categoria c ON p.Id_Cat_prod=c.Id_Cat
	                  INNER JOIN UnidadMedida um ON p.Id_Umed_prod=um.Id_Umed
					  INNER JOIN Proveedor pr ON p.Id_Proveedor_Producto = pr.Id_Proveedor where Estado_Prod=1

	  SET NOCOUNT OFF
	 END 


GO
/****** Object:  StoredProcedure [dbo].[spListarProveedor]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spListarProveedor]
	as
	BEGIN
	 SET NOCOUNT ON
       SELECT Id_Proveedor, Cod_Proveedor, RazSocial_Proveedor, Ruc_Proveedor
	    FROM Proveedor WHERE Estado_Proveedor=1
	 SET NOCOUNT OFF
	 END


GO
/****** Object:  StoredProcedure [dbo].[spListarSucursal]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[spListarSucursal]
 as
  BEGIN
    SET NOCOUNT ON
	 SELECT * FROM Sucursal
	SET NOCOUNT OFF
  END


GO
/****** Object:  StoredProcedure [dbo].[spListarTipDoc]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[spListarTipDoc]
	as
	 BEGIN
	  SET NOCOUNT ON
	   SELECT Id_TipDoc, Abreviatura_TipDoc FROM TipDocumento
	  SET NOCOUNT OFF
	 END 


GO
/****** Object:  StoredProcedure [dbo].[spListarUnidMed]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	-- Listado -----------------
	CREATE PROCEDURE [dbo].[spListarUnidMed]
	as
	BEGIN
	 SET NOCOUNT ON
       SELECT Id_Umed, Codigo_Umed, Descripcion_Umed, Abreviatura_Umed,Estado_Umed FROM UnidadMedida WHERE Estado_Umed=1
	 SET NOCOUNT OFF
	 END


GO
/****** Object:  StoredProcedure [dbo].[spListaTipoPago]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		 ----------------------------------------------------

	    CREATE PROCEDURE [dbo].[spListaTipoPago]
		as
		 BEGIN
		 SET NOCOUNT ON
		  SELECT * FROM TipoPago
		 SET NOCOUNT OFF
		 END


GO
/****** Object:  StoredProcedure [dbo].[spListaVenta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListaVenta] --'2016-11-06','2016-12-08',0
		@prmfinicio date,
		@prmfin date,
		@prmidsucursal int
		as
		 BEGIN
		   DECLARE @TotalVentas TABLE(Id_Venta int,Codigo_Venta nchar(11),Estado_Venta nchar(1),Id_TipCom int,Nombre_TipCom varchar(50),Correlativo_Venta int,FechaVenta datetime,Igv_Venta int,Descuento_Venta decimal(10,2),Total decimal(10,2),Id_TipPago int,Utilidad decimal(10,2),Inversion decimal(10,2))
		  if(@prmidsucursal = 0)
		    BEGIN
			INSERT INTO @TotalVentas(Id_Venta,Codigo_Venta,Estado_Venta,Id_TipCom ,Nombre_TipCom ,Correlativo_Venta ,FechaVenta ,Igv_Venta ,Descuento_Venta,Total,Id_TipPago)
				SELECT v.Id_Venta,v.Codigo_Venta,v.Estado_Venta,tc.Id_TipCom,tc.Nombre_TipCom,v.Correlativo_Venta,v.FechaVenta,
				v.Igv_Venta,v.Descuento_Venta,ISNULL(SUM(dt.Total_Det),0)Total, tp.Id_TipPago
				FROM Venta v LEFT JOIN DetalleVenta dt ON v.Id_Venta= dt.Id_Venta_Det
				INNER JOIN TipoComprobante tc ON v.Id_TipCom_Venta = tc.Id_TipCom 
				INNER JOIN TipoPago tp ON v.Id_TipPago_Venta=tp.Id_TipPago
				GROUP BY v.Id_Venta,v.Codigo_Venta,v.Igv_Venta,v.Estado_Venta,v.FechaVenta,v.Correlativo_Venta,tc.Nombre_TipCom,
				tp.Id_TipPago,tc.Id_TipCom,v.Descuento_Venta,v.Id_Suc_Venta
				HAVING CONVERT(date,v.FechaVenta) BETWEEN @prmfinicio and @prmfin
				ORDER BY v.FechaVenta DESC 
			END
			 ELSE 
			 BEGIN

			 INSERT INTO @TotalVentas(Id_Venta,Codigo_Venta,Estado_Venta,Id_TipCom ,Nombre_TipCom ,Correlativo_Venta ,FechaVenta ,Igv_Venta ,Descuento_Venta,Total,Id_TipPago)
			 SELECT v.Id_Venta,v.Codigo_Venta,v.Estado_Venta,tc.Id_TipCom,tc.Nombre_TipCom,v.Correlativo_Venta,v.FechaVenta,
				v.Igv_Venta,v.Descuento_Venta,ISNULL(SUM(dt.Total_Det),0)Total, tp.Id_TipPago
				FROM Venta v LEFT JOIN DetalleVenta dt ON v.Id_Venta= dt.Id_Venta_Det
				INNER JOIN TipoComprobante tc ON v.Id_TipCom_Venta = tc.Id_TipCom INNER JOIN TipoPago tp ON v.Id_TipPago_Venta=tp.Id_TipPago
				GROUP BY v.Id_Venta,v.Codigo_Venta,v.Igv_Venta,v.Estado_Venta,v.FechaVenta,v.Correlativo_Venta,tc.Nombre_TipCom,
				tp.Id_TipPago,tc.Id_TipCom,v.Descuento_Venta,v.Id_Suc_Venta
				HAVING CONVERT(date,v.FechaVenta) BETWEEN @prmfinicio and @prmfin and v.Id_Suc_Venta = @prmidsucursal
				ORDER BY v.FechaVenta DESC
			 END

			 /*CREAMOS CURSOR PARA RECORRER Y ACTUALIZAR UTILIDADES POR VENTA*/

			 DECLARE CursorVentas CURSOR FOR SELECT Id_Venta FROM @TotalVentas
			 OPEN CursorVentas
			   DECLARE @IDTemp int
			    FETCH CursorVentas INTO @IDTemp
				WHILE(@@FETCH_STATUS = 0)
				 BEGIN
				  DECLARE @Utilidad decimal(10,2)
				  DECLARE @MontoVendido decimal(10,2)
				  DECLARE @MontoComprado decimal(10,2)

				 SET @MontoVendido =  (SELECT Venta.Total - dscto.Descuento_Venta  FROM(SELECT SUM(Total_Det) total  FROM  DetalleVenta WHERE Id_Venta_Det = @IDTemp) AS Venta,  (SELECT Descuento_Venta FROM Venta  WHERE  Id_Venta = @IDTemp)as dscto)
			--	 SELECT @MontoVendido VENDIDO
				 SET @MontoComprado = (SELECT SUM(p.PrecioCompra_Prod * dt.Cantidad_Det) FROM Producto p 
				 INNER JOIN  DetalleVenta dt ON p.Id_Prod = dt.Id_Prod_Det 
                 WHERE dt.Id_Venta_Det = @IDTemp)
				-- SELECT @MontoComprado COMRADO
				 SET  @Utilidad = (@MontoVendido - @MontoComprado)
				-- SELECT @Utilidad UTILIDAD
				UPDATE @TotalVentas SET Utilidad = ISNULL(@Utilidad,0), Inversion = ISNULL(@MontoComprado,0) WHERE Id_Venta = @IDTemp
				 FETCH CursorVentas INTO @IDTemp
				 END
			 CLOSE CursorVentas
			 DEALLOCATE CursorVentas


		  SELECT * FROM @TotalVentas
		 END

GO
/****** Object:  StoredProcedure [dbo].[spMostrarCabeceraVenta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[spMostrarCabeceraVenta] 
		 @prmid_venta int
		 as
		  BEGIN
		   SELECT v.Codigo_Venta,v.Serie_Venta,v.Correlativo_Venta,v.Igv_Venta,v.FechaVenta,v.Estado_Venta,v.Descuento_Venta,v.Desc_Venta,
		          c.Nombre_Cliente,td.Nombre_TipDoc,c.NumeroDoc_Cliente,u.Nombre_Usuario,s.Direccion_Suc,tc.Nombre_TipCom,m.Descripcion_Moneda,
		          tp.Descripcion_TipPago
		   FROM Venta v INNER JOIN Cliente c ON v.Id_Cliente_Venta=c.Id_Cliente 
		   INNER JOIN TipDocumento td  ON td.Id_TipDoc=c.Id_TipDoc_Cliente 
		   INNER JOIN Usuario u ON v.Id_Usuario_Venta = u.Id_Usuario 
		   INNER JOIN Sucursal s ON v.Id_Suc_Venta = s.Id_Suc
		   INNER JOIN TipoComprobante TC ON v.Id_TipCom_Venta = tc.Id_TipCom
		   INNER JOIN Moneda m ON M.Id_Moneda = V.Id_Moneda_Venta
		   INNER JOIN TipoPago tp ON tp.Id_TipPago = v.Id_TipPago_Venta 
		   WHERE v.Id_Venta= @prmid_venta

		   SELECT p.Codigo_Prod,p.Nombre_Prod,p.Precio_Prod, dv.PrecProd_Det, dv.Cantidad_Det, dv.Total_Det 
			FROM DetalleVenta dv INNER JOIN Producto p ON dv.Id_Prod_Det=p.Id_Prod
			WHERE dv.Id_Venta_Det = @prmid_venta
		  END



		 
GO
/****** Object:  StoredProcedure [dbo].[spMostrarCodSuc]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[spMostrarCodSuc] 
 @prmIdSuc int
 as
 BEGIN
 SET NOCOUNT ON
   SELECT Codigo_Suc FROM Sucursal WHERE Id_Suc=@prmIdSuc
 SET NOCOUNT OFF
 END


GO
/****** Object:  StoredProcedure [dbo].[spMostrarDescNivel]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE PROCEDURE [dbo].[spMostrarDescNivel]
 @prmNivelAcceso int
 as
 BEGIN
  SELECT Descripcion_NivelAcc FROM NivelAcceso WHERE Id_NivelAcc=@prmNivelAcceso
 END


GO
/****** Object:  StoredProcedure [dbo].[spMostrarDetalleVenta]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMostrarDetalleVenta]
		  @prmid_venta int
		   as
		    BEGIN
			SELECT p.Codigo_Prod,p.Nombre_Prod,p.Precio_Prod, dv.PrecProd_Det, dv.Cantidad_Det, dv.Total_Det 
			FROM DetalleVenta dv INNER JOIN Producto p ON dv.Id_Prod_Det=p.Id_Prod
			WHERE dv.Id_Venta_Det = @prmid_venta
			END

GO
/****** Object:  StoredProcedure [dbo].[spVerificarAcceso]    Script Date: 29/09/2017 22:16:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Script solo procedimientos almacenados
  Estandares: 
             - Nombre Procedure--> sp + Nombre atribuido(Inicial mayuscula) 
			 - se usa try catch para procedimientos extensos
			 - nombre del procedure en singular o nombre de accion ejemplo: Verfificar - registrar - calcular - mostrar
*/

--Procedure Acceso al sistema

  CREATE PROCEDURE [dbo].[spVerificarAcceso]
  @prmUsuario nvarchar(8),
  @prmpassword nvarchar(50)
  AS
   BEGIN
     SET NOCOUNT ON
	   SELECT u.Id_Usuario, u.Codigo_Usuario,  Id_Suc_Usuario, Nombre_Usuario, Login_Usuario,
	        Estado_Usuario, Expiracion_Usuario,na.Id_NivelAcc,na.Numero_NivelAcc,s.Id_Suc,s.Direccion_Suc FROM Usuario u INNER JOIN NivelAcceso na ON
			u.Id_nivelAcc_Usuario = na.Id_NivelAcc INNER JOIN Sucursal s ON
			U.Id_Suc_Usuario = s.Id_Suc
	     WHERE Login_Usuario = @prmUsuario AND dbo.fnDesencriptarPass(Password_Usuario) = @prmpassword	                                  
	 SET NOCOUNT OFF
   END


GO
USE [master]
GO
ALTER DATABASE [BDAYDTest] SET  READ_WRITE 
GO
