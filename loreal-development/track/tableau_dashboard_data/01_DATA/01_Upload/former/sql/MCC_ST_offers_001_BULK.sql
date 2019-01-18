USE MCC_REPORTING

/*
DECLARE @c AS NVARCHAR(100)
SET @c = 'MCC_ST_offers_001' + '_' + replace(replace(Cast(GETDATE() AS NVARCHAR),' ','_'),':','_')

if exists (select * from sysobjects where name='MCC_ST_offers_001' and xtype='U')
Execute sp_RENAME '[MCC_ST_offers_001]', @c

GO

CREATE TABLE [MCC_ST_offers_001] ( 
[Id] [NVARCHAR] (510) NULL
,[CampaignId] [NVARCHAR] (510) NULL
,[MerchantId] [NVARCHAR] (510) NULL
,[CategoryId] [NVARCHAR] (510) NULL
,[Title] [NVARCHAR] (510) NULL
,[Description] [NVARCHAR] (510) NULL
,[WhenStarts] [NVARCHAR] (510) NULL
,[WhenExpires] [NVARCHAR] (510) NULL
,[TermsAndConditions] [NVARCHAR] (510) NULL
,[WhenLastUpdated] [NVARCHAR] (510) NULL
,[HasBarcodeImage] [NVARCHAR] (510) NULL
,[RedemptionLimit] [NVARCHAR] (510) NULL
,[RedemptionText] [NVARCHAR] (510) NULL
,[RedemptionCountUnlimited] [NVARCHAR] (510) NULL
,[CodeType] [NVARCHAR] (510) NULL
,[PremiumPlacement] [NVARCHAR] (510) NULL
,[Status] [NVARCHAR] (510) NULL
,[AlternativeTitle] [NVARCHAR] (510) NULL
,[AlternativeDescription] [NVARCHAR] (510) NULL
,[AlternativeTermsAndConditions] [NVARCHAR] (510) NULL
,[ApplyGeoFenceFilters] [NVARCHAR] (510) NULL
,[PromoImage] [NVARCHAR] (510) NULL
,[ExtendedData] [NVARCHAR] (510) NULL
,[DailyStartTime] [NVARCHAR] (510) NULL
,[DailyEndTime] [NVARCHAR] (510) NULL
,[DaysOfWeek] [NVARCHAR] (510) NULL
,[BaseWeight] [NVARCHAR] (510) NULL
,[NoCompeteGroup] [NVARCHAR] (510) NULL
,[IsGiftable] [NVARCHAR] (510) NULL
,[InStoreRedemptions] [NVARCHAR] (510) NULL
,[IsReward] [NVARCHAR] (510) NULL
,[AltImage] [NVARCHAR] (510) NULL
,[ContentUrl] [NVARCHAR] (510) NULL
,[IsRespawning] [NVARCHAR] (510) NULL
,[RespawnsInDays] [NVARCHAR] (510) NULL
,[EnableDistanceWeight] [NVARCHAR] (510) NULL
,[TagWeights] [NVARCHAR] (510) NULL
,[ApplyBeaconFilter] [NVARCHAR] (510) NULL
,[BeaconGroupIds] [NVARCHAR] (510) NULL
,[IsAvailableAllStores] [NVARCHAR] (510) NULL
,[ConsumerTargetingFilters] [NVARCHAR] (510) NULL
,[OperatingConditionsFilters] [NVARCHAR] (510) NULL
,[ContentFilters] [NVARCHAR] (510) NULL
,[GeofenceIds] [NVARCHAR] (510) NULL
,[Subcategories] [NVARCHAR] (510) NULL
) ON [PRIMARY] 
GO
*/
BEGIN TRANSACTION
BEGIN TRY
BULK INSERT [MCC_ST_offers_001]
From 
'\\192.168.10.23\Freigaben\01_TABLEAU_REPORTS\MCD_CH\01_DATA\01_Upload\offers-20180707_only_newformat-singelrow.csv'
WITH 
(
    CODEPAGE = '65001',
    FIRSTROW = 2,
    FIELDTERMINATOR = '|',
    ROWTERMINATOR = '\r\n',
    ROWS_PER_BATCH = 100000,
    TABLOCK
)
COMMIT TRANSACTION
END TRY 
BEGIN CATCH
Rollback TRANSACTION
END CATCH
GO
UPDATE [MCC_ST_offers_001] SET 
[Id] = REPLACE([Id], '"', '')
,[CampaignId] = REPLACE([CampaignId], '"', '')
,[MerchantId] = REPLACE([MerchantId], '"', '')
,[CategoryId] = REPLACE([CategoryId], '"', '')
,[Title] = REPLACE([Title], '"', '')
,[Description] = REPLACE([Description], '"', '')
,[WhenStarts] = REPLACE([WhenStarts], '"', '')
,[WhenExpires] = REPLACE([WhenExpires], '"', '')
,[TermsAndConditions] = REPLACE([TermsAndConditions], '"', '')
,[WhenLastUpdated] = REPLACE([WhenLastUpdated], '"', '')
,[HasBarcodeImage] = REPLACE([HasBarcodeImage], '"', '')
,[RedemptionLimit] = REPLACE([RedemptionLimit], '"', '')
,[RedemptionText] = REPLACE([RedemptionText], '"', '')
,[RedemptionCountUnlimited] = REPLACE([RedemptionCountUnlimited], '"', '')
,[CodeType] = REPLACE([CodeType], '"', '')
,[PremiumPlacement] = REPLACE([PremiumPlacement], '"', '')
,[Status] = REPLACE([Status], '"', '')
,[AlternativeTitle] = REPLACE([AlternativeTitle], '"', '')
,[AlternativeDescription] = REPLACE([AlternativeDescription], '"', '')
,[AlternativeTermsAndConditions] = REPLACE([AlternativeTermsAndConditions], '"', '')
,[ApplyGeoFenceFilters] = REPLACE([ApplyGeoFenceFilters], '"', '')
,[PromoImage] = REPLACE([PromoImage], '"', '')
,[ExtendedData] = REPLACE([ExtendedData], '"', '')
,[DailyStartTime] = REPLACE([DailyStartTime], '"', '')
,[DailyEndTime] = REPLACE([DailyEndTime], '"', '')
,[DaysOfWeek] = REPLACE([DaysOfWeek], '"', '')
,[BaseWeight] = REPLACE([BaseWeight], '"', '')
,[NoCompeteGroup] = REPLACE([NoCompeteGroup], '"', '')
,[IsGiftable] = REPLACE([IsGiftable], '"', '')
,[InStoreRedemptions] = REPLACE([InStoreRedemptions], '"', '')
,[IsReward] = REPLACE([IsReward], '"', '')
,[AltImage] = REPLACE([AltImage], '"', '')
,[ContentUrl] = REPLACE([ContentUrl], '"', '')
,[IsRespawning] = REPLACE([IsRespawning], '"', '')
,[RespawnsInDays] = REPLACE([RespawnsInDays], '"', '')
,[EnableDistanceWeight] = REPLACE([EnableDistanceWeight], '"', '')
,[TagWeights] = REPLACE([TagWeights], '"', '')
,[ApplyBeaconFilter] = REPLACE([ApplyBeaconFilter], '"', '')
,[BeaconGroupIds] = REPLACE([BeaconGroupIds], '"', '')
,[IsAvailableAllStores] = REPLACE([IsAvailableAllStores], '"', '')
,[ConsumerTargetingFilters] = REPLACE([ConsumerTargetingFilters], '"', '')
,[OperatingConditionsFilters] = REPLACE([OperatingConditionsFilters], '"', '')
,[ContentFilters] = REPLACE([ContentFilters], '"', '')
,[GeofenceIds] = REPLACE([GeofenceIds], '"', '')
,[Subcategories] = REPLACE([Subcategories], '"', '')

GO

IF NOT EXISTS (SELECT * FROM sys.Columns WHERE object_id = OBJECT_ID(N'[dbo].[MCC_ST_offers_001]') AND name = 'SOURCE') 
ALTER TABLE [MCC_ST_offers_001] ADD [SOURCE] NVARCHAR(255)
GO

UPDATE [MCC_ST_offers_001] SET [SOURCE] = 'offers-20180707_only_newformat-singelrow.csv'
GO

INSERT INTO Vodafone_Cleaner.dbo.tbl_protokoll(cdate, project, developer, description, code, Counts) 
SELECT getdate() as cdate 
, 'MCC_ST_offers_001' as project 
, 'nadja.friedrich' as developer 
, 'import' as description 
, 'offers-20180707_only_newformat-singelrow.csv' as project 
, Count(*) as Counts 
FROM [MCC_ST_offers_001]

Go
----

WAITFOR DELAY '00:00:05' 
GO


