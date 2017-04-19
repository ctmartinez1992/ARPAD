IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DocumentosFaturacaoLinhas')
CREATE TABLE [dbo].[DocumentosFaturacaoLinhas](
	[flstamp] [char](25) NOT NULL,
	[ftstamp] [char](25) NOT NULL,
	[nomedocumento] [varchar](20) NOT NULL,
	[anodocumento] [numeric](4, 0) NOT NULL,
	[numerodocumento] [varchar](20) NOT NULL,
	[datadocumento] [datetime] NOT NULL,
	[lordem] [numeric](10, 0) NOT NULL,
	[armazem] [numeric](5, 0) NOT NULL,
	[centrocusto] [varchar](20) NOT NULL,
	[produto] [char](18) NULL,
	[quantidade] [numeric](14, 4) NOT NULL,
	[iva] [numeric](19, 2) NOT NULL,
	[precounitario] [numeric](19, 6) NOT NULL,
	[valoriliquido] [numeric](19, 6) NOT NULL,
	[valordesconto] [numeric](19, 6) NOT NULL,
	[valortotal] [numeric](19, 6) NOT NULL,
	[precocusto] [numeric](19, 6) NOT NULL,
	[pcustoponderado] [numeric](19, 6) NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL
)
ELSE
	TRUNCATE TABLE DocumentosFaturacaoLinhas