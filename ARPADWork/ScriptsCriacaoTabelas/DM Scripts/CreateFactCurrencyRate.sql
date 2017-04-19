IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FactCurrencyRate')
	CREATE TABLE [dbo].[FactCurrencyRate](
		[DateKey] [int] NOT NULL,
		[MoedaOrigemKey] [int] NOT NULL,
		[MoedaDestinoKey] [int] NOT NULL,
		[FatorCambio] [numeric](20, 10) NOT NULL
	 CONSTRAINT [PK_FactCurrencyRate] PRIMARY KEY CLUSTERED
	(
		[DateKey] ASC,
		[MoedaOrigemKey] ASC,
		[MoedaDestinoKey] ASC
	) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
ELSE
BEGIN
IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactCurrencyRate_DimDate')
		ALTER TABLE [dbo].[FactCurrencyRate] DROP CONSTRAINT [FK_FactCurrencyRate_DimDate]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactCurrencyRate_DimMoedaOrigem')
		ALTER TABLE [dbo].[FactCurrencyRate] DROP CONSTRAINT [FK_FactCurrencyRate_DimMoedaOrigem]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_FactCurrencyRate_DimMoedaDestino')
		ALTER TABLE [dbo].[FactCurrencyRate] DROP CONSTRAINT [FK_FactCurrencyRate_DimMoedaDestino]
END