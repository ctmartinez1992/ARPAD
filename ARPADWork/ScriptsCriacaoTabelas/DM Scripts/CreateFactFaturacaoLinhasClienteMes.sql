IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FactFaturacaoLinhasClienteMes')
BEGIN
	CREATE TABLE [dbo].[FactFaturacaoLinhasClienteMes](
		[DateMesKey] [int] NOT NULL,
		[ClienteKey] [int] NOT NULL,
		[Quantidade] [numeric](14, 0) NOT NULL,
		[PrecoUnidade] [numeric](19, 6) NOT NULL,
		[FreteUnidade] [numeric](19, 6) NOT NULL,
		[ValorIliquido] [numeric](19, 6) NOT NULL,
		[ValorDesconto] [numeric](19, 6) NOT NULL,
		[PrecoCusto] [numeric](19, 6) NOT NULL,
		[PrecoCustoPonderado] [numeric](19, 6) NOT NULL,
		[TotalIliquidoProdutos] [numeric](19, 6) NOT NULL,
		[TotalIVA] [numeric](19, 6) NOT NULL,
		[TotalFrete] [numeric](19, 6) NOT NULL,
		[TotalFinal] [numeric](19, 6) NOT NULL,
		[TotalCusto] [numeric](19, 6) NOT NULL,
		[Lucro] [numeric](19, 6) NOT NULL
		CONSTRAINT [PK_FactFaturacaoLinhasClienteMes] PRIMARY KEY CLUSTERED 
		(
		[DateMesKey] ASC,
		[ClienteKey] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	TRUNCATE TABLE [FactFaturacaoLinhasClienteMes]

	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-DateMesKey')	
		DROP INDEX [NonClusteredIndex-DateMesKey] ON [dbo].[FactFaturacaoLinhasClienteMes]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ClienteKey')	
		DROP INDEX [NonClusteredIndex-ClienteKey] ON [dbo].[FactFaturacaoLinhasClienteMes]

	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhasClienteMes_DimDateMes')
		ALTER TABLE [dbo].[FactFaturacaoLinhasClienteMes] DROP CONSTRAINT [FK_FactFaturacaoLinhasClienteMes_DimDateMes]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhasClienteMes_DimCliente')
		ALTER TABLE [dbo].[FactFaturacaoLinhasClienteMes] DROP CONSTRAINT [FK_FactFaturacaoLinhasClienteMes_DimCliente]
END
