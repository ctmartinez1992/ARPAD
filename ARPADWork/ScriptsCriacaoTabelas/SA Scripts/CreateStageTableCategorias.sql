IF NOT EXISTS (SELECT name FROM sys.tables where name = 'Categorias')
CREATE TABLE [dbo].[Categorias](
	[Codigo] [int] NOT NULL,
	[Categoria] [varchar](35) NULL
)
ELSE
	TRUNCATE TABLE Categorias