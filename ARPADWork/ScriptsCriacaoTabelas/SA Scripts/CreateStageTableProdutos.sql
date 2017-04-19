IF NOT EXISTS (SELECT name FROM sys.tables where name = 'Produtos')
CREATE TABLE [dbo].[Produtos](	
	[referencia] [char](18) NOT NULL,
	[designacao] [char](60) NOT NULL,
	[familia] [varchar](18) NOT NULL,
	[stockinicial] [numeric](13, 3) NOT NULL,
	[precovenda] [numeric](19, 6) NOT NULL,
	[pontoencomenda] [numeric](10, 3) NOT NULL,
	[fornecedor] [numeric](10, 0) NULL,
	[stockmaximo] [numeric](13, 3) NOT NULL,
	[stockminimo] [numeric](13, 3) NOT NULL,
	[dataabertura] [datetime] NOT NULL,
	[categoria] [int] NOT NULL,
	[classificacao] [varchar](20) NOT NULL,
	[precocusto] [numeric](19, 6) NOT NULL,
	[pcustoponderado] [numeric](19, 6) NOT NULL,
	[ultimoprecocusto] [numeric](19, 6) NOT NULL,
	[precomediovenda] [numeric](19, 6) NOT NULL,
	[ultimoprecovenda] [numeric](19, 6) NOT NULL,
	[quantidadecativa] [numeric](13, 3) NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL,
	[taxaiva] [numeric](2, 0) NOT NULL
	)
ELSE
	TRUNCATE TABLE Produtos