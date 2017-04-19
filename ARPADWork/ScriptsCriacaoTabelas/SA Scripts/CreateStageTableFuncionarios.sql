IF NOT EXISTS (SELECT name FROM sys.tables where name = 'Funcionarios')
BEGIN
CREATE TABLE [dbo].[Funcionarios](
 [FuncionarioKey] [int] IDENTITY(1,1) NOT NULL,
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
	[hora_ult_gravacao] [varchar](8) NOT NULL
	)

INSERT INTO [dbo].[Funcionarios]
  ([iniciais],[codigo],[nome],[numero],[grupo],[departamento],[email],[chefe],[data_criacao],[hora_criacao],[data_ult_gravacao],[hora_ult_gravacao])
     VALUES
           ('UNK','Unknown','Sem chefe/Não Vendedor',0,'Unknown','Unknown','Unknown',NULL,  '1900-01-01 00:00:00.000', '08:00:01','1900-01-01 00:00:00.000','08:00:01')
END
ELSE
	TRUNCATE TABLE Funcionarios