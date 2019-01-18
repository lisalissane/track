USE MCD_REPORTING

DECLARE @c AS NVARCHAR(100)
SET @c = 'gma_customer2' + '_' + replace(replace(Cast(GETDATE() AS NVARCHAR),' ','_'),':','_')

if exists (select * from sysobjects where name='gma_customer2' and xtype='U')
Execute sp_RENAME '[gma_customer2]', @c

GO


BEGIN TRANSACTION
BEGIN TRY
BULK INSERT [gma_customer6]
From 
'\\trell\Freigaben\01_TABLEAU_REPORTS\MCD\01_DATA\01_Upload\Gma-customerID_000000000006.txt'
WITH 
(
    CODEPAGE = 'ACP',
    FIRSTROW = 1,
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\n',
    ROWS_PER_BATCH = 100000

)
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
Rollback TRANSACTION
END CATCH
GO
UPDATE [gma_customer2] SET 
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
,[voucherPositionisPOSRedirect,isTableDelivery,totalAmount,bdTotalAmount,totalTaxAmount,DiscountAmount,ItemForExtraction,productCode,description,dtName,Item_PromotionID,quantity,quantitySold,quantityPromo,unitPrice,adUnitPrice,totalPrice,adTotalPrice,totalTax,netPrice,itemLevel,itemCode,prodAction,isGrillLine,taxID,taxRate,voucherPosition] = REPLACE([voucherPositionisPOSRedirect,isTableDelivery,totalAmount,bdTotalAmount,totalTaxAmount,DiscountAmount,ItemForExtraction,productCode,description,dtName,Item_PromotionID,quantity,quantitySold,quantityPromo,unitPrice,adUnitPrice,totalPrice,adTotalPrice,totalTax,netPrice,itemLevel,itemCode,prodAction,isGrillLine,taxID,taxRate,voucherPosition], '"', '')

GO

IF NOT EXISTS (SELECT * FROM sys.Columns WHERE object_id = OBJECT_ID(N'[dbo].[gma_customer2]') AND name = 'SOURCE') 
ALTER TABLE [gma_customer2] ADD [SOURCE] NVARCHAR(255)
GO

UPDATE [gma_customer2] SET [SOURCE] = 'Gma-customerID_000000000002.txt'
GO

INSERT INTO Vodafone_Cleaner.dbo.tbl_protokoll(cdate, project, developer, description, code, Counts) 
SELECT getdate() as cdate 
, 'gma_customer2' as project 
, 'nadja.friedrich' as developer 
, 'import' as description 
, 'Gma-customerID_000000000002.txt' as project 
, Count(*) as Counts 
FROM [gma_customer2]

Go
----

WAITFOR DELAY '00:00:05' 
GO


