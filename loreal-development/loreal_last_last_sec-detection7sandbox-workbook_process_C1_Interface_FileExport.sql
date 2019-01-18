
IF EXISTS
(
    SELECT 1
    FROM sysobjects
    WHERE name = 'process_C1_Interface_FileExport'
)
    DROP PROCEDURE dbo.process_C1_Interface_FileExport;	
GO		 
CREATE PROCEDURE process_C1_Interface_FileExport
AS
     IF EXISTS
     (
         SELECT *
         FROM sysobjects
         WHERE name = 'tbl_C1_Interface_CustomerFlow_exportfile'
     )
         DROP TABLE dbo.tbl_C1_Interface_CustomerFlow_exportfile;
     BEGIN
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
         INTO dbo.tbl_C1_Interface_CustomerFlow_exportfile
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

/*	

                SELECT
                    1
                FROM
                    [nstage].[tbl_TrackOne_MasterData] s
                WHERE
                         s.email = ndev.tbl_C1_Interface_CustomerFlow.EMAIL
                    AND s.market = ndev.tbl_C1_Interface_CustomerFlow.MARKET
                    AND s.brand  = ndev.tbl_C1_Interface_CustomerFlow.BRAND
					*/

         )
               AND COALESCE([rnk], [trck_ID], [trck_touchpoint], [trck_uniqueID], [trck_division], [trck_segment], [trck_registration_date], [trck_creation_date], [trck_subscribtion_date], [trck_doi], [trck_is_unsubscribed], [trck_unsubscribe_date], [trck_is_contactable], [trck_last_edited_date], [trck_company_name], [trck_title], [trck_first_name], [trck_last_name], [trck_additional_name_information], [trck_street], [trck_house_number], [trck_additional_address], [trck_zip_code], [trck_city], [trck_state], [trck_country], [trck_gender], [trck_birthday], [trck_consent_text], [trck_language], [trck_mobile_number], [trck_landline_number], [trck_last_contact_date], [trck_last_open_date], [trck_last_click_date], [trck_is_fake], [trck_DMR], [trck_DCR], [trck_Source], [trck_is_blocked], [trck_blockreason], [trck_change_comment], [trck_custom_1], [trck_custom_2], [trck_custom_3], [trck_custom_4], [trck_custom_5], [trck_custom_6], [trck_custom_7], [trck_custom_8], [trck_custom_9], [AC_AcceptancyDate], [AC_Status], [AC_UnsubscribeDate], [trck_is_consent], [trck_is_participation], [trck_participation_text], [trck_is_subscribe], [trck_subscribe_text], [trck_is_usage], [trck_usage_text], [trck_campaign], [trck_referer], [trck_registration_ip], [trck_subscribtion_ip], [trck_subscribtion_source], [trck_payload], [Jobcode14], [trck_source_system]) IS NOT NULL;
     END;
GO

drop table 	tbl_int_Garnier10
drop table 	tbl_int_Garnier100
drop table 	tbl_int_Garnier1000
drop table 	tbl_int_Garnier10000

select top 10 * into tbl_int_Garnier10 from Loreal..vw_int_Garnier
	where  iif(len([trck_email_address]) = 0, NULL, [trck_email_address]) is not null
	  and  iif(len([trck_market]) = 0, NULL, [trck_market]) is not null
	  and  iif(len([trck_brand]) = 0, NULL, [trck_brand]) is not null    

select top 100 * into tbl_int_Garnier100 from Loreal..vw_int_Garnier
	where  iif(len([trck_email_address]) = 0, NULL, [trck_email_address]) is not null
	  and  iif(len([trck_market]) = 0, NULL, [trck_market]) is not null
	  and  iif(len([trck_brand]) = 0, NULL, [trck_brand]) is not null    

select top 1000 * into tbl_int_Garnier1000 from Loreal..vw_int_Garnier
	where  iif(len([trck_email_address]) = 0, NULL, [trck_email_address]) is not null
	  and  iif(len([trck_market]) = 0, NULL, [trck_market]) is not null
	  and  iif(len([trck_brand]) = 0, NULL, [trck_brand]) is not null    

select top 10000 * into tbl_int_Garnier10000 from Loreal..vw_int_Garnier
	where  iif(len([trck_email_address]) = 0, NULL, [trck_email_address]) is not null
	  and  iif(len([trck_market]) = 0, NULL, [trck_market]) is not null
	  and  iif(len([trck_brand]) = 0, NULL, [trck_brand]) is not null    

	select * from tbl_int_Garnier10


select * from vw_int_garnier



select top 10 * from Loreal..vw_int_Garnier
	where  iif(len([trck_email_address]) = 0, NULL, [trck_email_address]) is not null
	  and  iif(len([trck_market]) = 0, NULL, [trck_market]) is not null
	  and  iif(len([trck_brand]) = 0, NULL, [trck_brand]) is not null    

