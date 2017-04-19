IF NOT EXISTS (SELECT name FROM sys.tables where name = 'FornecedoresDQP')
CREATE TABLE [dbo].[FornecedoresDQP](	
	[nome] [varchar](55) NOT NULL,
	[numero] [numeric](10, 0) NOT NULL,
	[moeda] [varchar](11) NOT NULL,
	[fax] [varchar](60) NOT NULL,
	[telefone] [varchar](60) NOT NULL,
	[contacto] [varchar](30) NOT NULL,
	[morada] [varchar](55) NOT NULL,
	[localidade] [varchar](43) NOT NULL,
	[codpostal] [varchar](45) NOT NULL,
	[ncontribuinte] [varchar](20) NOT NULL,
	[zona] [numeric](5, 0) NULL,
	[tipo] [varchar](20) NOT NULL,
	[desconto] [numeric](5, 2) NOT NULL,
	[vencimento] [numeric](3, 0) NOT NULL,
	[descontopp] [numeric](5, 2) NOT NULL,
	[taxaiva] [numeric](2, 0) NOT NULL,
	[funcaocontacto] [varchar](15) NOT NULL,
	[email] [varchar](45) NOT NULL,
	[nacionalidade] [varchar](20) NOT NULL,
	[telemovel] [varchar](45) NOT NULL,
	[saldo] [numeric](19, 6) NOT NULL,
	[plafond] [numeric](19, 6) NOT NULL,
	[centrocusto] [varchar](20) NOT NULL,
	[classe] [varchar](30) NOT NULL,
	[data_criacao] [datetime] NOT NULL,
	[hora_criacao] [varchar](8) NOT NULL,
	[data_ult_gravacao] [datetime] NOT NULL,
	[hora_ult_gravacao] [varchar](8) NOT NULL,
	[DQP] [nvarchar](100)
	)
ELSE
	TRUNCATE TABLE FornecedoresDQP