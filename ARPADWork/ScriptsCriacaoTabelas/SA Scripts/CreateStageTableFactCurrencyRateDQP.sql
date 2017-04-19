IF NOT EXISTS (SELECT name from sys.tables
				WHERE name = 'FactCurrencyRateDQP')
	CREATE TABLE [dbo].[FactCurrencyRateDQP]
	(
		[MoedaOrigem] [nvarchar](5) NULL,
		[MoedaDestino] [nvarchar](5) NULL,
		[FatorCambio] [numeric](20, 10) NOT NULL,
		DQP nvarchar(100)
	)
ELSE
	TRUNCATE TABLE FactCurrencyRateDQP