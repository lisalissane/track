use Loreal
 
/* the following object([tbl_TrackOne_MasterData]) is generated only to avoid 
   compliation errors
 */	
IF EXISTS
    (
        SELECT
            1
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            UPPER(TABLE_NAME)   = UPPER('tbl_TrackOne_MasterData_prepare')
		AND	UPPER(TABLE_SCHEMA) = UPPER('dbo')
    )
	BEGIN	
		DROP  TABLE dbo.[tbl_TrackOne_MasterData_prepare];			
	END	      
GO

CREATE TABLE [dbo].[tbl_TrackOne_MasterData_prepare] ( 
             [bseqid]                         [INT] IDENTITY , 
             rnk                              BIGINT, 
             trck_ID                          INT , 
             trck_touchpoint                  NVARCHAR(255) , 
             trck_uniqueID                    NVARCHAR(255) , 
             trck_market                      NVARCHAR(3) , 
             trck_division                    NVARCHAR(255) , 
             trck_brand                       NVARCHAR(128) , 
             trck_segment                     NVARCHAR(255) , 
             trck_email_address               NVARCHAR(128) , 
             trck_registration_date           DATETIME , 
             trck_creation_date               DATETIME , 
             trck_subscribtion_date           DATETIME , 
             trck_doi                         INT , 
             trck_is_unsubscribed             INT , 
             trck_unsubscribe_date            DATETIME , 
             trck_is_contactable              INT , 
             trck_last_edited_date            DATETIME , 
             trck_company_name                NVARCHAR(255) , 
             trck_title                       NVARCHAR(255) , 
             trck_first_name                  NVARCHAR(255) , 
             trck_last_name                   NVARCHAR(255) , 
             trck_additional_name_information NVARCHAR(255) , 
             trck_street                      NVARCHAR(255) , 
             trck_house_number                NVARCHAR(255) , 
             trck_additional_address          NVARCHAR(255) , 
             trck_zip_code                    NVARCHAR(255) , 
             trck_city                        NVARCHAR(255) , 
             trck_state                       NVARCHAR(255) , 
             trck_country                     NVARCHAR(3) , 
             trck_gender                      NVARCHAR(255) , 
             trck_birthday                    DATE , 
             trck_consent_text                NVARCHAR(MAX) , 
             trck_language                    NVARCHAR(3) , 
             trck_mobile_number               NVARCHAR(255) , 
             trck_landline_number             NVARCHAR(255) , 
             trck_last_contact_date           DATETIME , 
             trck_last_open_date              DATETIME , 
             trck_last_click_date             DATETIME , 
             trck_is_fake                     INT , 
             trck_DMR                         DATETIME , 
             trck_DCR                         DATETIME , 
             trck_Source                      NVARCHAR(255) , 
             trck_is_blocked                  INT , 
             trck_blockreason                 NVARCHAR(255) , 
             trck_change_comment              NVARCHAR(4000) , 
             trck_custom_1                    NVARCHAR(255) , 
             trck_custom_2                    NVARCHAR(255) , 
             trck_custom_3                    NVARCHAR(255) , 
             trck_custom_4                    NVARCHAR(255) , 
             trck_custom_5                    NVARCHAR(255) , 
             trck_custom_6                    NVARCHAR(255) , 
             trck_custom_7                    NVARCHAR(255) , 
             trck_custom_8                    NVARCHAR(255) , 
             trck_custom_9                    NVARCHAR(255) , 
             AC_AcceptancyDate                DATETIME , 
             AC_Status                        VARCHAR(50) , 
             AC_UnsubscribeDate               DATETIME , 
             trck_is_consent                  INT , 
             trck_is_participation            INT , 
             trck_participation_text          NVARCHAR(4000) , 
             trck_is_subscribe                INT , 
             trck_subscribe_text              NVARCHAR(4000) , 
             trck_is_usage                    INT , 
             trck_usage_text                  NVARCHAR(4000) , 
             trck_campaign                    NVARCHAR(255) , 
             trck_referer                     NVARCHAR(255) , 
             trck_registration_ip             NVARCHAR(255) , 
             trck_subscribtion_ip             NVARCHAR(255) , 
             trck_subscribtion_source         NVARCHAR(255) , 
             trck_payload                     NVARCHAR(4000) , 
             Jobcode14                        VARCHAR(50) , 
             trck_source_system               VARCHAR(255) , 
             LOADCHECKSUM                     BIGINT NULL , 
             [LOADTS]                         DATETIME2(6) DEFAULT SYSDATETIME()

/*,
        CONSTRAINT [PK_stage_tbl_TrackOne_MasterData]
            PRIMARY KEY CLUSTERED ([email] ASC, [market] ASC, [brand] ASC)
            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                    ALLOW_PAGE_LOCKS = ON
                    ) ON [PRIMARY]
		*/

                                                )
ON [PRIMARY];
GO






IF EXISTS
(
	SELECT 1
	FROM INFORMATION_SCHEMA.TABLES
	WHERE UPPER(TABLE_NAME) = UPPER('tbl_TrackOne_MasterData') AND 
		  UPPER(TABLE_SCHEMA) = UPPER('dbo')
)
BEGIN
	ALTER TABLE dbo.tbl_TrackOne_MasterData SET(SYSTEM_VERSIONING = OFF);
	DROP TABLE dbo.tbl_TrackOne_MasterData;
	DROP TABLE dbo.tbl_TrackOne_MasterData_hist;
END;	      
GO


CREATE TABLE dbo.tbl_TrackOne_MasterData ( 
             rnk                              BIGINT , 
             trck_ID                          INT , 
             trck_touchpoint                  NVARCHAR(255) , 
             trck_uniqueID                    NVARCHAR(255) , 
             trck_market                      NVARCHAR(3) , 
             trck_division                    NVARCHAR(255) , 
             trck_brand                       NVARCHAR(128) , 
             trck_segment                     NVARCHAR(255) , 
             trck_email_address               NVARCHAR(128) , 
             trck_registration_date           DATETIME , 
             trck_creation_date               DATETIME , 
             trck_subscribtion_date           DATETIME , 
             trck_doi                         INT , 
             trck_is_unsubscribed             INT , 
             trck_unsubscribe_date            DATETIME , 
             trck_is_contactable              INT , 
             trck_last_edited_date            DATETIME , 
             trck_company_name                NVARCHAR(255) , 
             trck_title                       NVARCHAR(255) , 
             trck_first_name                  NVARCHAR(255) , 
             trck_last_name                   NVARCHAR(255) , 
             trck_additional_name_information NVARCHAR(255) , 
             trck_street                      NVARCHAR(255) , 
             trck_house_number                NVARCHAR(255) , 
             trck_additional_address          NVARCHAR(255) , 
             trck_zip_code                    NVARCHAR(255) , 
             trck_city                        NVARCHAR(255) , 
             trck_state                       NVARCHAR(255) , 
             trck_country                     NVARCHAR(3) , 
             trck_gender                      NVARCHAR(255) , 
             trck_birthday                    DATE , 
             trck_consent_text                NVARCHAR(MAX) , 
             trck_language                    NVARCHAR(3) , 
             trck_mobile_number               NVARCHAR(255) , 
             trck_landline_number             NVARCHAR(255) , 
             trck_last_contact_date           DATETIME , 
             trck_last_open_date              DATETIME , 
             trck_last_click_date             DATETIME , 
             trck_is_fake                     INT , 
             trck_DMR                         DATETIME , 
             trck_DCR                         DATETIME , 
             trck_Source                      NVARCHAR(255) , 
             trck_is_blocked                  INT , 
             trck_blockreason                 NVARCHAR(255) , 
             trck_change_comment              NVARCHAR(4000) , 
             trck_custom_1                    NVARCHAR(255) , 
             trck_custom_2                    NVARCHAR(255) , 
             trck_custom_3                    NVARCHAR(255) , 
             trck_custom_4                    NVARCHAR(255) , 
             trck_custom_5                    NVARCHAR(255) , 
             trck_custom_6                    NVARCHAR(255) , 
             trck_custom_7                    NVARCHAR(255) , 
             trck_custom_8                    NVARCHAR(255) , 
             trck_custom_9                    NVARCHAR(255) , 
             AC_AcceptancyDate                DATETIME , 
             AC_Status                        VARCHAR(50) , 
             AC_UnsubscribeDate               DATETIME , 
             trck_is_consent                  INT , 
             trck_is_participation            INT , 
             trck_participation_text          NVARCHAR(4000) , 
             trck_is_subscribe                INT , 
             trck_subscribe_text              NVARCHAR(4000) , 
             trck_is_usage                    INT , 
             trck_usage_text                  NVARCHAR(4000) , 
             trck_campaign                    NVARCHAR(255) , 
             trck_referer                     NVARCHAR(255) , 
             trck_registration_ip             NVARCHAR(255) , 
             trck_subscribtion_ip             NVARCHAR(255) , 
             trck_subscribtion_source         NVARCHAR(255) , 
             trck_payload                     NVARCHAR(4000) , 
             Jobcode14                        VARCHAR(50) , 
             trck_source_system               VARCHAR(255) , 
             ValidFrom                        DATETIME2(2) GENERATED ALWAYS AS ROW START NOT NULL , 
             ValidTo                          DATETIME2(2) GENERATED ALWAYS AS ROW END NOT NULL , 
             CONSTRAINT PK_tbl_TrackOne_MasterData PRIMARY KEY CLUSTERED
			 (
				trck_email_address ASC , 
				trck_market ASC , 
				trck_brand ASC
			 ) WITH(PAD_INDEX = OFF , STATISTICS_NORECOMPUTE = OFF , IGNORE_DUP_KEY = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] , 
             PERIOD FOR SYSTEM_TIME([ValidFrom] , [ValidTo])
                                         ) 
ON [PRIMARY] WITH(SYSTEM_VERSIONING = ON(HISTORY_TABLE = dbo.tbl_TrackOne_MasterData_hist));
GO

IF EXISTS
    (
        SELECT
            1
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            UPPER(TABLE_NAME)   = UPPER('tbl_C1_Interface_CustomerFlow')
		AND	UPPER(TABLE_SCHEMA) = UPPER('dbo')
    )
	BEGIN	
		ALTER TABLE [dbo].[tbl_C1_Interface_CustomerFlow] SET (SYSTEM_VERSIONING = OFF);
		DROP  TABLE [dbo].[tbl_C1_Interface_CustomerFlow];
		DROP  TABLE [dbo].[tbl_C1_Interface_CustomerFlow_hist];
	END	      
GO

CREATE TABLE [dbo].[tbl_C1_Interface_CustomerFlow] ( 
             [NID]                            [UNIQUEIDENTIFIER] NULL , 
             rnk                              BIGINT , 
             trck_ID                          INT , 
             trck_touchpoint                  NVARCHAR(255) , 
             trck_uniqueID                    NVARCHAR(255) , 
             trck_market                      NVARCHAR(3) , 
             trck_division                    NVARCHAR(255) , 
             trck_brand                       NVARCHAR(128) , 
             trck_segment                     NVARCHAR(255) , 
             trck_email_address               NVARCHAR(128) , 
             trck_registration_date           DATETIME , 
             trck_creation_date               DATETIME , 
             trck_subscribtion_date           DATETIME , 
             trck_doi                         INT , 
             trck_is_unsubscribed             INT , 
             trck_unsubscribe_date            DATETIME , 
             trck_is_contactable              INT , 
             trck_last_edited_date            DATETIME , 
             trck_company_name                NVARCHAR(255) , 
             trck_title                       NVARCHAR(255) , 
             trck_first_name                  NVARCHAR(255) , 
             trck_last_name                   NVARCHAR(255) , 
             trck_additional_name_information NVARCHAR(255) , 
             trck_street                      NVARCHAR(255) , 
             trck_house_number                NVARCHAR(255) , 
             trck_additional_address          NVARCHAR(255) , 
             trck_zip_code                    NVARCHAR(255) , 
             trck_city                        NVARCHAR(255) , 
             trck_state                       NVARCHAR(255) , 
             trck_country                     NVARCHAR(3) , 
             trck_gender                      NVARCHAR(255) , 
             trck_birthday                    DATE , 
             trck_consent_text                NVARCHAR(MAX) , 
             trck_language                    NVARCHAR(3) , 
             trck_mobile_number               NVARCHAR(255) , 
             trck_landline_number             NVARCHAR(255) , 
             trck_last_contact_date           DATETIME , 
             trck_last_open_date              DATETIME , 
             trck_last_click_date             DATETIME , 
             trck_is_fake                     INT , 
             trck_DMR                         DATETIME , 
             trck_DCR                         DATETIME , 
             trck_Source                      NVARCHAR(255) , 
             trck_is_blocked                  INT , 
             trck_blockreason                 NVARCHAR(255) , 
             trck_change_comment              NVARCHAR(4000) , 
             trck_custom_1                    NVARCHAR(255) , 
             trck_custom_2                    NVARCHAR(255) , 
             trck_custom_3                    NVARCHAR(255) , 
             trck_custom_4                    NVARCHAR(255) , 
             trck_custom_5                    NVARCHAR(255) , 
             trck_custom_6                    NVARCHAR(255) , 
             trck_custom_7                    NVARCHAR(255) , 
             trck_custom_8                    NVARCHAR(255) , 
             trck_custom_9                    NVARCHAR(255) , 
             AC_AcceptancyDate                DATETIME , 
             AC_Status                        VARCHAR(50) , 
             AC_UnsubscribeDate               DATETIME , 
             trck_is_consent                  INT , 
             trck_is_participation            INT , 
             trck_participation_text          NVARCHAR(4000) , 
             trck_is_subscribe                INT , 
             trck_subscribe_text              NVARCHAR(4000) , 
             trck_is_usage                    INT , 
             trck_usage_text                  NVARCHAR(4000) , 
             trck_campaign                    NVARCHAR(255) , 
             trck_referer                     NVARCHAR(255) , 
             trck_registration_ip             NVARCHAR(255) , 
             trck_subscribtion_ip             NVARCHAR(255) , 
             trck_subscribtion_source         NVARCHAR(255) , 
             trck_payload                     NVARCHAR(4000) , 
             Jobcode14                        VARCHAR(50) , 
             trck_source_system               VARCHAR(255) , 
             [LOADTS]                         [DATETIME2](4) NULL , 
             [ValidFrom]                      [DATETIME2](2) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL , 
             [ValidTo]                        [DATETIME2](2) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL , 
             CONSTRAINT [PK_tbl_C1_Interface_CustomerFlow] PRIMARY KEY CLUSTERED(trck_email_address ASC , trck_market ASC , trck_brand ASC) WITH(PAD_INDEX = OFF , STATISTICS_NORECOMPUTE = OFF , IGNORE_DUP_KEY = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] , 
             PERIOD FOR SYSTEM_TIME([ValidFrom] , [ValidTo])
                                                    ) 
ON [PRIMARY] WITH(SYSTEM_VERSIONING = ON(HISTORY_TABLE = [dbo].[tbl_C1_Interface_CustomerFlow_hist]));
GO


IF EXISTS (SELECT * FROM sysobjects  WHERE name = 'tbl_C1_Interface_CustomerFlow_exportfile'
		  ) DROP TABLE [dbo].[tbl_C1_Interface_CustomerFlow_exportfile];
GO		    
CREATE TABLE [dbo].[tbl_C1_Interface_CustomerFlow_exportfile] (
			 delivery_date					  DATETIME2(6) NULL,
			 rnk                              BIGINT , 
             trck_ID                          INT , 
             trck_touchpoint                  NVARCHAR(255) , 
             trck_uniqueID                    NVARCHAR(255) , 
             trck_market                      NVARCHAR(3) , 
             trck_division                    NVARCHAR(255) , 
             trck_brand                       NVARCHAR(128) , 
             trck_segment                     NVARCHAR(255) , 
             trck_email_address               NVARCHAR(128) , 
             trck_registration_date           DATETIME , 
             trck_creation_date               DATETIME , 
             trck_subscribtion_date           DATETIME , 
             trck_doi                         INT , 
             trck_is_unsubscribed             INT , 
             trck_unsubscribe_date            DATETIME , 
             trck_is_contactable              INT , 
             trck_last_edited_date            DATETIME , 
             trck_company_name                NVARCHAR(255) , 
             trck_title                       NVARCHAR(255) , 
             trck_first_name                  NVARCHAR(255) , 
             trck_last_name                   NVARCHAR(255) , 
             trck_additional_name_information NVARCHAR(255) , 
             trck_street                      NVARCHAR(255) , 
             trck_house_number                NVARCHAR(255) , 
             trck_additional_address          NVARCHAR(255) , 
             trck_zip_code                    NVARCHAR(255) , 
             trck_city                        NVARCHAR(255) , 
             trck_state                       NVARCHAR(255) , 
             trck_country                     NVARCHAR(3) , 
             trck_gender                      NVARCHAR(255) , 
             trck_birthday                    DATE , 
             trck_consent_text                NVARCHAR(MAX) , 
             trck_language                    NVARCHAR(3) , 
             trck_mobile_number               NVARCHAR(255) , 
             trck_landline_number             NVARCHAR(255) , 
             trck_last_contact_date           DATETIME , 
             trck_last_open_date              DATETIME , 
             trck_last_click_date             DATETIME , 
             trck_is_fake                     INT , 
             trck_DMR                         DATETIME , 
             trck_DCR                         DATETIME , 
             trck_Source                      NVARCHAR(255) , 
             trck_is_blocked                  INT , 
             trck_blockreason                 NVARCHAR(255) , 
             trck_change_comment              NVARCHAR(4000) , 
             trck_custom_1                    NVARCHAR(255) , 
             trck_custom_2                    NVARCHAR(255) , 
             trck_custom_3                    NVARCHAR(255) , 
             trck_custom_4                    NVARCHAR(255) , 
             trck_custom_5                    NVARCHAR(255) , 
             trck_custom_6                    NVARCHAR(255) , 
             trck_custom_7                    NVARCHAR(255) , 
             trck_custom_8                    NVARCHAR(255) , 
             trck_custom_9                    NVARCHAR(255) , 
             AC_AcceptancyDate                DATETIME , 
             AC_Status                        VARCHAR(50) , 
             AC_UnsubscribeDate               DATETIME , 
             trck_is_consent                  INT , 
             trck_is_participation            INT , 
             trck_participation_text          NVARCHAR(4000) , 
             trck_is_subscribe                INT , 
             trck_subscribe_text              NVARCHAR(4000) , 
             trck_is_usage                    INT , 
             trck_usage_text                  NVARCHAR(4000) , 
             trck_campaign                    NVARCHAR(255) , 
             trck_referer                     NVARCHAR(255) , 
             trck_registration_ip             NVARCHAR(255) , 
             trck_subscribtion_ip             NVARCHAR(255) , 
             trck_subscribtion_source         NVARCHAR(255) , 
             trck_payload                     NVARCHAR(4000) , 
             Jobcode14                        VARCHAR(50) , 
             trck_source_system               VARCHAR(255)
)
GO


IF EXISTS  (SELECT 1 FROM sys.all_views  WHERE name = 'vw_C1_Interface_CustomerFlow_exportfile'
			)	drop view  dbo.vw_C1_Interface_CustomerFlow_exportfile;
GO
create view dbo.vw_C1_Interface_CustomerFlow_exportfile
	as select	[rnk], 
				[trck_ID], 
				[trck_touchpoint], 
				[trck_uniqueID], 
				[trck_market], 
				[trck_division], 
				[trck_brand], 
				[trck_segment], 
				[trck_email_address], 
				[trck_registration_date], 
				[trck_creation_date], 
				[trck_subscribtion_date], 
				[trck_doi], 
				[trck_is_unsubscribed], 
				[trck_unsubscribe_date], 
				[trck_is_contactable], 
				[trck_last_edited_date], 
				[trck_company_name], 
				[trck_title], 
				[trck_first_name], 
				[trck_last_name], 
				[trck_additional_name_information], 
				[trck_street], 
				[trck_house_number], 
				[trck_additional_address], 
				[trck_zip_code], 
				[trck_city], 
				[trck_state], 
				[trck_country], 
				[trck_gender], 
				[trck_birthday], 
				[trck_consent_text], 
				[trck_language], 
				[trck_mobile_number], 
				[trck_landline_number], 
				[trck_last_contact_date], 
				[trck_last_open_date], 
				[trck_last_click_date], 
				[trck_is_fake], 
				[trck_DMR], 
				[trck_DCR], 
				[trck_Source], 
				[trck_is_blocked], 
				[trck_blockreason], 
				[trck_change_comment], 
				[trck_custom_1], 
				[trck_custom_2], 
				[trck_custom_3], 
				[trck_custom_4], 
				[trck_custom_5], 
				[trck_custom_6], 
				[trck_custom_7], 
				[trck_custom_8], 
				[trck_custom_9], 
				[AC_AcceptancyDate], 
				[AC_Status], 
				[AC_UnsubscribeDate], 
				[trck_is_consent], 
				[trck_is_participation], 
				[trck_participation_text], 
				[trck_is_subscribe], 
				[trck_subscribe_text], 
				[trck_is_usage], 
				[trck_usage_text], 
				[trck_campaign], 
				[trck_referer], 
				[trck_registration_ip], 
				[trck_subscribtion_ip], 
				[trck_subscribtion_source], 
				[trck_payload], 
				[Jobcode14], 
				[trck_source_system] from  dbo.tbl_C1_Interface_CustomerFlow_exportfile where delivery_date is null;
GO

	  	
IF EXISTS
(
    SELECT 1
    FROM sysobjects
    WHERE name = 'process_TrackOne_MasterData'
)
    DROP PROCEDURE process_TrackOne_MasterData;	
GO

CREATE PROCEDURE process_TrackOne_MasterData
AS
     BEGIN
         MERGE INTO dbo.[tbl_TrackOne_MasterData] AS t
         USING [dbo].[tbl_TrackOne_MasterData_prepare] AS s
		ON t.[trck_email_address] = s.[trck_email_address] COLLATE DATABASE_DEFAULT
            AND t.[trck_market]  = s.[trck_market] COLLATE DATABASE_DEFAULT
            AND t.[trck_brand] = s.[trck_brand] COLLATE DATABASE_DEFAULT
             WHEN NOT MATCHED BY TARGET
             THEN
               INSERT([rnk], 
                      [trck_ID], 
                      [trck_touchpoint], 
                      [trck_uniqueID], 
                      [trck_market], 
                      [trck_division], 
                      [trck_brand], 
                      [trck_segment], 
                      [trck_email_address], 
                      [trck_registration_date], 
                      [trck_creation_date], 
                      [trck_subscribtion_date], 
                      [trck_doi], 
                      [trck_is_unsubscribed], 
                      [trck_unsubscribe_date], 
                      [trck_is_contactable], 
                      [trck_last_edited_date], 
                      [trck_company_name], 
                      [trck_title], 
                      [trck_first_name], 
                      [trck_last_name], 
                      [trck_additional_name_information], 
                      [trck_street], 
                      [trck_house_number], 
                      [trck_additional_address], 
                      [trck_zip_code], 
                      [trck_city], 
                      [trck_state], 
                      [trck_country], 
                      [trck_gender], 
                      [trck_birthday], 
                      [trck_consent_text], 
                      [trck_language], 
                      [trck_mobile_number], 
                      [trck_landline_number], 
                      [trck_last_contact_date], 
                      [trck_last_open_date], 
                      [trck_last_click_date], 
                      [trck_is_fake], 
                      [trck_DMR], 
                      [trck_DCR], 
                      [trck_Source], 
                      [trck_is_blocked], 
                      [trck_blockreason], 
                      [trck_change_comment], 
                      [trck_custom_1], 
                      [trck_custom_2], 
                      [trck_custom_3], 
                      [trck_custom_4], 
                      [trck_custom_5], 
                      [trck_custom_6], 
                      [trck_custom_7], 
                      [trck_custom_8], 
                      [trck_custom_9], 
                      [AC_AcceptancyDate], 
                      [AC_Status], 
                      [AC_UnsubscribeDate], 
                      [trck_is_consent], 
                      [trck_is_participation], 
                      [trck_participation_text], 
                      [trck_is_subscribe], 
                      [trck_subscribe_text], 
                      [trck_is_usage], 
                      [trck_usage_text], 
                      [trck_campaign], 
                      [trck_referer], 
                      [trck_registration_ip], 
                      [trck_subscribtion_ip], 
                      [trck_subscribtion_source], 
                      [trck_payload], 
                      [Jobcode14], 
                      [trck_source_system])
               VALUES
         ([rnk], 
          [trck_ID], 
          [trck_touchpoint], 
          [trck_uniqueID], 
          [trck_market], 
          [trck_division], 
          [trck_brand], 
          [trck_segment], 
          [trck_email_address], 
          [trck_registration_date], 
          [trck_creation_date], 
          [trck_subscribtion_date], 
          [trck_doi], 
          [trck_is_unsubscribed], 
          [trck_unsubscribe_date], 
          [trck_is_contactable], 
          [trck_last_edited_date], 
          [trck_company_name], 
          [trck_title], 
          [trck_first_name], 
          [trck_last_name], 
          [trck_additional_name_information], 
          [trck_street], 
          [trck_house_number], 
          [trck_additional_address], 
          [trck_zip_code], 
          [trck_city], 
          [trck_state], 
          [trck_country], 
          [trck_gender], 
          [trck_birthday], 
          [trck_consent_text], 
          [trck_language], 
          [trck_mobile_number], 
          [trck_landline_number], 
          [trck_last_contact_date], 
          [trck_last_open_date], 
          [trck_last_click_date], 
          [trck_is_fake], 
          [trck_DMR], 
          [trck_DCR], 
          [trck_Source], 
          [trck_is_blocked], 
          [trck_blockreason], 
          [trck_change_comment], 
          [trck_custom_1], 
          [trck_custom_2], 
          [trck_custom_3], 
          [trck_custom_4], 
          [trck_custom_5], 
          [trck_custom_6], 
          [trck_custom_7], 
          [trck_custom_8], 
          [trck_custom_9], 
          [AC_AcceptancyDate], 
          [AC_Status], 
          [AC_UnsubscribeDate], 
          [trck_is_consent], 
          [trck_is_participation], 
          [trck_participation_text], 
          [trck_is_subscribe], 
          [trck_subscribe_text], 
          [trck_is_usage], 
          [trck_usage_text], 
          [trck_campaign], 
          [trck_referer], 
          [trck_registration_ip], 
          [trck_subscribtion_ip], 
          [trck_subscribtion_source], 
          [trck_payload], 
          [Jobcode14], 
          [trck_source_system]
         )
             WHEN MATCHED AND EXISTS
         (
             SELECT ist.[rnk], 
                            ist.[trck_ID], 
                            ist.[trck_touchpoint] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_uniqueID] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_market] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_division] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_brand] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_segment] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_email_address] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_registration_date], 
                            ist.[trck_creation_date], 
                            ist.[trck_subscribtion_date], 
                            ist.[trck_doi], 
                            ist.[trck_is_unsubscribed], 
                            ist.[trck_unsubscribe_date], 
                            ist.[trck_is_contactable], 
                            ist.[trck_last_edited_date], 
                            ist.[trck_company_name] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_title] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_first_name] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_last_name] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_additional_name_information] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_street] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_house_number] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_additional_address] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_zip_code] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_city] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_state] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_country] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_gender] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_birthday], 
                            ist.[trck_consent_text] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_language] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_mobile_number] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_landline_number] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_last_contact_date], 
                            ist.[trck_last_open_date], 
                            ist.[trck_last_click_date], 
                            ist.[trck_is_fake], 
                            ist.[trck_DMR], 
                            ist.[trck_DCR], 
                            ist.[trck_Source] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_is_blocked], 
                            ist.[trck_blockreason] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_change_comment] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_1] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_2] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_3] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_4] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_5] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_6] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_7] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_8] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_custom_9] COLLATE DATABASE_DEFAULT, 
                            ist.[AC_AcceptancyDate], 
                            ist.[AC_Status] COLLATE DATABASE_DEFAULT, 
                            ist.[AC_UnsubscribeDate], 
                            ist.[trck_is_consent], 
                            ist.[trck_is_participation], 
                            ist.[trck_participation_text] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_is_subscribe], 
                            ist.[trck_subscribe_text] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_is_usage], 
                            ist.[trck_usage_text] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_campaign] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_referer] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_registration_ip] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_subscribtion_ip] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_subscribtion_source] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_payload] COLLATE DATABASE_DEFAULT, 
                            ist.[Jobcode14] COLLATE DATABASE_DEFAULT, 
                            ist.[trck_source_system] COLLATE DATABASE_DEFAULT
             FROM [dbo].[tbl_TrackOne_MasterData_prepare] AS ist
             WHERE ist.[trck_email_address] COLLATE DATABASE_DEFAULT = [trck_email_address]	COLLATE DATABASE_DEFAULT
                   AND ist.[trck_market] COLLATE DATABASE_DEFAULT = [trck_market]  COLLATE DATABASE_DEFAULT
                   AND ist.[trck_brand] COLLATE DATABASE_DEFAULT = [trck_brand] COLLATE DATABASE_DEFAULT
             EXCEPT
             SELECT ita.[rnk], 
                            ita.[trck_ID], 
                            ita.[trck_touchpoint] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_uniqueID] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_market] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_division] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_brand] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_segment] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_email_address] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_registration_date], 
                            ita.[trck_creation_date], 
                            ita.[trck_subscribtion_date], 
                            ita.[trck_doi], 
                            ita.[trck_is_unsubscribed], 
                            ita.[trck_unsubscribe_date], 
                            ita.[trck_is_contactable], 
                            ita.[trck_last_edited_date], 
                            ita.[trck_company_name] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_title] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_first_name] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_last_name] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_additional_name_information] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_street] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_house_number] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_additional_address] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_zip_code] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_city] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_state] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_country] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_gender] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_birthday], 
                            ita.[trck_consent_text] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_language] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_mobile_number] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_landline_number] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_last_contact_date], 
                            ita.[trck_last_open_date], 
                            ita.[trck_last_click_date], 
                            ita.[trck_is_fake], 
                            ita.[trck_DMR], 
                            ita.[trck_DCR], 
                            ita.[trck_Source] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_is_blocked], 
                            ita.[trck_blockreason] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_change_comment] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_1] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_2] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_3] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_4] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_5] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_6] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_7] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_8] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_custom_9] COLLATE DATABASE_DEFAULT, 
                            ita.[AC_AcceptancyDate], 
                            ita.[AC_Status] COLLATE DATABASE_DEFAULT, 
                            ita.[AC_UnsubscribeDate], 
                            ita.[trck_is_consent], 
                            ita.[trck_is_participation], 
                            ita.[trck_participation_text] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_is_subscribe], 
                            ita.[trck_subscribe_text] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_is_usage], 
                            ita.[trck_usage_text] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_campaign] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_referer] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_registration_ip] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_subscribtion_ip] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_subscribtion_source] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_payload] COLLATE DATABASE_DEFAULT, 
                            ita.[Jobcode14] COLLATE DATABASE_DEFAULT, 
                            ita.[trck_source_system] COLLATE DATABASE_DEFAULT
             FROM [dbo].[tbl_TrackOne_MasterData] AS ita
             WHERE ita.[trck_email_address] COLLATE DATABASE_DEFAULT = [trck_email_address]	COLLATE DATABASE_DEFAULT
                   AND ita.[trck_market] COLLATE DATABASE_DEFAULT = [trck_market] COLLATE DATABASE_DEFAULT
                   AND ita.[trck_brand] COLLATE DATABASE_DEFAULT = [trck_brand]	COLLATE DATABASE_DEFAULT
         )
             THEN UPDATE SET 
                             T.RNK = S.RNK, 
                             T.TRCK_ID = S.TRCK_ID, 
                             T.TRCK_TOUCHPOINT = S.TRCK_TOUCHPOINT, 
                             T.TRCK_UNIQUEID = S.TRCK_UNIQUEID, 
                             T.TRCK_DIVISION = S.TRCK_DIVISION, 
                             T.TRCK_SEGMENT = S.TRCK_SEGMENT, 
                             T.TRCK_REGISTRATION_DATE = S.TRCK_REGISTRATION_DATE, 
                             T.TRCK_CREATION_DATE = S.TRCK_CREATION_DATE, 
                             T.TRCK_SUBSCRIBTION_DATE = S.TRCK_SUBSCRIBTION_DATE, 
                             T.TRCK_DOI = S.TRCK_DOI, 
                             T.TRCK_IS_UNSUBSCRIBED = S.TRCK_IS_UNSUBSCRIBED, 
                             T.TRCK_UNSUBSCRIBE_DATE = S.TRCK_UNSUBSCRIBE_DATE, 
                             T.TRCK_IS_CONTACTABLE = S.TRCK_IS_CONTACTABLE, 
                             T.TRCK_LAST_EDITED_DATE = S.TRCK_LAST_EDITED_DATE, 
                             T.TRCK_COMPANY_NAME = S.TRCK_COMPANY_NAME, 
                             T.TRCK_TITLE = S.TRCK_TITLE, 
                             T.TRCK_FIRST_NAME = S.TRCK_FIRST_NAME, 
                             T.TRCK_LAST_NAME = S.TRCK_LAST_NAME, 
                             T.TRCK_ADDITIONAL_NAME_INFORMATION = S.TRCK_ADDITIONAL_NAME_INFORMATION, 
                             T.TRCK_STREET = S.TRCK_STREET, 
                             T.TRCK_HOUSE_NUMBER = S.TRCK_HOUSE_NUMBER, 
                             T.TRCK_ADDITIONAL_ADDRESS = S.TRCK_ADDITIONAL_ADDRESS, 
                             T.TRCK_ZIP_CODE = S.TRCK_ZIP_CODE, 
                             T.TRCK_CITY = S.TRCK_CITY, 
                             T.TRCK_STATE = S.TRCK_STATE, 
                             T.TRCK_COUNTRY = S.TRCK_COUNTRY, 
                             T.TRCK_GENDER = S.TRCK_GENDER, 
                             T.TRCK_BIRTHDAY = S.TRCK_BIRTHDAY, 
                             T.TRCK_CONSENT_TEXT = S.TRCK_CONSENT_TEXT, 
                             T.TRCK_LANGUAGE = S.TRCK_LANGUAGE, 
                             T.TRCK_MOBILE_NUMBER = S.TRCK_MOBILE_NUMBER, 
                             T.TRCK_LANDLINE_NUMBER = S.TRCK_LANDLINE_NUMBER, 
                             T.TRCK_LAST_CONTACT_DATE = S.TRCK_LAST_CONTACT_DATE, 
                             T.TRCK_LAST_OPEN_DATE = S.TRCK_LAST_OPEN_DATE, 
                             T.TRCK_LAST_CLICK_DATE = S.TRCK_LAST_CLICK_DATE, 
                             T.TRCK_IS_FAKE = S.TRCK_IS_FAKE, 
                             T.TRCK_DMR = S.TRCK_DMR, 
                             T.TRCK_DCR = S.TRCK_DCR, 
                             T.TRCK_SOURCE = S.TRCK_SOURCE, 
                             T.TRCK_IS_BLOCKED = S.TRCK_IS_BLOCKED, 
                             T.TRCK_BLOCKREASON = S.TRCK_BLOCKREASON, 
                             T.TRCK_CHANGE_COMMENT = S.TRCK_CHANGE_COMMENT, 
                             T.TRCK_CUSTOM_1 = S.TRCK_CUSTOM_1, 
                             T.TRCK_CUSTOM_2 = S.TRCK_CUSTOM_2, 
                             T.TRCK_CUSTOM_3 = S.TRCK_CUSTOM_3, 
                             T.TRCK_CUSTOM_4 = S.TRCK_CUSTOM_4, 
                             T.TRCK_CUSTOM_5 = S.TRCK_CUSTOM_5, 
                             T.TRCK_CUSTOM_6 = S.TRCK_CUSTOM_6, 
                             T.TRCK_CUSTOM_7 = S.TRCK_CUSTOM_7, 
                             T.TRCK_CUSTOM_8 = S.TRCK_CUSTOM_8, 
                             T.TRCK_CUSTOM_9 = S.TRCK_CUSTOM_9, 
                             T.AC_ACCEPTANCYDATE = S.AC_ACCEPTANCYDATE, 
                             T.AC_STATUS = S.AC_STATUS, 
                             T.AC_UNSUBSCRIBEDATE = S.AC_UNSUBSCRIBEDATE, 
                             T.TRCK_IS_CONSENT = S.TRCK_IS_CONSENT, 
                             T.TRCK_IS_PARTICIPATION = S.TRCK_IS_PARTICIPATION, 
                             T.TRCK_PARTICIPATION_TEXT = S.TRCK_PARTICIPATION_TEXT, 
                             T.TRCK_IS_SUBSCRIBE = S.TRCK_IS_SUBSCRIBE, 
                             T.TRCK_SUBSCRIBE_TEXT = S.TRCK_SUBSCRIBE_TEXT, 
                             T.TRCK_IS_USAGE = S.TRCK_IS_USAGE, 
                             T.TRCK_USAGE_TEXT = S.TRCK_USAGE_TEXT, 
                             T.TRCK_CAMPAIGN = S.TRCK_CAMPAIGN, 
                             T.TRCK_REFERER = S.TRCK_REFERER, 
                             T.TRCK_REGISTRATION_IP = S.TRCK_REGISTRATION_IP, 
                             T.TRCK_SUBSCRIBTION_IP = S.TRCK_SUBSCRIBTION_IP, 
                             T.TRCK_SUBSCRIBTION_SOURCE = S.TRCK_SUBSCRIBTION_SOURCE, 
                             T.TRCK_PAYLOAD = S.TRCK_PAYLOAD, 
                             T.JOBCODE14 = S.JOBCODE14, 
                             T.TRCK_SOURCE_SYSTEM = S.TRCK_SOURCE_SYSTEM;
     END;
 GO

 IF EXISTS
(
    SELECT 1
    FROM sysobjects
    WHERE name = 'process_TrackOne_MasterDataEx'
)
    DROP PROCEDURE process_TrackOne_MasterDataEx;	
GO
CREATE PROCEDURE process_TrackOne_MasterDataEx
AS
     BEGIN

         --
         -- instead merge insert
         INSERT INTO dbo.[tbl_TrackOne_MasterData]
         ([rnk], 
          [trck_ID], 
          [trck_touchpoint], 
          [trck_uniqueID], 
          [trck_market], 
          [trck_division], 
          [trck_brand], 
          [trck_segment], 
          [trck_email_address], 
          [trck_registration_date], 
          [trck_creation_date], 
          [trck_subscribtion_date], 
          [trck_doi], 
          [trck_is_unsubscribed], 
          [trck_unsubscribe_date], 
          [trck_is_contactable], 
          [trck_last_edited_date], 
          [trck_company_name], 
          [trck_title], 
          [trck_first_name], 
          [trck_last_name], 
          [trck_additional_name_information], 
          [trck_street], 
          [trck_house_number], 
          [trck_additional_address], 
          [trck_zip_code], 
          [trck_city], 
          [trck_state], 
          [trck_country], 
          [trck_gender], 
          [trck_birthday], 
          [trck_consent_text], 
          [trck_language], 
          [trck_mobile_number], 
          [trck_landline_number], 
          [trck_last_contact_date], 
          [trck_last_open_date], 
          [trck_last_click_date], 
          [trck_is_fake], 
          [trck_DMR], 
          [trck_DCR], 
          [trck_Source], 
          [trck_is_blocked], 
          [trck_blockreason], 
          [trck_change_comment], 
          [trck_custom_1], 
          [trck_custom_2], 
          [trck_custom_3], 
          [trck_custom_4], 
          [trck_custom_5], 
          [trck_custom_6], 
          [trck_custom_7], 
          [trck_custom_8], 
          [trck_custom_9], 
          [AC_AcceptancyDate], 
          [AC_Status], 
          [AC_UnsubscribeDate], 
          [trck_is_consent], 
          [trck_is_participation], 
          [trck_participation_text], 
          [trck_is_subscribe], 
          [trck_subscribe_text], 
          [trck_is_usage], 
          [trck_usage_text], 
          [trck_campaign], 
          [trck_referer], 
          [trck_registration_ip], 
          [trck_subscribtion_ip], 
          [trck_subscribtion_source], 
          [trck_payload], 
          [Jobcode14], 
          [trck_source_system]
         )
                SELECT s.[rnk], 
                       s.[trck_ID], 
                       s.[trck_touchpoint], 
                       s.[trck_uniqueID], 
                       s.[trck_market], 
                       s.[trck_division], 
                       s.[trck_brand], 
                       s.[trck_segment], 
                       s.[trck_email_address], 
                       s.[trck_registration_date], 
                       s.[trck_creation_date], 
                       s.[trck_subscribtion_date], 
                       s.[trck_doi], 
                       s.[trck_is_unsubscribed], 
                       s.[trck_unsubscribe_date], 
                       s.[trck_is_contactable], 
                       s.[trck_last_edited_date], 
                       s.[trck_company_name], 
                       s.[trck_title], 
                       s.[trck_first_name], 
                       s.[trck_last_name], 
                       s.[trck_additional_name_information], 
                       s.[trck_street], 
                       s.[trck_house_number], 
                       s.[trck_additional_address], 
                       s.[trck_zip_code], 
                       s.[trck_city], 
                       s.[trck_state], 
                       s.[trck_country], 
                       s.[trck_gender], 
                       s.[trck_birthday], 
                       s.[trck_consent_text], 
                       s.[trck_language], 
                       s.[trck_mobile_number], 
                       s.[trck_landline_number], 
                       s.[trck_last_contact_date], 
                       s.[trck_last_open_date], 
                       s.[trck_last_click_date], 
                       s.[trck_is_fake], 
                       s.[trck_DMR], 
                       s.[trck_DCR], 
                       s.[trck_Source], 
                       s.[trck_is_blocked], 
                       s.[trck_blockreason], 
                       s.[trck_change_comment], 
                       s.[trck_custom_1], 
                       s.[trck_custom_2], 
                       s.[trck_custom_3], 
                       s.[trck_custom_4], 
                       s.[trck_custom_5], 
                       s.[trck_custom_6], 
                       s.[trck_custom_7], 
                       s.[trck_custom_8], 
                       s.[trck_custom_9], 
                       s.[AC_AcceptancyDate], 
                       s.[AC_Status], 
                       s.[AC_UnsubscribeDate], 
                       s.[trck_is_consent], 
                       s.[trck_is_participation], 
                       s.[trck_participation_text], 
                       s.[trck_is_subscribe], 
                       s.[trck_subscribe_text], 
                       s.[trck_is_usage], 
                       s.[trck_usage_text], 
                       s.[trck_campaign], 
                       s.[trck_referer], 
                       s.[trck_registration_ip], 
                       s.[trck_subscribtion_ip], 
                       s.[trck_subscribtion_source], 
                       s.[trck_payload], 
                       s.[Jobcode14], 
                       s.[trck_source_system]
                FROM [dbo].[tbl_TrackOne_MasterData_prepare] s
                     LEFT OUTER JOIN dbo.[tbl_TrackOne_MasterData] t ON s.[trck_email_address] = t.[trck_email_address]
                                                                        AND s.[trck_market] = t.[trck_market]
                                                                        AND s.[trck_brand] = t.[trck_brand]
                WHERE NOT EXISTS
                (
                    SELECT 1
                    FROM dbo.[tbl_TrackOne_MasterData] m
                    WHERE m.trck_email_address = s.trck_email_address
                          AND m.trck_brand = s.trck_brand
                          AND m.trck_market = s.trck_market
                );

         --
         --instead merge update		   
         UPDATE dbo.[tbl_TrackOne_MasterData]
           SET 
               RNK = S.RNK, 
               TRCK_ID = S.TRCK_ID, 
               TRCK_TOUCHPOINT = S.TRCK_TOUCHPOINT, 
               TRCK_UNIQUEID = S.TRCK_UNIQUEID, 
               TRCK_DIVISION = S.TRCK_DIVISION, 
               TRCK_SEGMENT = S.TRCK_SEGMENT, 
               TRCK_REGISTRATION_DATE = S.TRCK_REGISTRATION_DATE, 
               TRCK_CREATION_DATE = S.TRCK_CREATION_DATE, 
               TRCK_SUBSCRIBTION_DATE = S.TRCK_SUBSCRIBTION_DATE, 
               TRCK_DOI = S.TRCK_DOI, 
               TRCK_IS_UNSUBSCRIBED = S.TRCK_IS_UNSUBSCRIBED, 
               TRCK_UNSUBSCRIBE_DATE = S.TRCK_UNSUBSCRIBE_DATE, 
               TRCK_IS_CONTACTABLE = S.TRCK_IS_CONTACTABLE, 
               TRCK_LAST_EDITED_DATE = S.TRCK_LAST_EDITED_DATE, 
               TRCK_COMPANY_NAME = S.TRCK_COMPANY_NAME, 
               TRCK_TITLE = S.TRCK_TITLE, 
               TRCK_FIRST_NAME = S.TRCK_FIRST_NAME, 
               TRCK_LAST_NAME = S.TRCK_LAST_NAME, 
               TRCK_ADDITIONAL_NAME_INFORMATION = S.TRCK_ADDITIONAL_NAME_INFORMATION, 
               TRCK_STREET = S.TRCK_STREET, 
               TRCK_HOUSE_NUMBER = S.TRCK_HOUSE_NUMBER, 
               TRCK_ADDITIONAL_ADDRESS = S.TRCK_ADDITIONAL_ADDRESS, 
               TRCK_ZIP_CODE = S.TRCK_ZIP_CODE, 
               TRCK_CITY = S.TRCK_CITY, 
               TRCK_STATE = S.TRCK_STATE, 
               TRCK_COUNTRY = S.TRCK_COUNTRY, 
               TRCK_GENDER = S.TRCK_GENDER, 
               TRCK_BIRTHDAY = S.TRCK_BIRTHDAY, 
               TRCK_CONSENT_TEXT = S.TRCK_CONSENT_TEXT, 
               TRCK_LANGUAGE = S.TRCK_LANGUAGE, 
               TRCK_MOBILE_NUMBER = S.TRCK_MOBILE_NUMBER, 
               TRCK_LANDLINE_NUMBER = S.TRCK_LANDLINE_NUMBER, 
               TRCK_LAST_CONTACT_DATE = S.TRCK_LAST_CONTACT_DATE, 
               TRCK_LAST_OPEN_DATE = S.TRCK_LAST_OPEN_DATE, 
               TRCK_LAST_CLICK_DATE = S.TRCK_LAST_CLICK_DATE, 
               TRCK_IS_FAKE = S.TRCK_IS_FAKE, 
               TRCK_DMR = S.TRCK_DMR, 
               TRCK_DCR = S.TRCK_DCR, 
               TRCK_SOURCE = S.TRCK_SOURCE, 
               TRCK_IS_BLOCKED = S.TRCK_IS_BLOCKED, 
               TRCK_BLOCKREASON = S.TRCK_BLOCKREASON, 
               TRCK_CHANGE_COMMENT = S.TRCK_CHANGE_COMMENT, 
               TRCK_CUSTOM_1 = S.TRCK_CUSTOM_1, 
               TRCK_CUSTOM_2 = S.TRCK_CUSTOM_2, 
               TRCK_CUSTOM_3 = S.TRCK_CUSTOM_3, 
               TRCK_CUSTOM_4 = S.TRCK_CUSTOM_4, 
               TRCK_CUSTOM_5 = S.TRCK_CUSTOM_5, 
               TRCK_CUSTOM_6 = S.TRCK_CUSTOM_6, 
               TRCK_CUSTOM_7 = S.TRCK_CUSTOM_7, 
               TRCK_CUSTOM_8 = S.TRCK_CUSTOM_8, 
               TRCK_CUSTOM_9 = S.TRCK_CUSTOM_9, 
               AC_ACCEPTANCYDATE = S.AC_ACCEPTANCYDATE, 
               AC_STATUS = S.AC_STATUS, 
               AC_UNSUBSCRIBEDATE = S.AC_UNSUBSCRIBEDATE, 
               TRCK_IS_CONSENT = S.TRCK_IS_CONSENT, 
               TRCK_IS_PARTICIPATION = S.TRCK_IS_PARTICIPATION, 
               TRCK_PARTICIPATION_TEXT = S.TRCK_PARTICIPATION_TEXT, 
               TRCK_IS_SUBSCRIBE = S.TRCK_IS_SUBSCRIBE, 
               TRCK_SUBSCRIBE_TEXT = S.TRCK_SUBSCRIBE_TEXT, 
               TRCK_IS_USAGE = S.TRCK_IS_USAGE, 
               TRCK_USAGE_TEXT = S.TRCK_USAGE_TEXT, 
               TRCK_CAMPAIGN = S.TRCK_CAMPAIGN, 
               TRCK_REFERER = S.TRCK_REFERER, 
               TRCK_REGISTRATION_IP = S.TRCK_REGISTRATION_IP, 
               TRCK_SUBSCRIBTION_IP = S.TRCK_SUBSCRIBTION_IP, 
               TRCK_SUBSCRIBTION_SOURCE = S.TRCK_SUBSCRIBTION_SOURCE, 
               TRCK_PAYLOAD = S.TRCK_PAYLOAD, 
               JOBCODE14 = S.JOBCODE14, 
               TRCK_SOURCE_SYSTEM = S.TRCK_SOURCE_SYSTEM
         FROM
         (
             SELECT ist.[rnk], 
                    ist.[trck_ID], 
                    ist.[trck_touchpoint], 
                    ist.[trck_uniqueID], 
                    ist.[trck_market], 
                    ist.[trck_division], 
                    ist.[trck_brand], 
                    ist.[trck_segment], 
                    ist.[trck_email_address], 
                    ist.[trck_registration_date], 
                    ist.[trck_creation_date], 
                    ist.[trck_subscribtion_date], 
                    ist.[trck_doi], 
                    ist.[trck_is_unsubscribed], 
                    ist.[trck_unsubscribe_date], 
                    ist.[trck_is_contactable], 
                    ist.[trck_last_edited_date], 
                    ist.[trck_company_name], 
                    ist.[trck_title], 
                    ist.[trck_first_name], 
                    ist.[trck_last_name], 
                    ist.[trck_additional_name_information], 
                    ist.[trck_street], 
                    ist.[trck_house_number], 
                    ist.[trck_additional_address], 
                    ist.[trck_zip_code], 
                    ist.[trck_city], 
                    ist.[trck_state], 
                    ist.[trck_country], 
                    ist.[trck_gender], 
                    ist.[trck_birthday], 
                    ist.[trck_consent_text], 
                    ist.[trck_language], 
                    ist.[trck_mobile_number], 
                    ist.[trck_landline_number], 
                    ist.[trck_last_contact_date], 
                    ist.[trck_last_open_date], 
                    ist.[trck_last_click_date], 
                    ist.[trck_is_fake], 
                    ist.[trck_DMR], 
                    ist.[trck_DCR], 
                    ist.[trck_Source], 
                    ist.[trck_is_blocked], 
                    ist.[trck_blockreason], 
                    ist.[trck_change_comment], 
                    ist.[trck_custom_1], 
                    ist.[trck_custom_2], 
                    ist.[trck_custom_3], 
                    ist.[trck_custom_4], 
                    ist.[trck_custom_5], 
                    ist.[trck_custom_6], 
                    ist.[trck_custom_7], 
                    ist.[trck_custom_8], 
                    ist.[trck_custom_9], 
                    ist.[AC_AcceptancyDate], 
                    ist.[AC_Status], 
                    ist.[AC_UnsubscribeDate], 
                    ist.[trck_is_consent], 
                    ist.[trck_is_participation], 
                    ist.[trck_participation_text], 
                    ist.[trck_is_subscribe], 
                    ist.[trck_subscribe_text], 
                    ist.[trck_is_usage], 
                    ist.[trck_usage_text], 
                    ist.[trck_campaign], 
                    ist.[trck_referer], 
                    ist.[trck_registration_ip], 
                    ist.[trck_subscribtion_ip], 
                    ist.[trck_subscribtion_source], 
                    ist.[trck_payload], 
                    ist.[Jobcode14], 
                    ist.[trck_source_system]
             FROM [dbo].[tbl_TrackOne_MasterData_prepare] AS ist
             WHERE ist.[trck_email_address] = [trck_email_address]
                   AND ist.[trck_market] = [trck_market]
                   AND ist.[trck_brand] = [trck_brand]
             EXCEPT
             SELECT ita.[rnk], 
                    ita.[trck_ID], 
                    ita.[trck_touchpoint], 
                    ita.[trck_uniqueID], 
                    ita.[trck_market], 
                    ita.[trck_division], 
                    ita.[trck_brand], 
                    ita.[trck_segment], 
                    ita.[trck_email_address], 
                    ita.[trck_registration_date], 
                    ita.[trck_creation_date], 
                    ita.[trck_subscribtion_date], 
                    ita.[trck_doi], 
                    ita.[trck_is_unsubscribed], 
                    ita.[trck_unsubscribe_date], 
                    ita.[trck_is_contactable], 
                    ita.[trck_last_edited_date], 
                    ita.[trck_company_name], 
                    ita.[trck_title], 
                    ita.[trck_first_name], 
                    ita.[trck_last_name], 
                    ita.[trck_additional_name_information], 
                    ita.[trck_street], 
                    ita.[trck_house_number], 
                    ita.[trck_additional_address], 
                    ita.[trck_zip_code], 
                    ita.[trck_city], 
                    ita.[trck_state], 
                    ita.[trck_country], 
                    ita.[trck_gender], 
                    ita.[trck_birthday], 
                    ita.[trck_consent_text], 
                    ita.[trck_language], 
                    ita.[trck_mobile_number], 
                    ita.[trck_landline_number], 
                    ita.[trck_last_contact_date], 
                    ita.[trck_last_open_date], 
                    ita.[trck_last_click_date], 
                    ita.[trck_is_fake], 
                    ita.[trck_DMR], 
                    ita.[trck_DCR], 
                    ita.[trck_Source], 
                    ita.[trck_is_blocked], 
                    ita.[trck_blockreason], 
                    ita.[trck_change_comment], 
                    ita.[trck_custom_1], 
                    ita.[trck_custom_2], 
                    ita.[trck_custom_3], 
                    ita.[trck_custom_4], 
                    ita.[trck_custom_5], 
                    ita.[trck_custom_6], 
                    ita.[trck_custom_7], 
                    ita.[trck_custom_8], 
                    ita.[trck_custom_9], 
                    ita.[AC_AcceptancyDate], 
                    ita.[AC_Status], 
                    ita.[AC_UnsubscribeDate], 
                    ita.[trck_is_consent], 
                    ita.[trck_is_participation], 
                    ita.[trck_participation_text], 
                    ita.[trck_is_subscribe], 
                    ita.[trck_subscribe_text], 
                    ita.[trck_is_usage], 
                    ita.[trck_usage_text], 
                    ita.[trck_campaign], 
                    ita.[trck_referer], 
                    ita.[trck_registration_ip], 
                    ita.[trck_subscribtion_ip], 
                    ita.[trck_subscribtion_source], 
                    ita.[trck_payload], 
                    ita.[Jobcode14], 
                    ita.[trck_source_system]
             FROM [dbo].[tbl_TrackOne_MasterData] AS ita
             WHERE ita.[trck_email_address] = [trck_email_address]
                   AND ita.[trck_market] = [trck_market]
                   AND ita.[trck_brand] = [trck_brand]
         ) AS S
         WHERE [tbl_TrackOne_MasterData].[trck_email_address] = S.[trck_email_address]
               AND [tbl_TrackOne_MasterData].[trck_market] = S.[trck_market]
               AND [tbl_TrackOne_MasterData].[trck_brand] = S.[trck_brand];
     END;
 GO


 IF EXISTS
(
	SELECT 1
	FROM sysobjects
	WHERE name = 'process_TrackOne_deltaCalculation'
)
BEGIN
	DROP PROCEDURE process_TrackOne_deltaCalculation;
END;	
GO
CREATE PROCEDURE process_TrackOne_deltaCalculation
AS
     BEGIN
         IF NOT EXISTS
         (
             SELECT 1
             FROM [dbo].[tbl_TrackOne_MasterData_prepare]
             HAVING MAX(loadts) =
             (
                 SELECT MAX(loadts)
                 FROM dbo.tbl_C1_Interface_CustomerFlow
             )
         )
             BEGIN
                 DECLARE @rowsdeleted INTEGER= 0;
                 DELETE FROM 
                 --select * from 
                 dbo.tbl_C1_Interface_CustomerFlow
                 WHERE EXISTS
                 (
                     SELECT [rnk], 
                            [trck_ID], 
                            [trck_touchpoint] COLLATE DATABASE_DEFAULT, 
                            [trck_uniqueID] COLLATE DATABASE_DEFAULT, 
                            [trck_market] COLLATE DATABASE_DEFAULT, 
                            [trck_division] COLLATE DATABASE_DEFAULT, 
                            [trck_brand] COLLATE DATABASE_DEFAULT, 
                            [trck_segment] COLLATE DATABASE_DEFAULT, 
                            [trck_email_address] COLLATE DATABASE_DEFAULT, 
                            [trck_registration_date], 
                            [trck_creation_date], 
                            [trck_subscribtion_date], 
                            [trck_doi], 
                            [trck_is_unsubscribed], 
                            [trck_unsubscribe_date], 
                            [trck_is_contactable], 
                            [trck_last_edited_date], 
                            [trck_company_name] COLLATE DATABASE_DEFAULT, 
                            [trck_title] COLLATE DATABASE_DEFAULT, 
                            [trck_first_name] COLLATE DATABASE_DEFAULT, 
                            [trck_last_name] COLLATE DATABASE_DEFAULT, 
                            [trck_additional_name_information] COLLATE DATABASE_DEFAULT, 
                            [trck_street] COLLATE DATABASE_DEFAULT, 
                            [trck_house_number] COLLATE DATABASE_DEFAULT, 
                            [trck_additional_address] COLLATE DATABASE_DEFAULT, 
                            [trck_zip_code] COLLATE DATABASE_DEFAULT, 
                            [trck_city] COLLATE DATABASE_DEFAULT, 
                            [trck_state] COLLATE DATABASE_DEFAULT, 
                            [trck_country] COLLATE DATABASE_DEFAULT, 
                            [trck_gender] COLLATE DATABASE_DEFAULT, 
                            [trck_birthday], 
                            [trck_consent_text] COLLATE DATABASE_DEFAULT, 
                            [trck_language] COLLATE DATABASE_DEFAULT, 
                            [trck_mobile_number] COLLATE DATABASE_DEFAULT, 
                            [trck_landline_number] COLLATE DATABASE_DEFAULT, 
                            [trck_last_contact_date], 
                            [trck_last_open_date], 
                            [trck_last_click_date], 
                            [trck_is_fake], 
                            [trck_DMR], 
                            [trck_DCR], 
                            [trck_Source] COLLATE DATABASE_DEFAULT, 
                            [trck_is_blocked], 
                            [trck_blockreason] COLLATE DATABASE_DEFAULT, 
                            [trck_change_comment] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_1] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_2] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_3] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_4] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_5] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_6] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_7] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_8] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_9] COLLATE DATABASE_DEFAULT, 
                            [AC_AcceptancyDate], 
                            [AC_Status] COLLATE DATABASE_DEFAULT, 
                            [AC_UnsubscribeDate], 
                            [trck_is_consent], 
                            [trck_is_participation], 
                            [trck_participation_text] COLLATE DATABASE_DEFAULT, 
                            [trck_is_subscribe], 
                            [trck_subscribe_text] COLLATE DATABASE_DEFAULT, 
                            [trck_is_usage], 
                            [trck_usage_text] COLLATE DATABASE_DEFAULT, 
                            [trck_campaign] COLLATE DATABASE_DEFAULT, 
                            [trck_referer] COLLATE DATABASE_DEFAULT, 
                            [trck_registration_ip] COLLATE DATABASE_DEFAULT, 
                            [trck_subscribtion_ip] COLLATE DATABASE_DEFAULT, 
                            [trck_subscribtion_source] COLLATE DATABASE_DEFAULT, 
                            [trck_payload] COLLATE DATABASE_DEFAULT, 
                            [Jobcode14] COLLATE DATABASE_DEFAULT, 
                            [trck_source_system] COLLATE DATABASE_DEFAULT
                     FROM [dbo].[tbl_TrackOne_MasterData_prepare]
                     WHERE [trck_email_address] COLLATE DATABASE_DEFAULT = dbo.tbl_C1_Interface_CustomerFlow.[trck_email_address] COLLATE DATABASE_DEFAULT
                           AND [trck_market] COLLATE DATABASE_DEFAULT = dbo.tbl_C1_Interface_CustomerFlow.[trck_market] COLLATE DATABASE_DEFAULT
                           AND [trck_brand] COLLATE DATABASE_DEFAULT = dbo.tbl_C1_Interface_CustomerFlow.[trck_brand] COLLATE DATABASE_DEFAULT
                     EXCEPT
                     SELECT [rnk], 
                            [trck_ID], 
                            [trck_touchpoint] COLLATE DATABASE_DEFAULT, 
                            [trck_uniqueID] COLLATE DATABASE_DEFAULT, 
                            [trck_market] COLLATE DATABASE_DEFAULT, 
                            [trck_division] COLLATE DATABASE_DEFAULT, 
                            [trck_brand] COLLATE DATABASE_DEFAULT, 
                            [trck_segment] COLLATE DATABASE_DEFAULT, 
                            [trck_email_address] COLLATE DATABASE_DEFAULT, 
                            [trck_registration_date], 
                            [trck_creation_date], 
                            [trck_subscribtion_date], 
                            [trck_doi], 
                            [trck_is_unsubscribed], 
                            [trck_unsubscribe_date], 
                            [trck_is_contactable], 
                            [trck_last_edited_date], 
                            [trck_company_name] COLLATE DATABASE_DEFAULT, 
                            [trck_title] COLLATE DATABASE_DEFAULT, 
                            [trck_first_name] COLLATE DATABASE_DEFAULT, 
                            [trck_last_name] COLLATE DATABASE_DEFAULT, 
                            [trck_additional_name_information] COLLATE DATABASE_DEFAULT, 
                            [trck_street] COLLATE DATABASE_DEFAULT, 
                            [trck_house_number] COLLATE DATABASE_DEFAULT, 
                            [trck_additional_address] COLLATE DATABASE_DEFAULT, 
                            [trck_zip_code] COLLATE DATABASE_DEFAULT, 
                            [trck_city] COLLATE DATABASE_DEFAULT, 
                            [trck_state] COLLATE DATABASE_DEFAULT, 
                            [trck_country] COLLATE DATABASE_DEFAULT, 
                            [trck_gender] COLLATE DATABASE_DEFAULT, 
                            [trck_birthday], 
                            [trck_consent_text] COLLATE DATABASE_DEFAULT, 
                            [trck_language] COLLATE DATABASE_DEFAULT, 
                            [trck_mobile_number] COLLATE DATABASE_DEFAULT, 
                            [trck_landline_number] COLLATE DATABASE_DEFAULT, 
                            [trck_last_contact_date], 
                            [trck_last_open_date], 
                            [trck_last_click_date], 
                            [trck_is_fake], 
                            [trck_DMR], 
                            [trck_DCR], 
                            [trck_Source] COLLATE DATABASE_DEFAULT, 
                            [trck_is_blocked], 
                            [trck_blockreason] COLLATE DATABASE_DEFAULT, 
                            [trck_change_comment] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_1] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_2] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_3] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_4] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_5] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_6] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_7] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_8] COLLATE DATABASE_DEFAULT, 
                            [trck_custom_9] COLLATE DATABASE_DEFAULT, 
                            [AC_AcceptancyDate], 
                            [AC_Status] COLLATE DATABASE_DEFAULT, 
                            [AC_UnsubscribeDate], 
                            [trck_is_consent], 
                            [trck_is_participation], 
                            [trck_participation_text] COLLATE DATABASE_DEFAULT, 
                            [trck_is_subscribe], 
                            [trck_subscribe_text] COLLATE DATABASE_DEFAULT, 
                            [trck_is_usage], 
                            [trck_usage_text] COLLATE DATABASE_DEFAULT, 
                            [trck_campaign] COLLATE DATABASE_DEFAULT, 
                            [trck_referer] COLLATE DATABASE_DEFAULT, 
                            [trck_registration_ip] COLLATE DATABASE_DEFAULT, 
                            [trck_subscribtion_ip] COLLATE DATABASE_DEFAULT, 
                            [trck_subscribtion_source] COLLATE DATABASE_DEFAULT, 
                            [trck_payload] COLLATE DATABASE_DEFAULT, 
                            [Jobcode14] COLLATE DATABASE_DEFAULT, 
                            [trck_source_system] COLLATE DATABASE_DEFAULT
                     FROM dbo.[tbl_TrackOne_MasterData]
                     WHERE [trck_email_address] COLLATE DATABASE_DEFAULT = dbo.tbl_C1_Interface_CustomerFlow.[trck_email_address] COLLATE DATABASE_DEFAULT
                           AND [trck_market] COLLATE DATABASE_DEFAULT = dbo.tbl_C1_Interface_CustomerFlow.[trck_market] COLLATE DATABASE_DEFAULT
                           AND [trck_brand] COLLATE DATABASE_DEFAULT = dbo.tbl_C1_Interface_CustomerFlow.[trck_brand] COLLATE DATABASE_DEFAULT
                 );
                 SET @rowsdeleted =
                 (
                     SELECT @@ROWCOUNT AS DELETED
                 );

                 --
                 --	delta calculation and persisting against
                 --	delta hive

                 IF(@rowsdeleted > 0
                    OR (@rowsdeleted = 0
                        OR
                 (
                     SELECT COUNT(1)
                     FROM dbo.tbl_C1_Interface_CustomerFlow
                 ) = 0))
                     BEGIN
                         WITH deltastmt
                              AS (SELECT NEWID() AS nid, 
                                         s.[trck_email_address], 
                                         s.[trck_market], 
                                         s.[trck_brand], 
                                         DBO.FN_AHC(S.RNK, A.RNK) AS RNK, 
                                         DBO.FN_AHC(S.TRCK_ID, A.TRCK_ID) AS TRCK_ID, 
                                         DBO.FN_AHC(S.TRCK_TOUCHPOINT, A.TRCK_TOUCHPOINT) AS TRCK_TOUCHPOINT, 
                                         DBO.FN_AHC(S.TRCK_UNIQUEID, A.TRCK_UNIQUEID) AS TRCK_UNIQUEID, 
                                         DBO.FN_AHC(S.TRCK_DIVISION, A.TRCK_DIVISION) AS TRCK_DIVISION, 
                                         DBO.FN_AHC(S.TRCK_SEGMENT, A.TRCK_SEGMENT) AS TRCK_SEGMENT, 
                                         DBO.FN_AHC(S.TRCK_REGISTRATION_DATE, A.TRCK_REGISTRATION_DATE) AS TRCK_REGISTRATION_DATE, 
                                         DBO.FN_AHC(S.TRCK_CREATION_DATE, A.TRCK_CREATION_DATE) AS TRCK_CREATION_DATE, 
                                         DBO.FN_AHC(S.TRCK_SUBSCRIBTION_DATE, A.TRCK_SUBSCRIBTION_DATE) AS TRCK_SUBSCRIBTION_DATE, 
                                         DBO.FN_AHC(S.TRCK_DOI, A.TRCK_DOI) AS TRCK_DOI, 
                                         DBO.FN_AHC(S.TRCK_IS_UNSUBSCRIBED, A.TRCK_IS_UNSUBSCRIBED) AS TRCK_IS_UNSUBSCRIBED, 
                                         DBO.FN_AHC(S.TRCK_UNSUBSCRIBE_DATE, A.TRCK_UNSUBSCRIBE_DATE) AS TRCK_UNSUBSCRIBE_DATE, 
                                         DBO.FN_AHC(S.TRCK_IS_CONTACTABLE, A.TRCK_IS_CONTACTABLE) AS TRCK_IS_CONTACTABLE, 
                                         DBO.FN_AHC(S.TRCK_LAST_EDITED_DATE, A.TRCK_LAST_EDITED_DATE) AS TRCK_LAST_EDITED_DATE, 
                                         DBO.FN_AHC(S.TRCK_COMPANY_NAME, A.TRCK_COMPANY_NAME) AS TRCK_COMPANY_NAME, 
                                         DBO.FN_AHC(S.TRCK_TITLE, A.TRCK_TITLE) AS TRCK_TITLE, 
                                         DBO.FN_AHC(S.TRCK_FIRST_NAME, A.TRCK_FIRST_NAME) AS TRCK_FIRST_NAME, 
                                         DBO.FN_AHC(S.TRCK_LAST_NAME, A.TRCK_LAST_NAME) AS TRCK_LAST_NAME, 
                                         DBO.FN_AHC(S.TRCK_ADDITIONAL_NAME_INFORMATION, A.TRCK_ADDITIONAL_NAME_INFORMATION) AS TRCK_ADDITIONAL_NAME_INFORMATION, 
                                         DBO.FN_AHC(S.TRCK_STREET, A.TRCK_STREET) AS TRCK_STREET, 
                                         DBO.FN_AHC(S.TRCK_HOUSE_NUMBER, A.TRCK_HOUSE_NUMBER) AS TRCK_HOUSE_NUMBER, 
                                         DBO.FN_AHC(S.TRCK_ADDITIONAL_ADDRESS, A.TRCK_ADDITIONAL_ADDRESS) AS TRCK_ADDITIONAL_ADDRESS, 
                                         DBO.FN_AHC(S.TRCK_ZIP_CODE, A.TRCK_ZIP_CODE) AS TRCK_ZIP_CODE, 
                                         DBO.FN_AHC(S.TRCK_CITY, A.TRCK_CITY) AS TRCK_CITY, 
                                         DBO.FN_AHC(S.TRCK_STATE, A.TRCK_STATE) AS TRCK_STATE, 
                                         DBO.FN_AHC(S.TRCK_COUNTRY, A.TRCK_COUNTRY) AS TRCK_COUNTRY, 
                                         DBO.FN_AHC(S.TRCK_GENDER, A.TRCK_GENDER) AS TRCK_GENDER, 
                                         DBO.FN_AHC(S.TRCK_BIRTHDAY, A.TRCK_BIRTHDAY) AS TRCK_BIRTHDAY, 
                                         DBO.FN_AHC(S.TRCK_CONSENT_TEXT, A.TRCK_CONSENT_TEXT) AS TRCK_CONSENT_TEXT, 
                                         DBO.FN_AHC(S.TRCK_LANGUAGE, A.TRCK_LANGUAGE) AS TRCK_LANGUAGE, 
                                         DBO.FN_AHC(S.TRCK_MOBILE_NUMBER, A.TRCK_MOBILE_NUMBER) AS TRCK_MOBILE_NUMBER, 
                                         DBO.FN_AHC(S.TRCK_LANDLINE_NUMBER, A.TRCK_LANDLINE_NUMBER) AS TRCK_LANDLINE_NUMBER, 
                                         DBO.FN_AHC(S.TRCK_LAST_CONTACT_DATE, A.TRCK_LAST_CONTACT_DATE) AS TRCK_LAST_CONTACT_DATE, 
                                         DBO.FN_AHC(S.TRCK_LAST_OPEN_DATE, A.TRCK_LAST_OPEN_DATE) AS TRCK_LAST_OPEN_DATE, 
                                         DBO.FN_AHC(S.TRCK_LAST_CLICK_DATE, A.TRCK_LAST_CLICK_DATE) AS TRCK_LAST_CLICK_DATE, 
                                         DBO.FN_AHC(S.TRCK_IS_FAKE, A.TRCK_IS_FAKE) AS TRCK_IS_FAKE, 
                                         DBO.FN_AHC(S.TRCK_DMR, A.TRCK_DMR) AS TRCK_DMR, 
                                         DBO.FN_AHC(S.TRCK_DCR, A.TRCK_DCR) AS TRCK_DCR, 
                                         DBO.FN_AHC(S.TRCK_SOURCE, A.TRCK_SOURCE) AS TRCK_SOURCE, 
                                         DBO.FN_AHC(S.TRCK_IS_BLOCKED, A.TRCK_IS_BLOCKED) AS TRCK_IS_BLOCKED, 
                                         DBO.FN_AHC(S.TRCK_BLOCKREASON, A.TRCK_BLOCKREASON) AS TRCK_BLOCKREASON, 
                                         DBO.FN_AHC(S.TRCK_CHANGE_COMMENT, A.TRCK_CHANGE_COMMENT) AS TRCK_CHANGE_COMMENT, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_1, A.TRCK_CUSTOM_1) AS TRCK_CUSTOM_1, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_2, A.TRCK_CUSTOM_2) AS TRCK_CUSTOM_2, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_3, A.TRCK_CUSTOM_3) AS TRCK_CUSTOM_3, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_4, A.TRCK_CUSTOM_4) AS TRCK_CUSTOM_4, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_5, A.TRCK_CUSTOM_5) AS TRCK_CUSTOM_5, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_6, A.TRCK_CUSTOM_6) AS TRCK_CUSTOM_6, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_7, A.TRCK_CUSTOM_7) AS TRCK_CUSTOM_7, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_8, A.TRCK_CUSTOM_8) AS TRCK_CUSTOM_8, 
                                         DBO.FN_AHC(S.TRCK_CUSTOM_9, A.TRCK_CUSTOM_9) AS TRCK_CUSTOM_9, 
                                         DBO.FN_AHC(S.AC_ACCEPTANCYDATE, A.AC_ACCEPTANCYDATE) AS AC_ACCEPTANCYDATE, 
                                         DBO.FN_AHC(S.AC_STATUS, A.AC_STATUS) AS AC_STATUS, 
                                         DBO.FN_AHC(S.AC_UNSUBSCRIBEDATE, A.AC_UNSUBSCRIBEDATE) AS AC_UNSUBSCRIBEDATE, 
                                         DBO.FN_AHC(S.TRCK_IS_CONSENT, A.TRCK_IS_CONSENT) AS TRCK_IS_CONSENT, 
                                         DBO.FN_AHC(S.TRCK_IS_PARTICIPATION, A.TRCK_IS_PARTICIPATION) AS TRCK_IS_PARTICIPATION, 
                                         DBO.FN_AHC(S.TRCK_PARTICIPATION_TEXT, A.TRCK_PARTICIPATION_TEXT) AS TRCK_PARTICIPATION_TEXT, 
                                         DBO.FN_AHC(S.TRCK_IS_SUBSCRIBE, A.TRCK_IS_SUBSCRIBE) AS TRCK_IS_SUBSCRIBE, 
                                         DBO.FN_AHC(S.TRCK_SUBSCRIBE_TEXT, A.TRCK_SUBSCRIBE_TEXT) AS TRCK_SUBSCRIBE_TEXT, 
                                         DBO.FN_AHC(S.TRCK_IS_USAGE, A.TRCK_IS_USAGE) AS TRCK_IS_USAGE, 
                                         DBO.FN_AHC(S.TRCK_USAGE_TEXT, A.TRCK_USAGE_TEXT) AS TRCK_USAGE_TEXT, 
                                         DBO.FN_AHC(S.TRCK_CAMPAIGN, A.TRCK_CAMPAIGN) AS TRCK_CAMPAIGN, 
                                         DBO.FN_AHC(S.TRCK_REFERER, A.TRCK_REFERER) AS TRCK_REFERER, 
                                         DBO.FN_AHC(S.TRCK_REGISTRATION_IP, A.TRCK_REGISTRATION_IP) AS TRCK_REGISTRATION_IP, 
                                         DBO.FN_AHC(S.TRCK_SUBSCRIBTION_IP, A.TRCK_SUBSCRIBTION_IP) AS TRCK_SUBSCRIBTION_IP, 
                                         DBO.FN_AHC(S.TRCK_SUBSCRIBTION_SOURCE, A.TRCK_SUBSCRIBTION_SOURCE) AS TRCK_SUBSCRIBTION_SOURCE, 
                                         DBO.FN_AHC(S.TRCK_PAYLOAD, A.TRCK_PAYLOAD) AS TRCK_PAYLOAD, 
                                         DBO.FN_AHC(S.JOBCODE14, A.JOBCODE14) AS JOBCODE14, 
                                         DBO.FN_AHC(S.TRCK_SOURCE_SYSTEM, A.TRCK_SOURCE_SYSTEM) AS TRCK_SOURCE_SYSTEM, 
                                         s.LOADTS
                                  FROM [dbo].[tbl_TrackOne_MasterData_prepare] AS s
                                       LEFT OUTER JOIN [dbo].[tbl_TrackOne_MasterData] AS a ON s.[trck_email_address] COLLATE DATABASE_DEFAULT = a.[trck_email_address] COLLATE DATABASE_DEFAULT
                                                                                               AND s.[trck_market] COLLATE DATABASE_DEFAULT = a.[trck_market] COLLATE DATABASE_DEFAULT
                                                                                               AND s.[trck_brand] COLLATE DATABASE_DEFAULT = a.[trck_brand] COLLATE DATABASE_DEFAULT)
                              INSERT INTO dbo.tbl_C1_Interface_CustomerFlow
                                     SELECT nid, 
                                            [rnk], 
                                            [trck_ID], 
                                            [trck_touchpoint], 
                                            [trck_uniqueID], 
                                            [trck_market], 
                                            [trck_division], 
                                            [trck_brand], 
                                            [trck_segment], 
                                            [trck_email_address], 
                                            [trck_registration_date], 
                                            [trck_creation_date], 
                                            [trck_subscribtion_date], 
                                            [trck_doi], 
                                            [trck_is_unsubscribed], 
                                            [trck_unsubscribe_date], 
                                            [trck_is_contactable], 
                                            [trck_last_edited_date], 
                                            [trck_company_name], 
                                            [trck_title], 
                                            [trck_first_name], 
                                            [trck_last_name], 
                                            [trck_additional_name_information], 
                                            [trck_street], 
                                            [trck_house_number], 
                                            [trck_additional_address], 
                                            [trck_zip_code], 
                                            [trck_city], 
                                            [trck_state], 
                                            [trck_country], 
                                            [trck_gender], 
                                            [trck_birthday], 
                                            [trck_consent_text], 
                                            [trck_language], 
                                            [trck_mobile_number], 
                                            [trck_landline_number], 
                                            [trck_last_contact_date], 
                                            [trck_last_open_date], 
                                            [trck_last_click_date], 
                                            [trck_is_fake], 
                                            [trck_DMR], 
                                            [trck_DCR], 
                                            [trck_Source], 
                                            [trck_is_blocked], 
                                            [trck_blockreason], 
                                            [trck_change_comment], 
                                            [trck_custom_1], 
                                            [trck_custom_2], 
                                            [trck_custom_3], 
                                            [trck_custom_4], 
                                            [trck_custom_5], 
                                            [trck_custom_6], 
                                            [trck_custom_7], 
                                            [trck_custom_8], 
                                            [trck_custom_9], 
                                            [AC_AcceptancyDate], 
                                            [AC_Status], 
                                            [AC_UnsubscribeDate], 
                                            [trck_is_consent], 
                                            [trck_is_participation], 
                                            [trck_participation_text], 
                                            [trck_is_subscribe], 
                                            [trck_subscribe_text], 
                                            [trck_is_usage], 
                                            [trck_usage_text], 
                                            [trck_campaign], 
                                            [trck_referer], 
                                            [trck_registration_ip], 
                                            [trck_subscribtion_ip], 
                                            [trck_subscribtion_source], 
                                            [trck_payload], 
                                            [Jobcode14], 
                                            [trck_source_system], 
                                            loadts
                                     FROM deltastmt
                                     WHERE COALESCE([rnk], [trck_ID], [trck_touchpoint], [trck_uniqueID], [trck_market], [trck_division], [trck_brand], [trck_segment], [trck_email_address], [trck_registration_date], [trck_creation_date], [trck_subscribtion_date], [trck_doi], [trck_is_unsubscribed], [trck_unsubscribe_date], [trck_is_contactable], [trck_last_edited_date], [trck_company_name], [trck_title], [trck_first_name], [trck_last_name], [trck_additional_name_information], [trck_street], [trck_house_number], [trck_additional_address], [trck_zip_code], [trck_city], [trck_state], [trck_country], [trck_gender], [trck_birthday], [trck_consent_text], [trck_language], [trck_mobile_number], [trck_landline_number], [trck_last_contact_date], [trck_last_open_date], [trck_last_click_date], [trck_is_fake], [trck_DMR], [trck_DCR], [trck_Source], [trck_is_blocked], [trck_blockreason], [trck_change_comment], [trck_custom_1], [trck_custom_2], [trck_custom_3], [trck_custom_4], [trck_custom_5], [trck_custom_6], [trck_custom_7], [trck_custom_8], [trck_custom_9], [AC_AcceptancyDate], [AC_Status], [AC_UnsubscribeDate], [trck_is_consent], [trck_is_participation], [trck_participation_text], [trck_is_subscribe], [trck_subscribe_text], [trck_is_usage], [trck_usage_text], [trck_campaign], [trck_referer], [trck_registration_ip], [trck_subscribtion_ip], [trck_subscribtion_source], [trck_payload], [Jobcode14], [trck_source_system]) IS NOT NULL
                                           AND NOT EXISTS
                                     (
                                         SELECT [rnk], 
                                                [trck_ID], 
                                                [trck_touchpoint], 
                                                [trck_uniqueID], 
                                                [trck_market], 
                                                [trck_division], 
                                                [trck_brand], 
                                                [trck_segment], 
                                                [trck_email_address], 
                                                [trck_registration_date], 
                                                [trck_creation_date], 
                                                [trck_subscribtion_date], 
                                                [trck_doi], 
                                                [trck_is_unsubscribed], 
                                                [trck_unsubscribe_date], 
                                                [trck_is_contactable], 
                                                [trck_last_edited_date], 
                                                [trck_company_name], 
                                                [trck_title], 
                                                [trck_first_name], 
                                                [trck_last_name], 
                                                [trck_additional_name_information], 
                                                [trck_street], 
                                                [trck_house_number], 
                                                [trck_additional_address], 
                                                [trck_zip_code], 
                                                [trck_city], 
                                                [trck_state], 
                                                [trck_country], 
                                                [trck_gender], 
                                                [trck_birthday], 
                                                [trck_consent_text], 
                                                [trck_language], 
                                                [trck_mobile_number], 
                                                [trck_landline_number], 
                                                [trck_last_contact_date], 
                                                [trck_last_open_date], 
                                                [trck_last_click_date], 
                                                [trck_is_fake], 
                                                [trck_DMR], 
                                                [trck_DCR], 
                                                [trck_Source], 
                                                [trck_is_blocked], 
                                                [trck_blockreason], 
                                                [trck_change_comment], 
                                                [trck_custom_1], 
                                                [trck_custom_2], 
                                                [trck_custom_3], 
                                                [trck_custom_4], 
                                                [trck_custom_5], 
                                                [trck_custom_6], 
                                                [trck_custom_7], 
                                                [trck_custom_8], 
                                                [trck_custom_9], 
                                                [AC_AcceptancyDate], 
                                                [AC_Status], 
                                                [AC_UnsubscribeDate], 
                                                [trck_is_consent], 
                                                [trck_is_participation], 
                                                [trck_participation_text], 
                                                [trck_is_subscribe], 
                                                [trck_subscribe_text], 
                                                [trck_is_usage], 
                                                [trck_usage_text], 
                                                [trck_campaign], 
                                                [trck_referer], 
                                                [trck_registration_ip], 
                                                [trck_subscribtion_ip], 
                                                [trck_subscribtion_source], 
                                                [trck_payload], 
                                                [Jobcode14], 
                                                [trck_source_system]
                                         FROM dbo.tbl_C1_Interface_CustomerFlow
                                         WHERE [trck_email_address] COLLATE DATABASE_DEFAULT = deltastmt.[trck_email_address] COLLATE DATABASE_DEFAULT
                                               AND [trck_market]COLLATE DATABASE_DEFAULT = deltastmt.[trck_market] COLLATE DATABASE_DEFAULT
                                               AND [trck_brand] COLLATE DATABASE_DEFAULT= deltastmt.[trck_brand]  COLLATE DATABASE_DEFAULT
                                     );
                     END;
             END;
     END;
 GO



IF EXISTS
(
    SELECT 1
    FROM sysobjects
    WHERE name = 'process_TrackOne_stageload'
)
    DROP PROCEDURE process_TrackOne_stageload;	
GO
CREATE PROCEDURE process_TrackOne_stageload
AS
     BEGIN

         -- delete the cache table for the aggregation of 
         -- inbound deliveries 

         IF EXISTS
         (
             SELECT 1
             FROM INFORMATION_SCHEMA.TABLES
             WHERE UPPER(TABLE_NAME) = UPPER('tbl_TrackOne_MasterData_prepare')
                   AND UPPER(TABLE_SCHEMA) = UPPER('dbo')
         )
             BEGIN
                 DROP TABLE [dbo].[tbl_TrackOne_MasterData_prepare];
             END;

         IF EXISTS
         (
             SELECT 1
             FROM INFORMATION_SCHEMA.TABLES
             WHERE UPPER(TABLE_NAME) = UPPER('#tbl_int_TrackOne_MasterData')
                   AND UPPER(TABLE_SCHEMA) = UPPER('dbo')
         )
             BEGIN
                 DROP TABLE [dbo].#tbl_int_TrackOne_MasterData;
             END;

         SELECT IDENTITY( INT, 1, 1) bseqid, 
				trck_dmr loadts,
                *
         INTO [dbo].#tbl_int_TrackOne_MasterData
         FROM [dbo].[vw_int_Garnier];

		 CREATE CLUSTERED INDEX [TClusteredIndex-int_TrackOne_MasterData] ON [dbo].#tbl_int_TrackOne_MasterData
		(
			[trck_market] ASC,
			[trck_brand] ASC,
			[trck_email_address] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON);


				  

         WITH combind_staging
              AS (SELECT TOP 100 PERCENT [bseqid], 
                                         loadts, 
                                         [trck_email_address], 
                                         [trck_market], 
                                         [trck_brand], 
                                         COALESCE(NULLIF([rnk], ''),
                  (
                      SELECT TOP 1 [rnk]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([rnk], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [rnk], 
                                         COALESCE(NULLIF([trck_ID], ''),
                  (
                      SELECT TOP 1 [trck_ID]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_ID], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_ID], 
                                         COALESCE(NULLIF([trck_touchpoint], ''),
                  (
                      SELECT TOP 1 [trck_touchpoint]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_touchpoint], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_touchpoint], 
                                         COALESCE(NULLIF([trck_uniqueID], ''),
                  (
                      SELECT TOP 1 [trck_uniqueID]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_uniqueID], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_uniqueID], 
                                         COALESCE(NULLIF([trck_division], ''),
                  (
                      SELECT TOP 1 [trck_division]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_division], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_division], 
                                         COALESCE(NULLIF([trck_segment], ''),
                  (
                      SELECT TOP 1 [trck_segment]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_segment], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_segment], 
                                         COALESCE(NULLIF([trck_registration_date], ''),
                  (
                      SELECT TOP 1 [trck_registration_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_registration_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_registration_date], 
                                         COALESCE(NULLIF([trck_creation_date], ''),
                  (
                      SELECT TOP 1 [trck_creation_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_creation_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_creation_date], 
                                         COALESCE(NULLIF([trck_subscribtion_date], ''),
                  (
                      SELECT TOP 1 [trck_subscribtion_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_subscribtion_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_subscribtion_date], 
                                         COALESCE(NULLIF([trck_doi], ''),
                  (
                      SELECT TOP 1 [trck_doi]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_doi], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_doi], 
                                         COALESCE(NULLIF([trck_is_unsubscribed], ''),
                  (
                      SELECT TOP 1 [trck_is_unsubscribed]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_unsubscribed], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_unsubscribed], 
                                         COALESCE(NULLIF([trck_unsubscribe_date], ''),
                  (
                      SELECT TOP 1 [trck_unsubscribe_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_unsubscribe_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_unsubscribe_date], 
                                         COALESCE(NULLIF([trck_is_contactable], ''),
                  (
                      SELECT TOP 1 [trck_is_contactable]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_contactable], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_contactable], 
                                         COALESCE(NULLIF([trck_last_edited_date], ''),
                  (
                      SELECT TOP 1 [trck_last_edited_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_last_edited_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_last_edited_date], 
                                         COALESCE(NULLIF([trck_company_name], ''),
                  (
                      SELECT TOP 1 [trck_company_name]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_company_name], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_company_name], 
                                         COALESCE(NULLIF([trck_title], ''),
                  (
                      SELECT TOP 1 [trck_title]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_title], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_title], 
                                         COALESCE(NULLIF([trck_first_name], ''),
                  (
                      SELECT TOP 1 [trck_first_name]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_first_name], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_first_name], 
                                         COALESCE(NULLIF([trck_last_name], ''),
                  (
                      SELECT TOP 1 [trck_last_name]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_last_name], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_last_name], 
                                         COALESCE(NULLIF([trck_additional_name_information], ''),
                  (
                      SELECT TOP 1 [trck_additional_name_information]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_additional_name_information], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_additional_name_information], 
                                         COALESCE(NULLIF([trck_street], ''),
                  (
                      SELECT TOP 1 [trck_street]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_street], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_street], 
                                         COALESCE(NULLIF([trck_house_number], ''),
                  (
                      SELECT TOP 1 [trck_house_number]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_house_number], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_house_number], 
                                         COALESCE(NULLIF([trck_additional_address], ''),
                  (
                      SELECT TOP 1 [trck_additional_address]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_additional_address], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_additional_address], 
                                         COALESCE(NULLIF([trck_zip_code], ''),
                  (
                      SELECT TOP 1 [trck_zip_code]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_zip_code], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_zip_code], 
                                         COALESCE(NULLIF([trck_city], ''),
                  (
                      SELECT TOP 1 [trck_city]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_city], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_city], 
                                         COALESCE(NULLIF([trck_state], ''),
                  (
                      SELECT TOP 1 [trck_state]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_state], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_state], 
                                         COALESCE(NULLIF([trck_country], ''),
                  (
                      SELECT TOP 1 [trck_country]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_country], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_country], 
                                         COALESCE(NULLIF([trck_gender], ''),
                  (
                      SELECT TOP 1 [trck_gender]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_gender], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_gender], 
                                         COALESCE(NULLIF([trck_birthday], ''),
                  (
                      SELECT TOP 1 [trck_birthday]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_birthday], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_birthday], 
                                         COALESCE(NULLIF([trck_consent_text], ''),
                  (
                      SELECT TOP 1 [trck_consent_text]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_consent_text], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_consent_text], 
                                         COALESCE(NULLIF([trck_language], ''),
                  (
                      SELECT TOP 1 [trck_language]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_language], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_language], 
                                         COALESCE(NULLIF([trck_mobile_number], ''),
                  (
                      SELECT TOP 1 [trck_mobile_number]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_mobile_number], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_mobile_number], 
                                         COALESCE(NULLIF([trck_landline_number], ''),
                  (
                      SELECT TOP 1 [trck_landline_number]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_landline_number], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_landline_number], 
                                         COALESCE(NULLIF([trck_last_contact_date], ''),
                  (
                      SELECT TOP 1 [trck_last_contact_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_last_contact_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_last_contact_date], 
                                         COALESCE(NULLIF([trck_last_open_date], ''),
                  (
                      SELECT TOP 1 [trck_last_open_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_last_open_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_last_open_date], 
                                         COALESCE(NULLIF([trck_last_click_date], ''),
                  (
                      SELECT TOP 1 [trck_last_click_date]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_last_click_date], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_last_click_date], 
                                         COALESCE(NULLIF([trck_is_fake], ''),
                  (
                      SELECT TOP 1 [trck_is_fake]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_fake], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_fake], 
                                         COALESCE(NULLIF([trck_DMR], ''),
                  (
                      SELECT TOP 1 [trck_DMR]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_DMR], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_DMR], 
                                         COALESCE(NULLIF([trck_DCR], ''),
                  (
                      SELECT TOP 1 [trck_DCR]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_DCR], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_DCR], 
                                         COALESCE(NULLIF([trck_Source], ''),
                  (
                      SELECT TOP 1 [trck_Source]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_Source], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_Source], 
                                         COALESCE(NULLIF([trck_is_blocked], ''),
                  (
                      SELECT TOP 1 [trck_is_blocked]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_blocked], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_blocked], 
                                         COALESCE(NULLIF([trck_blockreason], ''),
                  (
                      SELECT TOP 1 [trck_blockreason]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_blockreason], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_blockreason], 
                                         COALESCE(NULLIF([trck_change_comment], ''),
                  (
                      SELECT TOP 1 [trck_change_comment]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_change_comment], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_change_comment], 
                                         COALESCE(NULLIF([trck_custom_1], ''),
                  (
                      SELECT TOP 1 [trck_custom_1]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_1], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_1], 
                                         COALESCE(NULLIF([trck_custom_2], ''),
                  (
                      SELECT TOP 1 [trck_custom_2]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_2], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_2], 
                                         COALESCE(NULLIF([trck_custom_3], ''),
                  (
                      SELECT TOP 1 [trck_custom_3]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_3], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_3], 
                                         COALESCE(NULLIF([trck_custom_4], ''),
                  (
                      SELECT TOP 1 [trck_custom_4]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_4], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_4], 
                                         COALESCE(NULLIF([trck_custom_5], ''),
                  (
                      SELECT TOP 1 [trck_custom_5]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_5], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_5], 
                                         COALESCE(NULLIF([trck_custom_6], ''),
                  (
                      SELECT TOP 1 [trck_custom_6]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_6], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_6], 
                                         COALESCE(NULLIF([trck_custom_7], ''),
                  (
                      SELECT TOP 1 [trck_custom_7]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_7], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_7], 
                                         COALESCE(NULLIF([trck_custom_8], ''),
                  (
                      SELECT TOP 1 [trck_custom_8]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_8], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_8], 
                                         COALESCE(NULLIF([trck_custom_9], ''),
                  (
                      SELECT TOP 1 [trck_custom_9]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_custom_9], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_custom_9], 
                                         COALESCE(NULLIF([AC_AcceptancyDate], ''),
                  (
                      SELECT TOP 1 [AC_AcceptancyDate]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([AC_AcceptancyDate], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [AC_AcceptancyDate], 
                                         COALESCE(NULLIF([AC_Status], ''),
                  (
                      SELECT TOP 1 [AC_Status]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([AC_Status], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [AC_Status], 
                                         COALESCE(NULLIF([AC_UnsubscribeDate], ''),
                  (
                      SELECT TOP 1 [AC_UnsubscribeDate]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([AC_UnsubscribeDate], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [AC_UnsubscribeDate], 
                                         COALESCE(NULLIF([trck_is_consent], ''),
                  (
                      SELECT TOP 1 [trck_is_consent]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_consent], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_consent], 
                                         COALESCE(NULLIF([trck_is_participation], ''),
                  (
                      SELECT TOP 1 [trck_is_participation]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_participation], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_participation], 
                                         COALESCE(NULLIF([trck_participation_text], ''),
                  (
                      SELECT TOP 1 [trck_participation_text]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_participation_text], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_participation_text], 
                                         COALESCE(NULLIF([trck_is_subscribe], ''),
                  (
                      SELECT TOP 1 [trck_is_subscribe]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_subscribe], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_subscribe], 
                                         COALESCE(NULLIF([trck_subscribe_text], ''),
                  (
                      SELECT TOP 1 [trck_subscribe_text]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_subscribe_text], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_subscribe_text], 
                                         COALESCE(NULLIF([trck_is_usage], ''),
                  (
                      SELECT TOP 1 [trck_is_usage]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_is_usage], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_is_usage], 
                                         COALESCE(NULLIF([trck_usage_text], ''),
                  (
                      SELECT TOP 1 [trck_usage_text]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_usage_text], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_usage_text], 
                                         COALESCE(NULLIF([trck_campaign], ''),
                  (
                      SELECT TOP 1 [trck_campaign]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_campaign], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_campaign], 
                                         COALESCE(NULLIF([trck_referer], ''),
                  (
                      SELECT TOP 1 [trck_referer]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_referer], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_referer], 
                                         COALESCE(NULLIF([trck_registration_ip], ''),
                  (
                      SELECT TOP 1 [trck_registration_ip]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_registration_ip], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_registration_ip], 
                                         COALESCE(NULLIF([trck_subscribtion_ip], ''),
                  (
                      SELECT TOP 1 [trck_subscribtion_ip]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_subscribtion_ip], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_subscribtion_ip], 
                                         COALESCE(NULLIF([trck_subscribtion_source], ''),
                  (
                      SELECT TOP 1 [trck_subscribtion_source]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_subscribtion_source], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_subscribtion_source], 
                                         COALESCE(NULLIF([trck_payload], ''),
                  (
                      SELECT TOP 1 [trck_payload]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_payload], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_payload], 
                                         COALESCE(NULLIF([Jobcode14], ''),
                  (
                      SELECT TOP 1 [Jobcode14]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([Jobcode14], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [Jobcode14], 
                                         COALESCE(NULLIF([trck_source_system], ''),
                  (
                      SELECT TOP 1 [trck_source_system]
                      FROM [dbo].#tbl_int_TrackOne_MasterData
                      WHERE [trck_email_address] = s.[trck_email_address]
                            AND [trck_market] = s.[trck_market]
                            AND [trck_brand] = s.[trck_brand]
                            AND NULLIF([trck_source_system], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [trck_source_system]
                  FROM [dbo].#tbl_int_TrackOne_MasterData s
                  ORDER BY [bseqid] DESC, 
                           [trck_email_address], 
                           [trck_brand], 
                           [trck_market])
              SELECT cs.*
              -- temp solution to perform the dataimport consolitation
              INTO dbo.[tbl_TrackOne_MasterData_prepare]	
              --
              FROM combind_staging cs
                   INNER JOIN
              (
                  SELECT MAX(bseqid) bseqid, 
                         [trck_email_address], 
                         [trck_brand], 
                         [trck_market]
                  FROM combind_staging
                  GROUP BY [trck_email_address], 
                           [trck_brand], 
                           [trck_market]
              ) tcs ON cs.[trck_email_address] = tcs.[trck_email_address]
                       AND cs.[trck_brand] = tcs.[trck_brand]
                       AND cs.[trck_market] = tcs.[trck_market]
                       AND cs.bseqid = tcs.bseqid;


		CREATE CLUSTERED INDEX [TClusteredIndex-TrackOne_MasterData_prepare] ON dbo.[tbl_TrackOne_MasterData_prepare]
		(
			[trck_market] ASC,
			[trck_brand] ASC,
			[trck_email_address] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON);	

     END;
GO


IF EXISTS( SELECT 1	FROM sys.procedures WHERE OBJECT_ID = OBJECT_ID('dbo.process_C1_Interface_FileExport')
		 ) DROP PROCEDURE dbo.process_C1_Interface_FileExport;	
GO		 
CREATE PROCEDURE process_C1_Interface_FileExport
AS	
     BEGIN
		 INSERT INTO dbo.vw_C1_Interface_CustomerFlow_exportfile
         SELECT [rnk], 
                [trck_ID], 
                [trck_touchpoint], 
                [trck_uniqueID], 
                [trck_market], 
                [trck_division], 
                [trck_brand], 
                [trck_segment], 
                [trck_email_address], 
                [trck_registration_date], 
                [trck_creation_date], 
                [trck_subscribtion_date], 
                [trck_doi], 
                [trck_is_unsubscribed], 
                [trck_unsubscribe_date], 
                [trck_is_contactable], 
                [trck_last_edited_date], 
                [trck_company_name], 
                [trck_title], 
                [trck_first_name], 
                [trck_last_name], 
                [trck_additional_name_information], 
                [trck_street], 
                [trck_house_number], 
                [trck_additional_address], 
                [trck_zip_code], 
                [trck_city], 
                [trck_state], 
                [trck_country], 
                [trck_gender], 
                [trck_birthday], 
                [trck_consent_text], 
                [trck_language], 
                [trck_mobile_number], 
                [trck_landline_number], 
                [trck_last_contact_date], 
                [trck_last_open_date], 
                [trck_last_click_date], 
                [trck_is_fake], 
                [trck_DMR], 
                [trck_DCR], 
                [trck_Source], 
                [trck_is_blocked], 
                [trck_blockreason], 
                [trck_change_comment], 
                [trck_custom_1], 
                [trck_custom_2], 
                [trck_custom_3], 
                [trck_custom_4], 
                [trck_custom_5], 
                [trck_custom_6], 
                [trck_custom_7], 
                [trck_custom_8], 
                [trck_custom_9], 
                [AC_AcceptancyDate], 
                [AC_Status], 
                [AC_UnsubscribeDate], 
                [trck_is_consent], 
                [trck_is_participation], 
                [trck_participation_text], 
                [trck_is_subscribe], 
                [trck_subscribe_text], 
                [trck_is_usage], 
                [trck_usage_text], 
                [trck_campaign], 
                [trck_referer], 
                [trck_registration_ip], 
                [trck_subscribtion_ip], 
                [trck_subscribtion_source], 
                [trck_payload], 
                [Jobcode14], 
                [trck_source_system]           
         FROM dbo.tbl_C1_Interface_CustomerFlow c1icf
         WHERE EXISTS
         (
             SELECT ist.[rnk], 
                    ist.[trck_ID], 
                    ist.[trck_touchpoint] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_uniqueID] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_market] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_division] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_brand] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_segment] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_email_address] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_registration_date], 
                    ist.[trck_creation_date], 
                    ist.[trck_subscribtion_date], 
                    ist.[trck_doi], 
                    ist.[trck_is_unsubscribed], 
                    ist.[trck_unsubscribe_date], 
                    ist.[trck_is_contactable], 
                    ist.[trck_last_edited_date], 
                    ist.[trck_company_name] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_title] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_first_name] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_last_name] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_additional_name_information] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_street] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_house_number] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_additional_address] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_zip_code] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_city] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_state] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_country] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_gender] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_birthday], 
                    ist.[trck_consent_text] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_language] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_mobile_number] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_landline_number] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_last_contact_date], 
                    ist.[trck_last_open_date], 
                    ist.[trck_last_click_date], 
                    ist.[trck_is_fake], 
                    ist.[trck_DMR], 
                    ist.[trck_DCR], 
                    ist.[trck_Source] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_is_blocked], 
                    ist.[trck_blockreason] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_change_comment] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_1] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_2] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_3] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_4] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_5] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_6] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_7] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_8] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_custom_9] COLLATE DATABASE_DEFAULT, 
                    ist.[AC_AcceptancyDate], 
                    ist.[AC_Status] COLLATE DATABASE_DEFAULT, 
                    ist.[AC_UnsubscribeDate], 
                    ist.[trck_is_consent], 
                    ist.[trck_is_participation], 
                    ist.[trck_participation_text] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_is_subscribe], 
                    ist.[trck_subscribe_text] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_is_usage], 
                    ist.[trck_usage_text] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_campaign] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_referer] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_registration_ip] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_subscribtion_ip] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_subscribtion_source] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_payload] COLLATE DATABASE_DEFAULT, 
                    ist.[Jobcode14] COLLATE DATABASE_DEFAULT, 
                    ist.[trck_source_system] COLLATE DATABASE_DEFAULT
             FROM dbo.[tbl_TrackOne_MasterData_prepare] AS ist
             WHERE ist.[trck_email_address] COLLATE DATABASE_DEFAULT = c1icf.[trck_email_address] COLLATE DATABASE_DEFAULT
                   AND ist.[trck_market] COLLATE DATABASE_DEFAULT = c1icf.[trck_market] COLLATE DATABASE_DEFAULT
                   AND ist.[trck_brand] COLLATE DATABASE_DEFAULT = c1icf.[trck_brand] COLLATE DATABASE_DEFAULT
             EXCEPT
             SELECT ita.[rnk], 
                    ita.[trck_ID], 
                    ita.[trck_touchpoint] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_uniqueID] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_market] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_division] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_brand] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_segment] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_email_address] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_registration_date], 
                    ita.[trck_creation_date], 
                    ita.[trck_subscribtion_date], 
                    ita.[trck_doi], 
                    ita.[trck_is_unsubscribed], 
                    ita.[trck_unsubscribe_date], 
                    ita.[trck_is_contactable], 
                    ita.[trck_last_edited_date], 
                    ita.[trck_company_name] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_title] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_first_name] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_last_name] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_additional_name_information] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_street] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_house_number] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_additional_address] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_zip_code] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_city] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_state] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_country] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_gender] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_birthday], 
                    ita.[trck_consent_text] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_language] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_mobile_number] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_landline_number] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_last_contact_date], 
                    ita.[trck_last_open_date], 
                    ita.[trck_last_click_date], 
                    ita.[trck_is_fake], 
                    ita.[trck_DMR], 
                    ita.[trck_DCR], 
                    ita.[trck_Source] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_is_blocked], 
                    ita.[trck_blockreason] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_change_comment] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_1] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_2] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_3] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_4] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_5] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_6] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_7] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_8] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_custom_9] COLLATE DATABASE_DEFAULT, 
                    ita.[AC_AcceptancyDate], 
                    ita.[AC_Status] COLLATE DATABASE_DEFAULT, 
                    ita.[AC_UnsubscribeDate], 
                    ita.[trck_is_consent], 
                    ita.[trck_is_participation], 
                    ita.[trck_participation_text] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_is_subscribe], 
                    ita.[trck_subscribe_text] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_is_usage], 
                    ita.[trck_usage_text] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_campaign] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_referer] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_registration_ip] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_subscribtion_ip] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_subscribtion_source] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_payload] COLLATE DATABASE_DEFAULT, 
                    ita.[Jobcode14] COLLATE DATABASE_DEFAULT, 
                    ita.[trck_source_system] COLLATE DATABASE_DEFAULT
             FROM dbo.[tbl_TrackOne_MasterData] AS ita
             WHERE ita.[trck_email_address] COLLATE DATABASE_DEFAULT = c1icf.[trck_email_address] COLLATE DATABASE_DEFAULT
                   AND ita.[trck_market] COLLATE DATABASE_DEFAULT = c1icf.[trck_market] COLLATE DATABASE_DEFAULT
                   AND ita.[trck_brand] COLLATE DATABASE_DEFAULT = c1icf.[trck_brand] COLLATE DATABASE_DEFAULT
         )
               AND COALESCE(COALESCE(CAST(rnk AS VARCHAR(23)), ''), COALESCE(CAST(trck_ID AS VARCHAR(23)), ''), trck_touchpoint, trck_uniqueID, trck_market, trck_division, trck_brand, trck_segment, trck_email_address, COALESCE(CAST(trck_registration_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_creation_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_subscribtion_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_doi AS VARCHAR(23)), ''), COALESCE(CAST(trck_is_unsubscribed AS VARCHAR(23)), ''), COALESCE(CAST(trck_unsubscribe_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_is_contactable AS VARCHAR(23)), ''), COALESCE(CAST(trck_last_edited_date AS VARCHAR(23)), ''), trck_company_name, trck_title, trck_first_name, trck_last_name, trck_additional_name_information, trck_street, trck_house_number, trck_additional_address, trck_zip_code, trck_city, trck_state, trck_country, trck_gender, COALESCE(CAST(trck_birthday AS VARCHAR(23)), ''), trck_consent_text, trck_language, trck_mobile_number, trck_landline_number, COALESCE(CAST(trck_last_contact_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_last_open_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_last_click_date AS VARCHAR(23)), ''), COALESCE(CAST(trck_is_fake AS VARCHAR(23)), ''), COALESCE(CAST(trck_DMR AS VARCHAR(23)), ''), COALESCE(CAST(trck_DCR AS VARCHAR(23)), ''), trck_Source, COALESCE(CAST(trck_is_blocked AS VARCHAR(23)), ''), trck_blockreason, trck_change_comment, trck_custom_1, trck_custom_2, trck_custom_3, trck_custom_4, trck_custom_5, trck_custom_6, trck_custom_7, trck_custom_8, trck_custom_9, COALESCE(CAST(AC_AcceptancyDate AS VARCHAR(23)), ''), AC_Status, COALESCE(CAST(AC_UnsubscribeDate AS VARCHAR(23)), ''), COALESCE(CAST(trck_is_consent AS VARCHAR(23)), ''), COALESCE(CAST(trck_is_participation AS VARCHAR(23)), ''), trck_participation_text, COALESCE(CAST(trck_is_subscribe AS VARCHAR(23)), ''), trck_subscribe_text, COALESCE(CAST(trck_is_usage AS VARCHAR(23)), ''), trck_usage_text, trck_campaign, trck_referer, trck_registration_ip, trck_subscribtion_ip, trck_subscribtion_source, trck_payload, Jobcode14, trck_source_system) IS NOT NULL;
     END;
GO

IF EXISTS( SELECT 1	FROM sys.procedures WHERE OBJECT_ID = OBJECT_ID('dbo.prc_C1_process_flow')
		 ) DROP PROCEDURE dbo.prc_C1_process_flow;	
GO	
CREATE PROCEDURE dbo.prc_C1_process_flow
	AS DECLARE	
		@delivery_date DATETIME2= GETDATE(); 
	BEGIN
		exec process_TrackOne_stageload					
		exec process_TrackOne_deltaCalculation
		exec process_C1_Interface_FileExport
		exec process_TrackOne_MasterDataEx	
	END;
GO	


IF EXISTS( SELECT 1	FROM sys.procedures WHERE OBJECT_ID = OBJECT_ID('dbo.prc_C1_Interface_CustomerFlow_seal_exportfile')
		 ) DROP PROCEDURE dbo.prc_C1_Interface_CustomerFlow_seal_exportfile;	
GO	
CREATE PROCEDURE dbo.prc_C1_Interface_CustomerFlow_seal_exportfile
	AS DECLARE	
		@delivery_date DATETIME2= GETDATE(); 
	BEGIN
		UPDATE	dbo.tbl_C1_Interface_CustomerFlow_exportfile
			SET delivery_date = @delivery_date WHERE delivery_date IS NULL;
	END;
GO												    

IF EXISTS (SELECT  1  FROM	sys.objects  WHERE OBJECT_ID = OBJECT_ID('dbo.fn_ahc')
		  )	DROP FUNCTION DBO.FN_AHC;
GO
CREATE FUNCTION DBO.FN_AHC
    (
        @ac NVARCHAR(200),
        @hc NVARCHAR(200)
    )
RETURNS NVARCHAR(200)
    BEGIN
        DECLARE @rv NVARCHAR(200);

        SET @rv = CASE
                      WHEN CHECKSUM(@ac) = CHECKSUM(@hc)
                          THEN
                          NULL
                      ELSE
                          IIF(@ac = '', NULL, @ac)
                  END;

        RETURN @rv;
    END;
GO



--
-- beladen der tabellen für masterdata, delta und export
--
exec process_TrackOne_stageload					
exec process_TrackOne_deltaCalculation
exec process_C1_Interface_FileExport
exec process_TrackOne_MasterDataEx


-- prüfen des exportsates(mit der eingangs erstellten view
select * from dbo.tbl_C1_Interface_CustomerFlow_exportfile
select * from dbo.vw_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from dbo.[tbl_TrackOne_MasterData_prepare]
select * from dbo.[tbl_TrackOne_MasterData]
	-- check master (update)
select * from dbo.[tbl_TrackOne_MasterData]
select * from dbo.[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from dbo.[tbl_C1_Interface_CustomerFlow]
select * from dbo.[tbl_C1_Interface_CustomerFlow_hist]

insert into dbo.vw_C1_Interface_CustomerFlow_exportfile (trck_ID, trck_brand ) select 102, 'MenExpert'

update tbl_C1_Interface_CustomerFlow_exportfile set delivery_date=getdate() 	 WHERE 	delivery_date is null

select * from dbo.vw_C1_Interface_CustomerFlow_exportfile


select * from udf_C1_Interface_CustomerFlow_exportfile(0)
update tbl_C1_Interface_CustomerFlow_exportfile	set delivery_date= null


create function  udf_C1_test
	(	@mode	int= 0
	)
	returns datetime2  as	
			
	begin declare
		@delivery_date datetime2= getdate();

		if (@mode > 0)
			begin
			update	dbo.tbl_C1_Interface_CustomerFlow_exportfile
					set delivery_date = @delivery_date where delivery_date is null;

			return @delivery_date;
			end
		else
			return NULL;	

	end;




 insert into 
 exec dbo.prc_C1_Interface_CustomerFlow_seal_exportfile

