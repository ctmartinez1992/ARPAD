IF NOT EXISTS (SELECT name from sys.tables
				WHERE name = 'FactFaturacaoLinhasDQP')
	CREATE TABLE [dbo].[FactFaturacaoLinhasDQP]
	(
		[flstamp] [char](25) NOT NULL,
		[ftstamp] [char](25) NOT NULL,
		[nomedocumento] [varchar](20) NOT NULL,
	    [anodocumento] [numeric](4, 0) NOT NULL,
	    [numerodocumento] [varchar](20) NOT NULL,
	    [datadocumento] [datetime] NOT NULL,
	    [lordem] [numeric](10, 0) NOT NULL,
	    [centrocusto] [varchar](20) NOT NULL,
		[armazem] [numeric](5, 0) NOT NULL,
		[produto] [char](18) NULL,
		[quantidade] [numeric](14, 4) NOT NULL,
		[iva] [numeric](19, 2) NOT NULL,
	    [frete] [numeric](19, 6) NULL,
		[precounitario] [numeric](19, 6) NOT NULL,
		[valoriliquido] [numeric](19, 6) NOT NULL,
		[valordesconto] [numeric](19, 6) NOT NULL,
		[valortotal] [numeric](19, 6) NOT NULL,
		[precocusto] [numeric](19, 6) NOT NULL,
		[pcustoponderado] [numeric](19, 6) NOT NULL,
		[cliente] [numeric](10, 0) NOT NULL,
	    [segmento] [varchar](25) NOT NULL,
		[funcionario] [numeric](6, 0) NOT NULL,
		[zona] [numeric](5, 0) NOT NULL,
		[vendedor] [numeric](4, 0) NOT NULL,
		[datapagamento] [datetime] NOT NULL,
		[moeda] [varchar](11) NOT NULL,
		[tipo] [varchar](20) NOT NULL,
		DQP nvarchar(100)
	)
ELSE
	TRUNCATE TABLE FactFaturacaoLinhasDQP