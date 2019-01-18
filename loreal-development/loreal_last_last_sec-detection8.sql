USE loreal_dev2

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
         FROM [dbo].[vw_int_Garnie];

		 CREATE CLUSTERED INDEX [TClusteredIndex-20181006-155459] ON [dbo].#tbl_int_TrackOne_MasterData
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


		CREATE CLUSTERED INDEX [TClusteredIndex-20181006-155459_prepare] ON dbo.[tbl_TrackOne_MasterData_prepare]
		(
			[trck_market] ASC,
			[trck_brand] ASC,
			[trck_email_address] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON);	

     END;
GO

exec process_TrackOne_stageload
exec process_TrackOne_deltaCalculation	   
exec process_C1_Interface_FileExport

exec process_TrackOne_MasterDataEx

         SELECT IDENTITY( INT, 1, 1) bseqid, 
				trck_dmr loadts,
                *
         INTO [dbo].#tbl_int_TrackOne_MasterDatax
         FROM [dbo].[vw_int_Garnier];

select * from [dbo].#tbl_int_TrackOne_MasterDatax


select * from dbo.tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from dbo.[tbl_TrackOne_MasterData_prepare]
select * from dbo.[tbl_TrackOne_MasterData]
	-- check master (update)
select * from dbo.[tbl_TrackOne_MasterData]
select * from dbo.[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from dbo.[tbl_C1_Interface_CustomerFlow]
select * from dbo.[tbl_C1_Interface_CustomerFlow_hist]


SELECT
    col.name, col.collation_name
FROM 
    sys.columns col
WHERE
    object_id = OBJECT_ID('tbl_TrackOne_MasterData_prepare')

SELECT
    col.name, col.collation_name
FROM 
    sys.columns col
WHERE
    object_id = OBJECT_ID('tbl_TrackOne_MasterData')


	SELECT SERVERPROPERTY(N'Collation')



drop synonym   dbo.[tbl_int_TrackOne_MasterData]
create synonym  dbo.[tbl_int_TrackOne_MasterData] for  dbo.vw_int_Vichy

drop view dbo.[tbl_int_TrackOne_MasterData]
create view  dbo.[tbl_int_TrackOne_MasterData] as select * from dbo.vw_int_Vichy

SELECT trck_id, 
       COUNT(trck_id)
FROM dbo.[tbl_int_TrackOne_MasterData]
GROUP BY trck_id
HAVING COUNT(trck_id) > 1;

									  select * from   dbo.[tbl_int_TrackOne_MasterData] where trck_id = 17360


select * from vw_int_Garnier

update vw_int_Garnier 
	set trck_street='emmerich josef strasse', trck_title='Herrtscherl' where trck_email_address = 'sabina.nolte@me.com'



ALTER DATABASE Loreal_Dev collate SQL_Latin1_General_CI_AS


Latin1_General_CI_AS