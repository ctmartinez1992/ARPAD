IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DimProduto')

CREATE TABLE [dbo].[DimProduto](
 [ProdutoKey] [int] IDENTITY(1,1) NOT NULL,
 [ProdutoId] [char](18) NOT NULL,
 [FamiliaId] [varchar](18) NOT NULL,
 [DescricaoProduto] [char](60) NOT NULL,
 [DescricaoFamilia] [varchar](60) NOT NULL,
 [CategoriaProduto] [varchar](35) NOT NULL,
 [CategoriaFamilia] [varchar](35) NOT NULL,
 [ClassificacaoProduto] [varchar](20) NOT NULL,
 [ClassificacaoFamilia] [varchar](20) NOT NULL,
 [StockInicial] [numeric](13) NOT NULL,
 [StockMaximo] [numeric](13) NOT NULL,
 [StockMinimo] [numeric](13) NOT NULL,
 [Margem1] [numeric](16, 3) NOT NULL,
 [Margem2] [numeric](16, 3) NOT NULL,
 [Margem3] [numeric](16, 3) NOT NULL,
 [Margem4] [numeric](16, 3) NOT NULL,
 [Margem5] [numeric](16, 3) NOT NULL,
 [PrecoVenda] [numeric](19, 6) NOT NULL,
 [PrecoCusto] [numeric](19, 6) NOT NULL,
 [PrecoCustoPonderado] [numeric](19, 6) NOT NULL,
 [UltimoPrecoCusto] [numeric](19, 6) NOT NULL,
 [UltimoPrecoVenda] [numeric](19, 6) NOT NULL,
 [QuantidadeCativa] [numeric](13) NOT NULL,
 [TaxaIVA] [numeric](2) NOT NULL,
 [PontoEncomenda] [numeric](10, 3) NOT NULL,
 [FornecedorKey] [int] NOT NULL,
 [DataAberturaKey] [int] NOT NULL,
 [DataCriacaoKey] [int] NOT NULL,
 [HoraCriacaoKey] [int] NOT NULL,
 [EffectiveDateKey] [int] NOT NULL,
 [EffectiveTimeKey] [int] NOT NULL,
 [ExpiredDateKey] [int] NULL,
 [ExpiredTimeKey] [int] NULL,
 [IsCurrent] [nvarchar](3) NOT NULL
 CONSTRAINT [PK_DimProduto] PRIMARY KEY CLUSTERED 
(
 [ProdutoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ELSE
BEGIN
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ProdutoId')	
		DROP INDEX [NonClusteredIndex-ProdutoId] ON [dbo].[DimProduto]
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-FamiliaId')	
		DROP INDEX [NonClusteredIndex-FamiliaId] ON [dbo].[DimProduto]

	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimFornecedor_Fornecedor')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimFornecedor_Fornecedor]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimDate_DataAbertura')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimDate_DataAbertura]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimDate_Criacao')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimDate_Criacao]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimDate_Effective')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimDate_Effective]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimDate_Expired')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimDate_Expired]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimTime_Criacao')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimTime_Criacao]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimTime_Effective')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimTime_Effective]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimProduto_DimTime_Expired')
		ALTER TABLE [dbo].[DimProduto] DROP CONSTRAINT [FK_DimProduto_DimTime_Expired]
END