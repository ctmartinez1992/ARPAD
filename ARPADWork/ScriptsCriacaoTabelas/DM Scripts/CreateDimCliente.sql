IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DimCliente')
CREATE TABLE [dbo].[DimCliente](
	[ClienteKey] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [numeric](10, 0) NOT NULL,	
	[Nome] [varchar](55) NOT NULL,
	[Contacto] [varchar](30) NOT NULL,
	--[FuncaoContacto] [varchar](15) NOT NULL,
	--[Classe] [varchar](30) NOT NULL,
	--[Nacionalidade] [varchar](20) NOT NULL,	
	[Morada] [varchar](55) NOT NULL,
	[Localidade] [varchar](45) NOT NULL,
	[CodigoPostal] [varchar](45) NOT NULL,
	--[Distrito] [varchar](20) NOT NULL,
	[ZonaKey] [int] NOT NULL,
	[Email] [varchar](45) NOT NULL,
	[Telefone] [varchar](20) NOT NULL,
	[Telemovel] [varchar](20) NOT NULL,
	[Fax] [varchar](20) NOT NULL,
	[NumeroContribuinte] [varchar](20) NOT NULL,
	[CentroCusto] [varchar](20) NOT NULL,
	--[RangeDemographicKey] [int] NOT NULL,
	[MoedaKey] [int] NOT NULL,
	--[Desconto] [numeric](5, 2) NOT NULL,
	--[DescontoProntoPagamento] [numeric](5, 2) NOT NULL,
	--[TaxaIva] [numeric](2, 0) NOT NULL,
	[VendedorKey] [int] NOT NULL,
	[NIB] [varchar](30) NOT NULL,
	[Segmento] [varchar](10) NOT NULL,
	[TipoCliente] [varchar](20) NOT NULL,
	[Saldo] [numeric](19, 6) NOT NULL,
	[Vencimento] [numeric](3, 0) NOT NULL,
	[Plafond] [numeric](19, 6) NOT NULL,

	[DataCriacaoKey] [int] NOT NULL,
	[HoraCriacaoKey] [int] NOT NULL,

	[EffectiveDateKey] [int] NOT NULL,
	[EffectiveTimeKey] [int] NOT NULL,
	[ExpiredDateKey] [int] NULL,
	[ExpiredTimeKey] [int] NULL,
	[IsCurrent] [nvarchar](3) NOT NULL
 CONSTRAINT [PK_DimCliente] PRIMARY KEY CLUSTERED 
(
	[ClienteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-ClienteId')	
		DROP INDEX [NonClusteredIndex-ClienteId] ON [dbo].[DimCliente]
		
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimZona')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimZona]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimFuncionario')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimFuncionario]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimMoeda')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimMoeda]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimDate_Criacao')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimDate_Criacao]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimDate_Effective')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimDate_Effective]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimDate_Expired')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimDate_Expired]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimTime_Criacao')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimTime_Criacao]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimTime_Effective')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimTime_Effective]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimCliente_DimTime_Expired')
		ALTER TABLE [dbo].[DimCliente] DROP CONSTRAINT [FK_DimCliente_DimTime_Expired]