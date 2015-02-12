ALTER TABLE [dbo].[documenti] DROP CONSTRAINT FK_documenti_Apparecchi
GO

ALTER TABLE [dbo].[elencoSW] DROP CONSTRAINT FK_elencoSW_Apparecchi
GO

ALTER TABLE [dbo].[stampanti] DROP CONSTRAINT rel1n elenoposizioni_id - stampanti_posizione
GO

ALTER TABLE [dbo].[stampanti] DROP CONSTRAINT rel1n modellistampante_id - stampanti_modello
GO

ALTER TABLE [dbo].[ElencoOpzioniStampanti] DROP CONSTRAINT rel1n-opzionistampanti_id-ElencoOpzionistampanti_IDopzione
GO

ALTER TABLE [dbo].[elencoSW] DROP CONSTRAINT FK_elencoSW_software
GO

ALTER TABLE [dbo].[ElencoOpzioniStampanti] DROP CONSTRAINT FK_ElencoOpzioniStampanti_stampanti
GO

ALTER TABLE [dbo].[Apparecchi] DROP CONSTRAINT FK_Apparecchi_TipiApparecchi
GO

ALTER TABLE [dbo].[documenti] DROP CONSTRAINT FK_documenti_Utenti
GO

/****** Object:  Table [dbo].[AdminScript]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[AdminScript]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AdminScript]
GO

/****** Object:  Table [dbo].[Apparecchi]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Apparecchi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Apparecchi]
GO

/****** Object:  Table [dbo].[Caratteristiche]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Caratteristiche]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Caratteristiche]
GO

/****** Object:  Table [dbo].[Configurazione]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Configurazione]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Configurazione]
GO

/****** Object:  Table [dbo].[cronologia]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[cronologia]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[cronologia]
GO

/****** Object:  Table [dbo].[datiOggetti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[datiOggetti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[datiOggetti]
GO

/****** Object:  Table [dbo].[Diritti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Diritti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Diritti]
GO

/****** Object:  Table [dbo].[documenti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[documenti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[documenti]
GO

/****** Object:  Table [dbo].[Elementi]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Elementi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Elementi]
GO

/****** Object:  Table [dbo].[ElencoOpzioniStampanti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[ElencoOpzioniStampanti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ElencoOpzioniStampanti]
GO

/****** Object:  Table [dbo].[ElencoPosizioni]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[ElencoPosizioni]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ElencoPosizioni]
GO

/****** Object:  Table [dbo].[elencoSW]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[elencoSW]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[elencoSW]
GO

/****** Object:  Table [dbo].[hardware]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[hardware]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[hardware]
GO

/****** Object:  Table [dbo].[Interventi]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Interventi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Interventi]
GO

/****** Object:  Table [dbo].[InterventiPC]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[InterventiPC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InterventiPC]
GO

/****** Object:  Table [dbo].[ModelliStampante]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[ModelliStampante]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ModelliStampante]
GO

/****** Object:  Table [dbo].[oggetti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[oggetti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[oggetti]
GO

/****** Object:  Table [dbo].[OpzioniStampanti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[OpzioniStampanti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[OpzioniStampanti]
GO

/****** Object:  Table [dbo].[QueryUtente]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[QueryUtente]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[QueryUtente]
GO

/****** Object:  Table [dbo].[riavvii]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[riavvii]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[riavvii]
GO

/****** Object:  Table [dbo].[software]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[software]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[software]
GO

/****** Object:  Table [dbo].[stampanti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[stampanti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[stampanti]
GO

/****** Object:  Table [dbo].[TipiApparecchi]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[TipiApparecchi]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipiApparecchi]
GO

/****** Object:  Table [dbo].[TipiDiritto]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[TipiDiritto]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipiDiritto]
GO

/****** Object:  Table [dbo].[TipiIntervento]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[TipiIntervento]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipiIntervento]
GO

/****** Object:  Table [dbo].[TipiInterventoPC]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[TipiInterventoPC]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipiInterventoPC]
GO

/****** Object:  Table [dbo].[TipiInterventoPCRighe]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[TipiInterventoPCRighe]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TipiInterventoPCRighe]
GO

/****** Object:  Table [dbo].[trakker]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[trakker]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[trakker]
GO

/****** Object:  Table [dbo].[Utenti]    Script Date: 15/10/2004 14.29.08 ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Utenti]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Utenti]
GO

/****** Object:  Table [dbo].[AdminScript]    Script Date: 15/10/2004 14.29.17 ******/
CREATE TABLE [dbo].[AdminScript] (
	[ID] [int] NOT NULL ,
	[Descrizione] [varchar] (100) NULL ,
	[Testo] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Apparecchi]    Script Date: 15/10/2004 14.29.17 ******/
CREATE TABLE [dbo].[Apparecchi] (
	[ID] [int] NOT NULL ,
	[Tipo] [int] NOT NULL ,
	[Descrizione] [nvarchar] (255) NULL ,
	[posizione] [nvarchar] (100) NULL ,
	[IPAddress] [nvarchar] (15) NULL ,
	[IDrete] [nvarchar] (50) NULL ,
	[SN] [nvarchar] (50) NULL ,
	[COA] [nvarchar] (50) NULL ,
	[Datainst] [smalldatetime] NULL ,
	[VNCPWD] [nvarchar] (50) NULL ,
	[CPU] [nvarchar] (50) NULL ,
	[RAM] [int] NULL ,
	[HD] [nvarchar] (50) NULL ,
	[marca] [nvarchar] (50) NULL ,
	[modello] [nvarchar] (30) NULL ,
	[marcamon] [nvarchar] (20) NULL ,
	[modmon] [nvarchar] (30) NULL ,
	[SNmon] [nvarchar] (50) NULL ,
	[pollici] [int] NULL ,
	[tipomon] [nvarchar] (7) NULL ,
	[skvideo] [nvarchar] (50) NULL ,
	[skrete1] [nvarchar] (50) NULL ,
	[skrete2] [nvarchar] (50) NULL ,
	[skrete3] [nvarchar] (50) NULL ,
	[audio] [nvarchar] (10) NULL ,
	[lettore1] [nvarchar] (50) NULL ,
	[lettore2] [nvarchar] (50) NULL ,
	[modlet1] [nvarchar] (50) NULL ,
	[modlet2] [nvarchar] (50) NULL ,
	[Note] [text] NULL ,
	[Utabit] [int] NULL ,
	[IPAddress2] [nvarchar] (15) NULL ,
	[Netmask] [nvarchar] (15) NULL ,
	[Netmask2] [nvarchar] (15) NULL ,
	[Gateway] [nvarchar] (15) NULL ,
	[Gateway2] [nvarchar] (15) NULL ,
	[AdminPWD] [nvarchar] (30) NULL ,
	[TipoGruppo] [char] (1) NULL ,
	[NomeGruppo] [nvarchar] (20) NULL ,
	[UserName] [nvarchar] (25) NULL ,
	[UserPWD] [nvarchar] (25) NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Caratteristiche]    Script Date: 15/10/2004 14.29.17 ******/
CREATE TABLE [dbo].[Caratteristiche] (
	[ID] [int] NOT NULL ,
	[Gruppo] [char] (3) NOT NULL ,
	[Descrizione] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Configurazione]    Script Date: 15/10/2004 14.29.17 ******/
CREATE TABLE [dbo].[Configurazione] (
	[ID] [int] NOT NULL ,
	[computer] [int] NULL ,
	[CPU] [nvarchar] (50) NULL ,
	[RAM] [int] NULL ,
	[HD] [nvarchar] (50) NULL ,
	[marca] [nvarchar] (50) NULL ,
	[modello] [nvarchar] (30) NULL ,
	[marcamon] [nvarchar] (20) NULL ,
	[modmon] [nvarchar] (30) NULL ,
	[SNmon] [nvarchar] (50) NULL ,
	[pollici] [int] NULL ,
	[tipo] [nvarchar] (7) NULL ,
	[skvideo] [nvarchar] (50) NULL ,
	[skrete1] [nvarchar] (50) NULL ,
	[skrete2] [nvarchar] (50) NULL ,
	[skrete3] [nvarchar] (50) NULL ,
	[audio] [nvarchar] (10) NULL ,
	[lettore1] [nvarchar] (50) NULL ,
	[lettore2] [nvarchar] (50) NULL ,
	[modlet1] [nvarchar] (50) NULL ,
	[modlet2] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[cronologia]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[cronologia] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Apparecchio] [int] NULL ,
	[data] [smalldatetime] NULL ,
	[evento] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[datiOggetti]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[datiOggetti] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[IDOggetto] [int] NOT NULL ,
	[Caratteristica] [varchar] (50) NOT NULL ,
	[Valore] [varchar] (255) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Diritti]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[Diritti] (
	[ID] [int] NOT NULL ,
	[utente] [int] NULL ,
	[diritto] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[documenti]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[documenti] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[PC] [int] NOT NULL ,
	[Documento] [varchar] (100) NULL ,
	[Commento] [varchar] (100) NULL ,
	[Tipo] [varchar] (50) NULL ,
	[IDUtente] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Elementi]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[Elementi] (
	[ID] [int] NOT NULL ,
	[Nome] [varchar] (50) NULL ,
	[Template] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ElencoOpzioniStampanti]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[ElencoOpzioniStampanti] (
	[ID] [int] NOT NULL ,
	[IDOpzione] [int] NOT NULL ,
	[CodStampante] [char] (5) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ElencoPosizioni]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[ElencoPosizioni] (
	[ID] [int] NOT NULL ,
	[Descrizione] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[elencoSW]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[elencoSW] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[computer] [int] NOT NULL ,
	[software] [int] NULL ,
	[SN] [nvarchar] (50) NULL ,
	[Versione] [nvarchar] (20) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[hardware]    Script Date: 15/10/2004 14.29.18 ******/
CREATE TABLE [dbo].[hardware] (
	[DESCTIPO] [nvarchar] (50) NULL ,
	[IPAddress] [nvarchar] (15) NULL ,
	[IDrete] [nvarchar] (50) NULL ,
	[SN] [nvarchar] (50) NULL ,
	[CPU] [nvarchar] (50) NULL ,
	[RAM] [int] NULL ,
	[HD] [nvarchar] (50) NULL ,
	[marca] [nvarchar] (50) NULL ,
	[modello] [nvarchar] (30) NULL ,
	[marcamon] [nvarchar] (20) NULL ,
	[modmon] [nvarchar] (30) NULL ,
	[SNmon] [nvarchar] (50) NULL ,
	[pollici] [int] NULL ,
	[tipo] [nvarchar] (7) NULL ,
	[skvideo] [nvarchar] (50) NULL ,
	[skrete1] [nvarchar] (50) NULL ,
	[skrete2] [nvarchar] (50) NULL ,
	[skrete3] [nvarchar] (50) NULL ,
	[audio] [nvarchar] (10) NULL ,
	[lettore1] [nvarchar] (50) NULL ,
	[lettore2] [nvarchar] (50) NULL ,
	[modlet1] [nvarchar] (50) NULL ,
	[modlet2] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Interventi]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[Interventi] (
	[ID] [int] NOT NULL ,
	[Stampante] [int] NOT NULL ,
	[Data] [datetime] NOT NULL ,
	[TipoIntervento] [int] NOT NULL ,
	[NStampe] [int] NULL ,
	[Note] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InterventiPC]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[InterventiPC] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[CodIntervento] [varchar] (5) NOT NULL ,
	[Nome] [varchar] (20) NOT NULL ,
	[Valore] [varchar] (50) NOT NULL ,
	[Apparecchio] [int] NOT NULL ,
	[data] [smalldatetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ModelliStampante]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[ModelliStampante] (
	[ID] [int] NOT NULL ,
	[Descrizione] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[oggetti]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[oggetti] (
	[IDOggetto] [int] NOT NULL ,
	[IDelemento] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OpzioniStampanti]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[OpzioniStampanti] (
	[ID] [int] NOT NULL ,
	[Descrizione] [varchar] (50) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[QueryUtente]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[QueryUtente] (
	[ID] [int] NOT NULL ,
	[IDUtente] [int] NULL ,
	[Descrizione] [varchar] (250) NULL ,
	[Testo] [text] NULL ,
	[Pubblica] [tinyint] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[riavvii]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[riavvii] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[dataora] [datetime] NULL ,
	[linea] [char] (20) NULL ,
	[IP] [char] (15) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[software]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[software] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[Descrizione] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[stampanti]    Script Date: 15/10/2004 14.29.19 ******/
CREATE TABLE [dbo].[stampanti] (
	[ID] [int] NOT NULL ,
	[Codice] [char] (5) NOT NULL ,
	[SN] [varchar] (30) NOT NULL ,
	[Modello] [int] NOT NULL ,
	[Posizione] [int] NULL ,
	[Firmware] [varchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TipiApparecchi]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[TipiApparecchi] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[descrizione] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TipiDiritto]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[TipiDiritto] (
	[ID] [int] NOT NULL ,
	[Diritto] [nvarchar] (50) NULL ,
	[Descrizione] [nvarchar] (255) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TipiIntervento]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[TipiIntervento] (
	[ID] [int] NOT NULL ,
	[Descrizione] [varchar] (255) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TipiInterventoPC]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[TipiInterventoPC] (
	[ID] [varchar] (5) NOT NULL ,
	[Descrizione] [text] NOT NULL ,
	[AuthLevel] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TipiInterventoPCRighe]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[TipiInterventoPCRighe] (
	[ID] [varchar] (5) NOT NULL ,
	[NomeControllo] [varchar] (50) NOT NULL ,
	[TipoControllo] [char] (1) NOT NULL ,
	[DescControllo] [text] NULL ,
	[Campo] [varchar] (20) NULL ,
	[Tabella] [varchar] (50) NULL ,
	[Azione] [char] (1) NULL ,
	[CampiFiltro] [text] NULL ,
	[ValoriFiltro] [text] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[trakker]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[trakker] (
	[ID] [int] NOT NULL ,
	[numero carrello] [nvarchar] (255) NULL ,
	[descrizione] [nvarchar] (255) NULL ,
	[IP address] [nvarchar] (255) NULL ,
	[note] [nvarchar] (255) NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Utenti]    Script Date: 15/10/2004 14.29.20 ******/
CREATE TABLE [dbo].[Utenti] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[UserName] [char] (20) NULL ,
	[Password] [char] (32) NULL ,
	[Livello] [smallint] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Apparecchi] WITH NOCHECK ADD 
	CONSTRAINT [PK_newap] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[cronologia] WITH NOCHECK ADD 
	CONSTRAINT [PK_cronologia] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[documenti] WITH NOCHECK ADD 
	CONSTRAINT [PK_documenti] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[elencoSW] WITH NOCHECK ADD 
	CONSTRAINT [PK_elencoSW] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[software] WITH NOCHECK ADD 
	CONSTRAINT [PK_software] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipiApparecchi] WITH NOCHECK ADD 
	CONSTRAINT [PK_TipiApparecchi] PRIMARY KEY  CLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AdminScript] WITH NOCHECK ADD 
	CONSTRAINT [PK_AdminSript] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Caratteristiche] WITH NOCHECK ADD 
	CONSTRAINT [PK_Caratteristiche] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] ,
	CONSTRAINT [IX_Caratteristiche] UNIQUE  NONCLUSTERED 
	(
		[Gruppo],
		[Descrizione]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[datiOggetti] WITH NOCHECK ADD 
	CONSTRAINT [PK_datiOggetti] PRIMARY KEY  NONCLUSTERED 
	(
		[IDOggetto],
		[Caratteristica]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Elementi] WITH NOCHECK ADD 
	CONSTRAINT [PK_Elementi] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ElencoOpzioniStampanti] WITH NOCHECK ADD 
	CONSTRAINT [PK_ElencoOpzioniStampanti] PRIMARY KEY  NONCLUSTERED 
	(
		[IDOpzione],
		[CodStampante]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ElencoPosizioni] WITH NOCHECK ADD 
	CONSTRAINT [PK_ElencoPosizioni] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] ,
	CONSTRAINT [IX_ElencoPosizioni] UNIQUE  NONCLUSTERED 
	(
		[Descrizione]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Interventi] WITH NOCHECK ADD 
	CONSTRAINT [DF_Interventi_Data] DEFAULT (getdate()) FOR [Data],
	CONSTRAINT [PK_Interventi] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[InterventiPC] WITH NOCHECK ADD 
	CONSTRAINT [PK_InterventiPC] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ModelliStampante] WITH NOCHECK ADD 
	CONSTRAINT [PK_ModelliStampante] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] ,
	CONSTRAINT [IX_ModelliStampante] UNIQUE  NONCLUSTERED 
	(
		[Descrizione]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[oggetti] WITH NOCHECK ADD 
	CONSTRAINT [PK_oggetti] PRIMARY KEY  NONCLUSTERED 
	(
		[IDOggetto]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[OpzioniStampanti] WITH NOCHECK ADD 
	CONSTRAINT [PK_OpzioniStampanti] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] ,
	CONSTRAINT [IX_OpzioniStampanti] UNIQUE  NONCLUSTERED 
	(
		[Descrizione]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[QueryUtente] WITH NOCHECK ADD 
	CONSTRAINT [PK_QueryUtente] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[riavvii] WITH NOCHECK ADD 
	CONSTRAINT [DF_riavvii_dataora] DEFAULT (getdate()) FOR [dataora],
	CONSTRAINT [PK_riavvii] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[stampanti] WITH NOCHECK ADD 
	CONSTRAINT [PK_stampanti] PRIMARY KEY  NONCLUSTERED 
	(
		[Codice]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] ,
	CONSTRAINT [IX_stampanti] UNIQUE  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipiIntervento] WITH NOCHECK ADD 
	CONSTRAINT [PK_TipiIntervento] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipiInterventoPC] WITH NOCHECK ADD 
	CONSTRAINT [PK_TipiInterventoPC_1] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TipiInterventoPCRighe] WITH NOCHECK ADD 
	CONSTRAINT [PK_TipiInterventoPC] PRIMARY KEY  NONCLUSTERED 
	(
		[ID],
		[NomeControllo]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] ,
	CONSTRAINT [IX_TipiInterventoPC] UNIQUE  NONCLUSTERED 
	(
		[NomeControllo],
		[TipoControllo]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Utenti] WITH NOCHECK ADD 
	CONSTRAINT [PK_Utenti] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

 CREATE  INDEX [IX_InterventiPC] ON [dbo].[InterventiPC]([ID]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

ALTER TABLE [dbo].[Apparecchi] ADD 
	CONSTRAINT [FK_Apparecchi_TipiApparecchi] FOREIGN KEY 
	(
		[Tipo]
	) REFERENCES [dbo].[TipiApparecchi] (
		[ID]
	)
GO

ALTER TABLE [dbo].[documenti] ADD 
	CONSTRAINT [FK_documenti_Apparecchi] FOREIGN KEY 
	(
		[PC]
	) REFERENCES [dbo].[Apparecchi] (
		[ID]
	),
	CONSTRAINT [FK_documenti_Utenti] FOREIGN KEY 
	(
		[IDUtente]
	) REFERENCES [dbo].[Utenti] (
		[ID]
	)
GO

ALTER TABLE [dbo].[ElencoOpzioniStampanti] ADD 
	CONSTRAINT [FK_ElencoOpzioniStampanti_stampanti] FOREIGN KEY 
	(
		[CodStampante]
	) REFERENCES [dbo].[stampanti] (
		[Codice]
	),
	CONSTRAINT [rel1n-opzionistampanti_id-ElencoOpzionistampanti_IDopzione] FOREIGN KEY 
	(
		[IDOpzione]
	) REFERENCES [dbo].[OpzioniStampanti] (
		[ID]
	)
GO

ALTER TABLE [dbo].[elencoSW] ADD 
	CONSTRAINT [FK_elencoSW_Apparecchi] FOREIGN KEY 
	(
		[computer]
	) REFERENCES [dbo].[Apparecchi] (
		[ID]
	),
	CONSTRAINT [FK_elencoSW_software] FOREIGN KEY 
	(
		[software]
	) REFERENCES [dbo].[software] (
		[ID]
	)
GO

ALTER TABLE [dbo].[stampanti] ADD 
	CONSTRAINT [rel1n elenoposizioni_id - stampanti_posizione] FOREIGN KEY 
	(
		[Posizione]
	) REFERENCES [dbo].[ElencoPosizioni] (
		[ID]
	),
	CONSTRAINT [rel1n modellistampante_id - stampanti_modello] FOREIGN KEY 
	(
		[Modello]
	) REFERENCES [dbo].[ModelliStampante] (
		[ID]
	)
GO

insert into utenti values ('Admin','084e0343a0486ff05530df6c705c8bb4',0)
insert into utenti values ('guest','084e0343a0486ff05530df6c705c8bb4',5)

