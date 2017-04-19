IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FactFaturacaoLinhasClienteMesDQP')
BEGIN
	CREATE TABLE [dbo].FactFaturacaoLinhasClienteMesDQP(
		[ClienteKey] [int] NOT NULL,
		[Year] [int] NOT NULL,
		[Semester] [tinyint] NOT NULL,
		[Trimester] [tinyint] NOT NULL,
		[Quarter] [tinyint] NOT NULL,
		[Month] [tinyint] NOT NULL,
		[MonthName] [nvarchar](10) NOT NULL,
		[Quantidade] [numeric](14, 0) NOT NULL,
		[PrecoUnidade] [numeric](19, 6) NOT NULL,
		[FreteUnidade] [numeric](19, 6) NOT NULL,
		[ValorIliquido] [numeric](19, 6) NOT NULL,
		[ValorDesconto] [numeric](19, 6) NOT NULL,
		[PrecoCusto] [numeric](19, 6) NOT NULL,
		[PrecoCustoPonderado] [numeric](19, 6) NOT NULL,
		[TotalIliquidoClientes] [numeric](19, 6) NOT NULL,
		[TotalIVA] [numeric](19, 6) NOT NULL,
		[TotalFrete] [numeric](19, 6) NOT NULL,
		[TotalFinal] [numeric](19, 6) NOT NULL,
		[TotalCusto] [numeric](19, 6) NOT NULL,
		[Lucro] [numeric](19, 6) NOT NULL,
		[DQP] [nvarchar](100)
	)
END
ELSE
	TRUNCATE TABLE FactFaturacaoLinhasClienteMesDQP
