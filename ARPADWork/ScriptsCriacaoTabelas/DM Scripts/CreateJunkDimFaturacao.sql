IF NOT EXISTS (SELECT name FROM sys.tables where name = 'JunkDimFaturacao')
BEGIN
CREATE TABLE [dbo].[JunkDimFaturacao](
 [JunkFaturacaoKey] [int] IDENTITY(1,1) NOT NULL,
 [NumeroDocumento] [varchar](20) NOT NULL,
 [NomeDocumento] [varchar](20) NOT NULL,
 [Armazem] [varchar](50) NOT NULL,
 [LOrdem] [numeric](10, 0) NOT NULL,
 [CentroCusto] [varchar](20) NOT NULL,
 [Segmento] [varchar](25) NOT NULL,
 [Tipo] [varchar](20) NOT NULL
 CONSTRAINT [PK_JunkDimFaturacao] PRIMARY KEY CLUSTERED 
(
 [JunkFaturacaoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END