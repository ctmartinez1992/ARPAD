IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DimMoeda')
CREATE TABLE [dbo].[DimMoeda](
	[MoedaKey] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](50) NULL,
	[Abreviatura] [nvarchar](5) NULL
 CONSTRAINT [PK_DimMoeda] PRIMARY KEY CLUSTERED 
(
	[MoedaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
