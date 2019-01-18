USE MCC_REPORTING

DECLARE @c AS NVARCHAR(100)
SET @c = 'MCC_ST_SalesDetails_Plexure' + '_' + replace(replace(Cast(GETDATE() AS NVARCHAR),' ','_'),':','_')

if exists (select * from sysobjects where name='MCC_ST_SalesDetails_Plexure' and xtype='U')
drop table [MCC_ST_SalesDetails_Plexure]

GO

CREATE TABLE [MCC_ST_SalesDetails_Plexure] ( 
[SaleId] [NVARCHAR] (510) NULL
,[OfferId] [NVARCHAR] (510) NULL
,[ProductCode] [NVARCHAR] (510) NULL
,[Quantity] [NVARCHAR] (510) NULL
) ON [PRIMARY] 
GO
BEGIN TRANSACTION
BEGIN TRY
BULK INSERT [MCC_ST_SalesDetails_Plexure]
From 
'\\192.168.10.23\Freigaben\01_TABLEAU_REPORTS\MCD_CH\01_DATA\01_Upload\saledetails-20180807.csv'
WITH 
(
    CODEPAGE = 'ACP',
    FIRSTROW = 2,
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n',
    ROWS_PER_BATCH = 100000,
    TABLOCK
)
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
Rollback TRANSACTION
END CATCH
GO
UPDATE [MCC_ST_SalesDetails_Plexure] SET 
[SaleId] = REPLACE([SaleId], '"', '')
,[OfferId] = REPLACE([OfferId], '"', '')
,[ProductCode] = REPLACE([ProductCode], '"', '')
,[Quantity] = REPLACE([Quantity], '"', '')

GO

IF NOT EXISTS (SELECT * FROM sys.Columns WHERE object_id = OBJECT_ID(N'[dbo].[MCC_ST_SalesDetails_Plexure]') AND name = 'SOURCE') 
ALTER TABLE [MCC_ST_SalesDetails_Plexure] ADD [SOURCE] NVARCHAR(255)
GO

UPDATE [MCC_ST_SalesDetails_Plexure] SET [SOURCE] = 'saledetails-20180807.csv'
GO

INSERT INTO Vodafone_Cleaner.dbo.tbl_protokoll(cdate, project, developer, description, code, Counts) 
SELECT getdate() as cdate 
, 'MCC_ST_SalesDetails_Plexure' as project 
, 'nadja.friedrich' as developer 
, 'import' as description 
, 'saledetails-20180807.csv' as project 
, Count(*) as Counts 
FROM [MCC_ST_SalesDetails_Plexure]

Go
----

WAITFOR DELAY '00:00:05' 
GO


