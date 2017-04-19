IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FactFaturacaoLinhas')
BEGIN
	CREATE TABLE [dbo].[FactFaturacaoLinhas](
		[AnoDocumento] int NOT NULL,
		[DateKey] [int] NOT NULL,
		[ClienteKey] [int] NOT NULL,
		[FuncionarioKey] [int] NOT NULL,
		[VendedorKey] [int] NOT NULL,
		[ProdutoKey] [int] NOT NULL,
		[ZonaKey] [int] NOT NULL,
		[MoedaKey] [int] NOT NULL,
		[JunkFaturacaoKey] [int] NOT NULL,
		[FTStamp] [char](25) NOT NULL,
		[FLStamp] [char](25) NOT NULL,
		[Armazem] [varchar](50) NOT NULL,
		[Quantidade] [numeric](14, 0) NOT NULL,
		[TaxaIVA] [numeric](4, 2) NOT NULL,
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
		[Lucro] [numeric](19, 6) NOT NULL)
		 ON RangeDateScheme  (AnoDocumento)
	ALTER TABLE [dbo].[FactFaturacaoLinhas] ADD CONSTRAINT [PK_FactFaturacaoLinhas] PRIMARY KEY CLUSTERED 
	(
		[DateKey] ASC,
		[ClienteKey] ASC,
		[FuncionarioKey] ASC,
		[VendedorKey] ASC,
		[ProdutoKey] ASC,
		[ZonaKey] ASC,
		[FLStamp] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
END
ELSE
BEGIN
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-DateKey')	
		DROP INDEX [NonClusteredIndex-DateKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ClienteKey')	
		DROP INDEX [NonClusteredIndex-ClienteKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-FuncionarioKey')	
		DROP INDEX [NonClusteredIndex-FuncionarioKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-VendedorKey')	
		DROP INDEX [NonClusteredIndex-VendedorKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ProdutoKey')	
		DROP INDEX [NonClusteredIndex-ProdutoKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ZonaKey')	
		DROP INDEX [NonClusteredIndex-ZonaKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-MoedaKey')	
		DROP INDEX [NonClusteredIndex-MoedaKey] ON [dbo].[FactFaturacaoLinhas]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-JunkFaturacaoKey')	
		DROP INDEX [NonClusteredIndex-JunkFaturacaoKey] ON [dbo].[FactFaturacaoLinhas]

	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimDate')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimDate]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimCliente')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimCliente]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimFuncionario')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimFuncionario]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimVendedor')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimVendedor]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimProduto')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimProduto]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimZona')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimZona]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimMoeda')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimMoeda]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactFaturacaoLinhas_DimJunkFaturacao')
		ALTER TABLE [dbo].[FactFaturacaoLinhas] DROP CONSTRAINT [FK_FactFaturacaoLinhas_DimJunkFaturacao]
END
