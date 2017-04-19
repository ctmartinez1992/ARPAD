IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DimFuncionario')
BEGIN
CREATE TABLE [dbo].[DimFuncionario](
 [FuncionarioKey] [int] NOT NULL,
 [FuncionarioId] [numeric](6, 0) NOT NULL,
 [VendedorId] [numeric](4, 0) NOT NULL,
 [Nome] [varchar](30) NOT NULL,
 [Iniciais] [varchar](3) NOT NULL,
 [Codigo] [varchar](20) NOT NULL,
 [Tipo] [varchar](20) NOT NULL,
 [Departamento] [varchar](20) NOT NULL,
 [ChefeKey] [int] NULL,
 [EmailEmpresa] [varchar](45) NOT NULL,
 [EmailVendedor] [varchar](45) NOT NULL,
 [Telefone] [varchar](20) NOT NULL,
 [Morada] [varchar](55) NOT NULL,
 [CodigoPostal] [varchar](45) NOT NULL,
 [Localidade] [varchar](45) NOT NULL,
 [DataCriacaoKey] [int] NOT NULL,
 [HoraCriacaoKey] [int] NOT NULL,
 [EffectiveDateKey] [int] NOT NULL,
 [EffectiveTimeKey] [int] NOT NULL,
 [ExpiredDateKey] [int] NULL,
 [ExpiredTimeKey] [int] NULL,
 [IsCurrent] [nvarchar](3) NOT NULL
 CONSTRAINT [PK_DimFuncionario] PRIMARY KEY CLUSTERED 
(
 [FuncionarioKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--Funcionario criado para os funcionarios sem chefe
--INSERT INTO [dbo].[DimFuncionario] ([FuncionarioId],[FuncionarioKey],[VendedorId],[Nome],[Iniciais],[Codigo],[Tipo],[Departamento],[ChefeKey],[EmailEmpresa],[EmailVendedor],[Telefone],[Morada],[CodigoPostal],[Localidade],[DataCriacaoKey],[HoraCriacaoKey],[EffectiveDateKey],[EffectiveTimeKey],[ExpiredDateKey],[ExpiredTimeKey],[IsCurrent])
--     VALUES (0,1,0,'Sem chefe/Não Vendedor','NAN','Unknown','Unknown','Unknown',1,'Unknown','Unknown','Unknown','Unknown','Unknown','Unknown',1,1,1,1,1,1,'Sim')
END
ELSE
BEGIN
	IF EXISTS (select * from sys.indexes where name = 'NonClusteredIndex-FuncionarioId')	
		DROP INDEX [NonClusteredIndex-FuncionarioId] ON [dbo].[DimFuncionario]

	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimFuncionario_Chefe')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimFuncionario_Chefe]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimDate_Criacao')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimDate_Criacao]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimDate_Effective')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimDate_Effective]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimDate_Expired')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimDate_Expired]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimTime_Criacao')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimTime_Criacao]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimTime_Effective')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimTime_Effective]
	IF EXISTS (SELECT name FROM sys.foreign_keys WHERE name = 'FK_DimFuncionario_DimTime_Expired')
		ALTER TABLE [dbo].[DimFuncionario] DROP CONSTRAINT [FK_DimFuncionario_DimTime_Expired]
END