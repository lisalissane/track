USE MCC_REPORTING

DECLARE @c AS NVARCHAR(100)
SET @c = 'MCC_ST_SalesDetails_TDA' + '_' + replace(replace(Cast(GETDATE() AS NVARCHAR),' ','_'),':','_')

if exists (select * from sysobjects where name='MCC_ST_SalesDetails_TDA' and xtype='U')
	truncate table [MCC_ST_SalesDetails_TDA] 
else
CREATE TABLE [MCC_ST_SalesDetails_TDA] ( 
[StoreID] [NVARCHAR] (510) NULL
,[POSID] [NVARCHAR] (510) NULL
,[BusinessDay] [NVARCHAR] (510) NULL
,[OrderNumber] [NVARCHAR] (510) NULL
,[ProductCode] [NVARCHAR] (510) NULL
,[Price] [NVARCHAR] (510) NULL
,[AmountPurchased] [NVARCHAR] (510) NULL
,[TaxRate] [NVARCHAR] (510) NULL
,[MarketCode] [NVARCHAR] (510) NULL
) ON [PRIMARY] 



GO
BEGIN TRANSACTION
BEGIN TRY
BULK INSERT [MCC_ST_SalesDetails_TDA]
From 
'\\192.168.10.23\Freigaben\01_TABLEAU_REPORTS\MCD_CH\01_DATA\01_Upload\GTDA_Dly_Pmix_CH_199_20180808.20180807165419.psv'
WITH 
(
    CODEPAGE = 'ACP',
    FIRSTROW = 1,
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
UPDATE [MCC_ST_SalesDetails_TDA] SET 
[StoreID] = REPLACE([StoreID], '"', '')
,[POSID] = REPLACE([POSID], '"', '')
,[BusinessDay] = REPLACE([BusinessDay], '"', '')
,[OrderNumber] = REPLACE([OrderNumber], '"', '')
,[ProductCode] = REPLACE([ProductCode], '"', '')
,[Price] = REPLACE([Price], '"', '')
,[AmountPurchased] = REPLACE([AmountPurchased], '"', '')
,[TaxRate] = REPLACE([TaxRate], '"', '')
,[MarketCode] = REPLACE([MarketCode], '"', '')

GO

IF NOT EXISTS (SELECT * FROM sys.Columns WHERE object_id = OBJECT_ID(N'[dbo].[MCC_ST_SalesDetails_TDA]') AND name = 'SOURCE') 
ALTER TABLE [MCC_ST_SalesDetails_TDA] ADD [SOURCE] NVARCHAR(255)
GO

UPDATE [MCC_ST_SalesDetails_TDA] SET [SOURCE] = 'GTDA_Dly_Pmix_CH_199_20180808.20180807165419.psv'
GO

INSERT INTO Vodafone_Cleaner.dbo.tbl_protokoll(cdate, project, developer, description, code, Counts) 
SELECT getdate() as cdate 
, 'MCC_ST_SalesDetails_TDA' as project 
, 'nadja.friedrich' as developer 
, 'import' as description 
, 'GTDA_Dly_Pmix_CH_199_20180808.20180807165419.psv' as project 
, Count(*) as Counts 
FROM [MCC_ST_SalesDetails_TDA]

Go
----

WAITFOR DELAY '00:00:05' 
GO


