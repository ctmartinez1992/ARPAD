ALTER DATABASE DM_MaisRitmo
ADD FILEGROUP partition_1900_2000
ALTER DATABASE DM_MaisRitmo
ADD FILEGROUP partition_2001_2005
ALTER DATABASE DM_MaisRitmo
ADD FILEGROUP partition_2006_2010
ALTER DATABASE DM_MaisRitmo
ADD FILEGROUP partition_2011_2013
ALTER DATABASE DM_MaisRitmo
ADD FILEGROUP partition_2014_2015



ALTER DATABASE DM_MaisRitmo 
ADD FILE 
(
    NAME = data_1900_2000,
    FILENAME = 'E:\Users\nuno\SkyDrive\Documentos\Mestrado\arpad\Trabalho\ARPADWork\Files\Partition_1900_2000.ndf',
    SIZE = 50MB,
    MAXSIZE = 5000MB,
    FILEGROWTH = 200MB
)
TO FILEGROUP partition_1900_2000;

ALTER DATABASE DM_MaisRitmo 
ADD FILE 
(
    NAME = data_2001_2005,
    FILENAME = 'E:\Users\nuno\SkyDrive\Documentos\Mestrado\arpad\Trabalho\ARPADWork\Files\Partition_2001_2005.ndf',
    SIZE = 50MB,
    MAXSIZE = 3000MB,
    FILEGROWTH = 100MB
)
TO FILEGROUP partition_2001_2005;

ALTER DATABASE DM_MaisRitmo 
ADD FILE 
(
    NAME = data_2006_2010,
    FILENAME = 'E:\Users\nuno\SkyDrive\Documentos\Mestrado\arpad\Trabalho\ARPADWork\Files\Partition_2006_2010.ndf',
    SIZE = 50MB,
    MAXSIZE = 3000MB,
    FILEGROWTH = 100MB
)
TO FILEGROUP partition_2006_2010;

ALTER DATABASE DM_MaisRitmo 
ADD FILE 
(
    NAME = data_2011_2013,
    FILENAME = 'E:\Users\nuno\SkyDrive\Documentos\Mestrado\arpad\Trabalho\ARPADWork\Files\Partition_2011_2013.ndf',
    SIZE = 50MB,
    MAXSIZE = 2000MB,
    FILEGROWTH = 100MB
)
TO FILEGROUP partition_2011_2013;

ALTER DATABASE DM_MaisRitmo 
ADD FILE 
(
    NAME = data_2014_2015,
    FILENAME = 'E:\Users\nuno\SkyDrive\Documentos\Mestrado\arpad\Trabalho\ARPADWork\Files\Partition_2014_2015.ndf',
    SIZE = 50MB,
    MAXSIZE = 2000MB,
    FILEGROWTH = 100MB
)
TO FILEGROUP partition_2014_2015;

CREATE PARTITION FUNCTION AnoRangePFN(int)  AS
  RANGE LEFT FOR VALUES 
  (2000, 2005, 2010, 2013,2015)

  CREATE PARTITION SCHEME RangeDateScheme  AS
  PARTITION AnoRangePFN  TO 
  ([partition_1900_2000],
  [partition_2001_2005],
  [partition_2006_2010],
  [partition_2011_2013],
  [partition_2014_2015],
  [PRIMARY]  )

  --adicionar no script de criacao da tabela de factos 
  -- ON RangeDateScheme  (Ano)


SELECT $PARTITION.AnoRangePFN(AnoDocumento)  AS PARTITIONID,
       COUNT(*)                                   AS ROW_COUNT
FROM     FactFaturacaoLinhas
GROUP BY $PARTITION.AnoRangePFN(AnoDocumento)
ORDER BY PARTITIONID
