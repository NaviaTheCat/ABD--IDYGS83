CREATE DATABASE Examen_U2_RICARDO_BELTRAN
lCREATE TABLE [dbo].[Ciudad](
	[PkCiudad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Estado] [nchar](10) NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[PkCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/03/2026 05:33:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[PkCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[Telefono] [varchar](10) NULL,
	[Correo] [varchar](20) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[PkCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 10/03/2026 05:33:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[PkHotel] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](max) NULL,
	[FkCiudad] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[PkHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 10/03/2026 05:33:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[PkMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NULL,
 CONSTRAINT [PK_MetodoPago] PRIMARY KEY CLUSTERED 
(
	[PkMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 10/03/2026 05:33:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[PkReserva] [int] IDENTITY(1,1) NOT NULL,
	[FkCliente] [int] NULL,
	[FkHotel] [int] NULL,
	[FechadeReserva] [date] NULL,
	[Noches] [int] NULL,
	[FKMetodoPago] [int] NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[PkReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 

INSERT [dbo].[Ciudad] ([PkCiudad], [Nombre], [Estado]) VALUES (1, N'Cancún    ', N'Qroo      ')
INSERT [dbo].[Ciudad] ([PkCiudad], [Nombre], [Estado]) VALUES (2, N'México    ', N'CDMX      ')
INSERT [dbo].[Ciudad] ([PkCiudad], [Nombre], [Estado]) VALUES (3, N'Texas     ', N'Baja Ca   ')
INSERT [dbo].[Ciudad] ([PkCiudad], [Nombre], [Estado]) VALUES (4, N'Mérida    ', N'Yucatan   ')
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (1, N'Jose', N'Sosa', N'9988774455', NULL)
INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (2, N'Jhon ', N'Miller', N'5544778899', NULL)
INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (3, N'Diana', N'Nelson', N'5544112266', NULL)
INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (4, N'Daniel', N'Scott', N'8855997755', NULL)
INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (5, N'Paco', N'Hume', N'5566889977', NULL)
INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (7, N'Fernando', N'Hernandez', N'8899774466', NULL)
INSERT [dbo].[Cliente] ([PkCliente], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (8, N'Gala', N'Lopez', N'2233558899', NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (1, N'Paradisus Cancun All Inclusive', N'Paradisus Cancun All Inclusive se sitúa en Cancún. Ofrece wi-fi gratis en zonas comunes, servicio de spa y sauna, además de servicio de masajes.', 1, CAST(7667 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (2, N'ME Cabo', N'Frente a la playa El Médano, ME Cabo se sitúa en Cabo San Lucas, a 45 minutos del aeropuerto internacional de San José del Cabo. Cuenta con club de playa Taboo, piscina y bañera / tina de hidromasaje, así como servicio de spa Korpo. Hay wifi gratis.', 3, CAST(11067 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (3, N'Grand Oasis Cancun', N'Situado frente al mar, en la zona hotelera de Cancún, el Grand Oasis Cancun All Inclusive dispone de piscina con vista al océano y régimen all inclusive.', 1, CAST(4992 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (4, N'Riu Dunamar', N'Con 5 piscinas al aire libre, el Riu Dunamar All Inclusive está situado frente a Playa Costa Mujeres, en Cancún. La propiedad cuenta con el Splash Water World, un parque acuático con toboganes, además de régimen all inclusive 24h.', 1, CAST(4500 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (5, N'Hotel Sevilla Palace', N'Ubicado en Paseo de la Reforma, Hotel Sevilla Palace está a 400 m del Metrobus Reforma, a 15 minutos caminando de El Ángel de la Independencia y a 2.5 km del Zócalo de Ciudad de México. Dispone de piscina climatizada cubierta en la azotea, gimnasio y Wi-Fi gratuito. ', 2, CAST(1824 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (6, N'Galeria Plaza Reforma', N'Ubicado a 350 m del Ángel de la Independencia y del Paseo de la Reforma en Ciudad de México, el hotel Galería Plaza Reforma se encuentra a 10 minutos a pie de la estación de metro Insurgentes y a 30 minutos en coche del Aeropuerto Internacional de la Ciudad de México ', 2, CAST(3123 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (7, N'Hyatt Regency', N'Situado en Mérida, en el Paseo Montejo, el Hyatt Regency Mérida posee piscina al aire libre y cancha de tenis, además de una sala de reuniones para hasta 650 personas.', 4, CAST(4772 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (8, N'Gran Real Yucatán', N'El Hotel Gran Real Yucatán se encuentra en el centro de la ciudad de Mérida, a 700m de la Plaza Principal y a 800m del Mercado Principal Lucas de Galvez. El hotel cuenta con una piscina rasa para relajarse con solárium al lado, servicio de masaje y Wi-Fi gratuito.', 4, CAST(1118 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (9, N'Los Aluxes By Tukan', N'Los Aluxes By Tukan se encuentra en Mérida. Cuenta con piscina al aire libre todo el año, wi-fi gratis en zonas comunes y valet parking.', 4, CAST(851 AS Decimal(18, 0)))
INSERT [dbo].[Hotel] ([PkHotel], [Nombre], [Descripcion], [FkCiudad], [Precio]) VALUES (10, N'Pueblo Bonito Sunset', N'El Pueblo Bonito Sunset Beach está en el extremo occidental de la Península de Baja California, con vista al Océano Pacífico y en una prístina playa privada en Cabo San Lucas, México.', 3, CAST(13443 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([PkMetodoPago], [Nombre]) VALUES (1, N'Efectivo  ')
INSERT [dbo].[MetodoPago] ([PkMetodoPago], [Nombre]) VALUES (2, N'Crédito   ')
INSERT [dbo].[MetodoPago] ([PkMetodoPago], [Nombre]) VALUES (3, N'Puntos    ')
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (1, 1, 2, CAST(N'2022-10-25' AS Date), 2, 2, 1)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (2, 2, 1, CAST(N'2022-10-20' AS Date), 2, 1, 1)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (3, 3, 4, CAST(N'2022-10-01' AS Date), 3, 1, 1)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (4, 4, 5, CAST(N'2022-10-15' AS Date), 2, 3, 1)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (5, 5, 8, CAST(N'2022-10-17' AS Date), 1, 1, 1)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (9, 7, 6, CAST(N'2022-10-11' AS Date), 2, 1, 1)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (10, 1, 5, CAST(N'2022-11-01' AS Date), 2, 2, 0)
INSERT [dbo].[Reserva] ([PkReserva], [FkCliente], [FkHotel], [FechadeReserva], [Noches], [FKMetodoPago], [Estatus]) VALUES (11, 4, 9, CAST(N'2022-11-02' AS Date), 2, 2, 1)
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Ciudad] FOREIGN KEY([FkCiudad])
REFERENCES [dbo].[Ciudad] ([PkCiudad])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Ciudad]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([FkCliente])
REFERENCES [dbo].[Cliente] ([PkCliente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Hotel] FOREIGN KEY([FkHotel])
REFERENCES [dbo].[Hotel] ([PkHotel])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Hotel]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_MetodoPago] FOREIGN KEY([FKMetodoPago])
REFERENCES [dbo].[MetodoPago] ([PkMetodoPago])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_MetodoPago]
GO


--SELECT * FROM Cliente
--SELECT * FROM Hotel
--SELECT * FROM MetodoPago
--SELECT * FROM Ciudad
--SELECT * FROM Reserva

--Pregunta de examen
CREATE PROCEDURE spBuscarClienteCiudad
@NombreCliente VARCHAR(20),
@NombreCiudad VARCHAR(50) 
AS
BEGIN
	SELECT UPPER(CONCAT(C.Nombre,' ',C.Apellido)) AS 'Nombre completo',
		   C.Telefono AS 'Telefono',
		   H.Nombre AS 'Nombre Hotel',
		   CONCAT(CI.Nombre,'',CI.Estado) AS 'Ciudad y estado',
		   R.FechadeReserva AS 'Fecha de reserva',
		   GETDATE() AS 'Fecha de Hoy',
		   R.Noches * H.Precio AS 'Precio total',
		   (R.Noches * H.Precio) * 16 AS 'Precio Total USD',
		   (R.Noches * H.Precio) * 20 AS 'Precio Total EUROS',
		   M.Nombre AS 'Metodo de pago'
		   FROM Reserva AS R
		   LEFT JOIN Cliente AS C ON R.FkCliente = C.PkCliente
		   LEFT JOIN Hotel AS H ON R.FkHotel = H.PkHotel
		   LEFT JOIN Ciudad AS CI ON H.FkCiudad = CI.PkCiudad
		   LEFT JOIN MetodoPago AS M ON R.FKMetodoPago = M.PkMetodoPago
		   WHERE (R.Estatus = 1) AND 
		   (CI.Nombre LIKE @NombreCiudad OR @NombreCiudad IS NULL) AND 
		   (@NombreCliente IS NULL OR C.Nombre LIKE @NombreCliente)
		   ORDER BY H.Nombre ASC
END

EXEC spBuscarClienteCiudad NULL, NULL
