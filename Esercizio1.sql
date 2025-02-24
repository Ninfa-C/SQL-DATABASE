USE [Esercizio1]
GO
/****** Object:  Table [dbo].[Cantiere]    Script Date: 24/02/2025 14:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cantiere](
	[IdCantiere] [uniqueidentifier] NOT NULL,
	[DenominazioneCantiere] [varchar](25) NOT NULL,
	[Indirizzo] [varchar](250) NOT NULL,
	[Città] [varchar](50) NOT NULL,
	[CAP] [int] NOT NULL,
	[PersonaRiferimento] [nchar](10) NOT NULL,
	[DataInizioLavori] [datetime] NOT NULL,
	[DataFineLavori] [datetime] NULL,
	[LavoriTerminatiSI_NO] [bit] NOT NULL,
 CONSTRAINT [PK_Cantiere] PRIMARY KEY CLUSTERED 
(
	[IdCantiere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/02/2025 14:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cognome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operaio]    Script Date: 24/02/2025 14:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operaio](
	[IdDipendente] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cognome] [varchar](50) NOT NULL,
	[CF] [varchar](16) NOT NULL,
	[FigliACarico] [int] NULL,
	[Sposato] [bit] NOT NULL,
 CONSTRAINT [PK_Operaio] PRIMARY KEY CLUSTERED 
(
	[IdDipendente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
