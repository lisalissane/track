USE MCD_REPORTING

DECLARE @c AS NVARCHAR(100)
SET @c = 'gma_customer1' + '_' + replace(replace(Cast(GETDATE() AS NVARCHAR),' ','_'),':','_')

if exists (select * from sysobjects where name='gma_customer1' and xtype='U')
Execute sp_RENAME '[gma_customer1]', @c

GO

CREATE TABLE [gma_customer1] ( 
[businessDay] [NVARCHAR] (510) NULL
,[saleDate] [NVARCHAR] (510) NULL
,[saleTime] [NVARCHAR] (510) NULL
,[saleHH] [NVARCHAR] (510) NULL
,[saleMM] [NVARCHAR] (510) NULL
,[saleSS] [NVARCHAR] (510) NULL
,[tenderPOS] [NVARCHAR] (510) NULL
,[orderKey] [NVARCHAR] (510) NULL
,[CustomerID] [NVARCHAR] (510) NULL
,[Head_offerID] [NVARCHAR] (510) NULL
,[Head_PromotionID] [NVARCHAR] (510) NULL
,[Head_PromotionName] [NVARCHAR] (510) NULL
,[orderID] [NVARCHAR] (510) NULL
,[storeNr] [NVARCHAR] (510) NULL
,[saleStatus] [NVARCHAR] (510) NULL
,[transactionKind] [NVARCHAR] (510) NULL
,[pod] [NVARCHAR] (510) NULL
,[takeID] [NVARCHAR] (510) NULL
,[isPOSRedirect] [NVARCHAR] (510) NULL
,[isTableDelivery] [NVARCHAR] (510) NULL
,[totalAmount] [NVARCHAR] (510) NULL
,[bdTotalAmount] [NVARCHAR] (510) NULL
,[totalTaxAmount] [NVARCHAR] (510) NULL
,[DiscountAmount] [NVARCHAR] (510) NULL
,[ItemForExtraction] [NVARCHAR] (510) NULL
,[productCode] [NVARCHAR] (510) NULL
,[description] [NVARCHAR] (510) NULL
,[dtName] [NVARCHAR] (510) NULL
,[Item_PromotionID] [NVARCHAR] (510) NULL
,[quantity] [NVARCHAR] (510) NULL
,[quantitySold] [NVARCHAR] (510) NULL
,[quantityPromo] [NVARCHAR] (510) NULL
,[unitPrice] [NVARCHAR] (510) NULL
,[adUnitPrice] [NVARCHAR] (510) NULL
,[totalPrice] [NVARCHAR] (510) NULL
,[adTotalPrice] [NVARCHAR] (510) NULL
,[totalTax] [NVARCHAR] (510) NULL
,[netPrice] [NVARCHAR] (510) NULL
,[itemLevel] [NVARCHAR] (510) NULL
,[itemCode] [NVARCHAR] (510) NULL
,[prodAction] [NVARCHAR] (510) NULL
,[isGrillLine] [NVARCHAR] (510) NULL
,[taxID] [NVARCHAR] (510) NULL
,[taxRate] [NVARCHAR] (510) NULL
,[voucherPosition] [NVARCHAR] (510) NULL
) ON [PRIMARY] 
GO
BEGIN TRANSACTION
BEGIN TRY
BULK INSERT [gma_customer1]
From 
'\\trell\Freigaben\01_TABLEAU_REPORTS\MCD\01_DATA\01_Upload\Gma-customerID_000000000001.txt'
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
UPDATE [gma_customer1] SET 
[businessDay] = REPLACE([businessDay], '"', '')
,[saleDate] = REPLACE([saleDate], '"', '')
,[saleTime] = REPLACE([saleTime], '"', '')
,[saleHH] = REPLACE([saleHH], '"', '')
,[saleMM] = REPLACE([saleMM], '"', '')
,[saleSS] = REPLACE([saleSS], '"', '')
,[tenderPOS] = REPLACE([tenderPOS], '"', '')
,[orderKey] = REPLACE([orderKey], '"', '')
,[CustomerID] = REPLACE([CustomerID], '"', '')
,[Head_offerID] = REPLACE([Head_offerID], '"', '')
,[Head_PromotionID] = REPLACE([Head_PromotionID], '"', '')
,[Head_PromotionName] = REPLACE([Head_PromotionName], '"', '')
,[orderID] = REPLACE([orderID], '"', '')
,[storeNr] = REPLACE([storeNr], '"', '')
,[saleStatus] = REPLACE([saleStatus], '"', '')
,[transactionKind] = REPLACE([transactionKind], '"', '')
,[pod] = REPLACE([pod], '"', '')
,[takeID] = REPLACE([takeID], '"', '')
,[isPOSRedirect] = REPLACE([isPOSRedirect], '"', '')
,[isTableDelivery] = REPLACE([isTableDelivery], '"', '')
,[totalAmount] = REPLACE([totalAmount], '"', '')
,[bdTotalAmount] = REPLACE([bdTotalAmount], '"', '')
,[totalTaxAmount] = REPLACE([totalTaxAmount], '"', '')
,[DiscountAmount] = REPLACE([DiscountAmount], '"', '')
,[ItemForExtraction] = REPLACE([ItemForExtraction], '"', '')
,[productCode] = REPLACE([productCode], '"', '')
,[description] = REPLACE([description], '"', '')
,[dtName] = REPLACE([dtName], '"', '')
,[Item_PromotionID] = REPLACE([Item_PromotionID], '"', '')
,[quantity] = REPLACE([quantity], '"', '')
,[quantitySold] = REPLACE([quantitySold], '"', '')
,[quantityPromo] = REPLACE([quantityPromo], '"', '')
,[unitPrice] = REPLACE([unitPrice], '"', '')
,[adUnitPrice] = REPLACE([adUnitPrice], '"', '')
,[totalPrice] = REPLACE([totalPrice], '"', '')
,[adTotalPrice] = REPLACE([adTotalPrice], '"', '')
,[totalTax] = REPLACE([totalTax], '"', '')
,[netPrice] = REPLACE([netPrice], '"', '')
,[itemLevel] = REPLACE([itemLevel], '"', '')
,[itemCode] = REPLACE([itemCode], '"', '')
,[prodAction] = REPLACE([prodAction], '"', '')
,[isGrillLine] = REPLACE([isGrillLine], '"', '')
,[taxID] = REPLACE([taxID], '"', '')
,[taxRate] = REPLACE([taxRate], '"', '')
,[voucherPosition] = REPLACE([voucherPosition], '"', '')

GO

IF NOT EXISTS (SELECT * FROM sys.Columns WHERE object_id = OBJECT_ID(N'[dbo].[gma_customer1]') AND name = 'SOURCE') 
ALTER TABLE [gma_customer1] ADD [SOURCE] NVARCHAR(255)
GO

UPDATE [gma_customer1] SET [SOURCE] = 'Gma-customerID_000000000001.txt'
GO

INSERT INTO Vodafone_Cleaner.dbo.tbl_protokoll(cdate, project, developer, description, code, Counts) 
SELECT getdate() as cdate 
, 'gma_customer1' as project 
, 'nadja.friedrich' as developer 
, 'import' as description 
, 'Gma-customerID_000000000001.txt' as project 
, Count(*) as Counts 
FROM [gma_customer1]

Go
----

WAITFOR DELAY '00:00:05' 
GO


