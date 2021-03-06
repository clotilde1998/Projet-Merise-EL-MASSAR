USE [el_massar db]
GO
/****** Object:  Table [dbo].[AgentCommercial]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentCommercial](
	[id_agent] [int] NOT NULL,
	[nom_agent] [varchar](20) NOT NULL,
	[prenom_agent] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_agent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appartement]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appartement](
	[id_appart] [int] NOT NULL,
	[surface] [varchar](50) NOT NULL,
	[type_appart] [varchar](200) NOT NULL,
	[id_resid] [int] NOT NULL,
	[id_reservation] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_appart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategorieGarage]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorieGarage](
	[id_cat] [int] NOT NULL,
	[nom_cat] [varchar](20) NOT NULL,
	[prix_cat] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_client] [int] NOT NULL,
	[nom_client] [varchar](30) NOT NULL,
	[prenom_client] [varchar](30) NOT NULL,
	[adresse] [varchar](40) NULL,
	[code_postal_client] [varchar](30) NULL,
	[tel_client] [varchar](20) NULL,
	[anciennete] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etage]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etage](
	[id_etage] [int] NOT NULL,
	[niveau_etage] [varchar](20) NULL,
	[nom_residence] [varchar](100) NOT NULL,
	[id_reservation] [int] NOT NULL,
	[id_resid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_etage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Garage]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garage](
	[id_garage] [int] NOT NULL,
	[nom_garage] [varchar](30) NULL,
	[type_garage] [varchar](50) NULL,
	[id_resid] [int] NOT NULL,
	[id_reservation] [int] NOT NULL,
	[id_cat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_garage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[id_reservation] [int] NOT NULL,
	[date_reservation] [date] NOT NULL,
	[nature_reservation] [varchar](200) NOT NULL,
	[id_agent] [int] NOT NULL,
	[id_client] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_reservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Residence]    Script Date: 09/02/2022 10:27:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Residence](
	[id_resid] [int] NOT NULL,
	[nom_resid] [varchar](40) NOT NULL,
	[rue_resid] [varchar](40) NOT NULL,
	[ville_resid] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_resid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appartement]  WITH CHECK ADD  CONSTRAINT [fk_id_reserv] FOREIGN KEY([id_reservation])
REFERENCES [dbo].[Reservation] ([id_reservation])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appartement] CHECK CONSTRAINT [fk_id_reserv]
GO
ALTER TABLE [dbo].[Appartement]  WITH CHECK ADD  CONSTRAINT [fk_id_reside] FOREIGN KEY([id_resid])
REFERENCES [dbo].[Residence] ([id_resid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appartement] CHECK CONSTRAINT [fk_id_reside]
GO
ALTER TABLE [dbo].[Etage]  WITH CHECK ADD  CONSTRAINT [fk_id_reservat] FOREIGN KEY([id_reservation])
REFERENCES [dbo].[Reservation] ([id_reservation])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Etage] CHECK CONSTRAINT [fk_id_reservat]
GO
ALTER TABLE [dbo].[Etage]  WITH CHECK ADD  CONSTRAINT [fk_residd] FOREIGN KEY([id_resid])
REFERENCES [dbo].[Residence] ([id_resid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Etage] CHECK CONSTRAINT [fk_residd]
GO
ALTER TABLE [dbo].[Garage]  WITH CHECK ADD  CONSTRAINT [fk_id_cat] FOREIGN KEY([id_cat])
REFERENCES [dbo].[CategorieGarage] ([id_cat])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Garage] CHECK CONSTRAINT [fk_id_cat]
GO
ALTER TABLE [dbo].[Garage]  WITH CHECK ADD  CONSTRAINT [fk_id_reservation] FOREIGN KEY([id_reservation])
REFERENCES [dbo].[Reservation] ([id_reservation])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Garage] CHECK CONSTRAINT [fk_id_reservation]
GO
ALTER TABLE [dbo].[Garage]  WITH CHECK ADD  CONSTRAINT [fk_id_resid] FOREIGN KEY([id_resid])
REFERENCES [dbo].[Residence] ([id_resid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Garage] CHECK CONSTRAINT [fk_id_resid]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [fk_id_agent] FOREIGN KEY([id_agent])
REFERENCES [dbo].[AgentCommercial] ([id_agent])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [fk_id_agent]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [fk_id_client] FOREIGN KEY([id_client])
REFERENCES [dbo].[Client] ([id_client])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [fk_id_client]
GO
