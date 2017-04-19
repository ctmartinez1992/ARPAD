IF NOT EXISTS (SELECT name FROM sys.tables where name = 'Familias')
CREATE TABLE [dbo].[Familias](
	[referencia] [varchar](18) NOT NULL,
	[nome] [varchar](60) NOT NULL,
	[margem1] [numeric](16, 3) NOT NULL,
	[margem2] [numeric](16, 3) NOT NULL,
	[margem3] [numeric](16, 3) NOT NULL,
	[margem4] [numeric](16, 3) NOT NULL,
	[margem5] [numeric](16, 3) NOT NULL,
	[categoria] [varchar](35) NOT NULL,
	[classificacao] [varchar](20) NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL,
	[taxaiva] [numeric](2, 0) NULL
	)
ELSE
	TRUNCATE TABLE Familias