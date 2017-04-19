IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DocumentosFaturacao')
CREATE TABLE [dbo].[DocumentosFaturacao](
	[ftstamp] [char](25) NOT NULL,
	[nomedocumento] [varchar](20) NOT NULL,
	[anodocumento] [numeric](4, 0) NOT NULL,
	[numerodocumento] [numeric](10, 0) NOT NULL,
	[datadocumento] [datetime] NOT NULL,
	[cliente] [numeric](10, 0) NOT NULL,
	[funcionario] [numeric](6, 0) NOT NULL,
	[zona] [numeric](5, 0) NOT NULL,
	[vendedor] [numeric](4, 0) NOT NULL,
	[datapagamento] [datetime] NOT NULL,
	[moeda] [varchar](11) NOT NULL,
	[centrocusto] [varchar](20) NOT NULL,
	[segmento] [varchar](25) NOT NULL,
	[quantidadetotal] [numeric](15, 3) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[totaliliquidoprods] [numeric](19, 6) NOT NULL,
	[totaldesconto] [numeric](19, 6) NOT NULL,
	[frete] [numeric](19, 6) NULL,
	[totalbaseincidencia] [numeric](19, 6) NOT NULL,
	[totaliva] [numeric](19, 6) NOT NULL,
	[totalfinal] [numeric](19, 6) NOT NULL,
	[totalcusto] [numeric](19, 6) NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL
)
ELSE
	TRUNCATE TABLE DocumentosFaturacao