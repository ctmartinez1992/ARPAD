IF NOT EXISTS (SELECT name FROM sys.tables where name = 'DimDateMes')
	CREATE TABLE [dbo].[DimDateMes](
		[DateKey] [int] IDENTITY(1,1) NOT NULL,
		[Year] [int] NOT NULL,
		[Month] [tinyint] NOT NULL,
		[MonthName] [nvarchar](10) NOT NULL,
		[Semester] [tinyint] NOT NULL,
		[Trimester] [tinyint] NOT NULL,
		[Quarter] [tinyint] NOT NULL
	 CONSTRAINT [PK_DimDateMes] PRIMARY KEY CLUSTERED 
	(
		[DateKey] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]