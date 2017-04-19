IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FuncionariosDQP')
CREATE TABLE [dbo].[FuncionariosDQP](
	[iniciais] [varchar](3) NOT NULL,
	[codigo] [varchar](20) NOT NULL,
	[nome] [varchar](30) NOT NULL,
	[numero] [numeric](6, 0) NOT NULL,
	[grupo] [varchar](20) NOT NULL,
	[departamento] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[chefe] [numeric](6, 0) NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL,
	[DQP] [nvarchar](100)
	)
ELSE
	TRUNCATE TABLE FuncionariosDQP