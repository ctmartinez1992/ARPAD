IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FactFaturacaoLinhasProdutoMes')
BEGIN
	CREATE TABLE [dbo].[FactFaturacaoLinhasProdutoMes](
		[DateMesKey] [int] NOT NULL,
		[ProdutoKey] [int] NOT NULL,
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
		CONSTRAINT [PK_FactFaturacaoLinhasProdutoMes] PRIMARY KEY CLUSTERED 
		(
		[DateMesKey] ASC,
		[ProdutoKey] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
ELSE
BEGIN
	TRUNCATE TABLE [FactFaturacaoLinhasProdutoMes]

	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-DateMesKey')	
		DROP INDEX [NonClusteredIndex-DateMesKey] ON [dbo].[FactFaturacaoLinhasProdutoMes]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ProdutoKey')	
		DROP INDEX [NonClusteredIndex-ProdutoKey] ON [dbo].[FactFaturacaoLinhasProdutoMes]

	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhasProdutoMes_DimDateMes')
		ALTER TABLE [dbo].[FactFaturacaoLinhasProdutoMes] DROP CONSTRAINT [FK_FactFaturacaoLinhasProdutoMes_DimDateMes]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhasProdutoMes_DimProduto')
		ALTER TABLE [dbo].[FactFaturacaoLinhasProdutoMes] DROP CONSTRAINT [FK_FactFaturacaoLinhasProdutoMes_DimProduto]
END
