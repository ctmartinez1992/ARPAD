IF NOT EXISTS (SELECT name FROM sys.tables where name = 'Vendedores')
CREATE TABLE [dbo].[Vendedores](	
	[vendedor] [varchar](20) NOT NULL,
	[codigo] [numeric](4, 0) NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[morada] [varchar](40) NOT NULL,
	[codpost] [varchar](28) NOT NULL,
	[local] [varchar](43) NOT NULL,
	[telefone] [varchar](60) NOT NULL,
	[email] [varchar](45) NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL,
	)
ELSE
	TRUNCATE TABLE Vendedores