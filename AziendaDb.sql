USE [AziendaManagement]
GO
/****** Object:  Table [dbo].[Impiegati]    Script Date: 27/02/2025 15:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impiegati](
	[IDImpiegato] [uniqueidentifier] NOT NULL,
	[nome] [nvarchar](100) NOT NULL,
	[cognome] [nvarchar](100) NOT NULL,
	[CodiceFiscale] [nvarchar](16) NOT NULL,
	[Età] [int] NOT NULL,
	[RedditoMensile] [decimal](10, 2) NOT NULL,
	[DetrazioneFiscale] [bit] NOT NULL,
	[IDImpiego] [uniqueidentifier] NOT NULL,
	[Assunzione] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDImpiegato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CodiceFiscale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impieghi]    Script Date: 27/02/2025 15:47:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impieghi](
	[IDImpiego] [uniqueidentifier] NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDImpiego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Impiegati]  WITH CHECK ADD  CONSTRAINT [FK_Impiegati_Impiego] FOREIGN KEY([IDImpiego])
REFERENCES [dbo].[Impieghi] ([IDImpiego])
GO
ALTER TABLE [dbo].[Impiegati] CHECK CONSTRAINT [FK_Impiegati_Impiego]
GO
