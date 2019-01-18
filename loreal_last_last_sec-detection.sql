
set identity_insert ndev.[tbl_int_TrackOne] ON	
go

merge ndev.[tbl_int_TrackOne] with (holdlock) as target
using	(
		select  top 100 percent *
				from dbo.[tbl_int_TrackOne] 
						where	trck_email_address	is not null 
							and trck_brand			is not null 
							and trck_market			is not null
							and [trck_campaign] = 'LRP_LOR00D8017A_FB_20180704' 
				order by trck_market, trck_brand, trck_email_address, [trck_creation_date] 
		) as source
		(
		[key],
		campaign,
		brand,
		market,
		language,
		touchpoint,
		referer,
		registration_date,
		registration_ip,
		subscribe,
		subscribtion_date,
		subscribtion_ip,
		subscribtion_source,
		terms_consent,
		terms_consent_content,
		terms_participation,
		terms_participation_content,
		terms_subscribe,
		terms_subscribe_content,
		terms_usage,
		terms_usage_content,
		gender,
		title,
		first_name,
		last_name,
		birthday,
		email,
		landline_number,
		mobile_number,
		additional_name_information,
		company_name,
		street,
		house_number,
		add_address,
		zip_code,
		city,
		state,
		country,
		payload,
		trck_touchpoint,
		trck_uniqueID,
		trck_market,
		trck_division,
		trck_brand,
		trck_segment,
		trck_email_address,
		trck_registration_date,
		trck_creation_date,
		trck_subscribtion_date,
		trck_doi,
		trck_is_unsubscribed,
		trck_unsubscribe_date,
		trck_is_contactable,
		trck_last_edited_date,
		trck_company_name,
		trck_title,
		trck_first_name,
		trck_last_name,
		trck_additional_name_information,
		trck_street,
		trck_house_number,
		trck_additional_address,
		trck_zip_code,
		trck_city,
		trck_state,
		trck_country,
		trck_gender,
		trck_birthday,
		trck_consent_text,
		trck_language,
		trck_mobile_number,
		trck_landline_number,
		trck_last_contact_date,
		trck_last_open_date,
		trck_last_click_date,
		trck_is_fake,
		trck_DMR,
		trck_DCR,
		trck_ID,
		trck_Source,
		trck_is_blocked,
		trck_blockreason,
		trck_change_comment,
		trck_custom_1,
		trck_custom_2,
		trck_custom_3,
		trck_custom_4,
		trck_custom_5,
		trck_custom_6,
		trck_custom_7,
		trck_custom_8,
		trck_custom_9,
		trck_is_consent,
		trck_is_participation,
		trck_participation_text,
		trck_is_subscribe,
		trck_subscribe_text,
		trck_is_usage,
		trck_usage_text,
		trck_campaign,
		trck_referer,
		trck_registration_ip,
		trck_subscribtion_ip,
		trck_subscribtion_source,
		trck_payload,
		AC_AcceptancyDate,
		AC_Status,
		AC_UnsubscribeDate,
		Jobcode14,
		trck_source_System
		)
	on	(	target.trck_market			= source.trck_market
		and target.trck_brand			= source.trck_brand
		and target.trck_email_address	= source.trck_email_address
		--and target.[trck_campaign]		= 'LRP_LOR00D8017A_FB_20180704'
		)
when matched then 
update set
		target.[key] = source.[key],
		target.campaign = source.campaign,
		target.brand = source.brand,
		target.market = source.market,
		target.language = source.language,
		target.touchpoint = source.touchpoint,
		target.referer = source.referer,
		target.registration_date = source.registration_date,
		target.registration_ip = source.registration_ip,
		target.subscribe = source.subscribe,
		target.subscribtion_date = source.subscribtion_date,
		target.subscribtion_ip = source.subscribtion_ip,
		target.subscribtion_source = source.subscribtion_source,
		target.terms_consent = source.terms_consent,
		target.terms_consent_content = source.terms_consent_content,
		target.terms_participation = source.terms_participation,
		target.terms_participation_content = source.terms_participation_content,
		target.terms_subscribe = source.terms_subscribe,
		target.terms_subscribe_content = source.terms_subscribe_content,
		target.terms_usage = source.terms_usage,
		target.terms_usage_content = source.terms_usage_content,
		target.gender = source.gender,
		target.title = source.title,
		target.first_name = source.first_name,
		target.last_name = source.last_name,
		target.birthday = source.birthday,
		target.email = source.email,
		target.landline_number = source.landline_number,
		target.mobile_number = source.mobile_number,
		target.additional_name_information = source.additional_name_information,
		target.company_name = source.company_name,
		target.street = source.street,
		target.house_number = source.house_number,
		target.add_address = source.add_address,
		target.zip_code = source.zip_code,
		target.city = source.city,
		target.state = source.state,
		target.country = source.country,
		target.payload = source.payload,
		target.trck_touchpoint = source.trck_touchpoint,
		target.trck_uniqueID = source.trck_uniqueID,
		--target.trck_market = source.trck_market,
		target.trck_division = source.trck_division,
		--target.trck_brand = source.trck_brand,
		target.trck_segment = source.trck_segment,
		--target.trck_email_address = source.trck_email_address,
		target.trck_registration_date = source.trck_registration_date,
		target.trck_creation_date = source.trck_creation_date,
		target.trck_subscribtion_date = source.trck_subscribtion_date,
		target.trck_doi = source.trck_doi,
		target.trck_is_unsubscribed = source.trck_is_unsubscribed,
		target.trck_unsubscribe_date = source.trck_unsubscribe_date,
		target.trck_is_contactable = source.trck_is_contactable,
		target.trck_last_edited_date = source.trck_last_edited_date,
		target.trck_company_name = source.trck_company_name,
		target.trck_title = source.trck_title,
		target.trck_first_name = source.trck_first_name,
		target.trck_last_name = source.trck_last_name,
		target.trck_additional_name_information = source.trck_additional_name_information,
		target.trck_street = source.trck_street,
		target.trck_house_number = source.trck_house_number,
		target.trck_additional_address = source.trck_additional_address,
		target.trck_zip_code = source.trck_zip_code,
		target.trck_city = source.trck_city,
		target.trck_state = source.trck_state,
		target.trck_country = source.trck_country,
		target.trck_gender = source.trck_gender,
		target.trck_birthday = source.trck_birthday,
		target.trck_consent_text = source.trck_consent_text,
		target.trck_language = source.trck_language,
		target.trck_mobile_number = source.trck_mobile_number,
		target.trck_landline_number = source.trck_landline_number,
		target.trck_last_contact_date = source.trck_last_contact_date,
		target.trck_last_open_date = source.trck_last_open_date,
		target.trck_last_click_date = source.trck_last_click_date,
		target.trck_is_fake = source.trck_is_fake,
		target.trck_DMR = source.trck_DMR,
		target.trck_DCR = source.trck_DCR,
		--target.trck_ID = source.trck_ID,
		target.trck_Source = source.trck_Source,
		target.trck_is_blocked = source.trck_is_blocked,
		target.trck_blockreason = source.trck_blockreason,
		target.trck_change_comment = source.trck_change_comment,
		target.trck_custom_1 = source.trck_custom_1,
		target.trck_custom_2 = source.trck_custom_2,
		target.trck_custom_3 = source.trck_custom_3,
		target.trck_custom_4 = source.trck_custom_4,
		target.trck_custom_5 = source.trck_custom_5,
		target.trck_custom_6 = source.trck_custom_6,
		target.trck_custom_7 = source.trck_custom_7,
		target.trck_custom_8 = source.trck_custom_8,
		target.trck_custom_9 = source.trck_custom_9,
		target.trck_is_consent = source.trck_is_consent,
		target.trck_is_participation = source.trck_is_participation,
		target.trck_participation_text = source.trck_participation_text,
		target.trck_is_subscribe = source.trck_is_subscribe,
		target.trck_subscribe_text = source.trck_subscribe_text,
		target.trck_is_usage = source.trck_is_usage,
		target.trck_usage_text = source.trck_usage_text,
		target.trck_campaign = source.trck_campaign,
		target.trck_referer = source.trck_referer,
		target.trck_registration_ip = source.trck_registration_ip,
		target.trck_subscribtion_ip = source.trck_subscribtion_ip,
		target.trck_subscribtion_source = source.trck_subscribtion_source,
		target.trck_payload = source.trck_payload,
		target.AC_AcceptancyDate = source.AC_AcceptancyDate,
		target.AC_Status = source.AC_Status,
		target.AC_UnsubscribeDate = source.AC_UnsubscribeDate,
		target.Jobcode14 = source.Jobcode14,
		target.trck_source_System = source.trck_source_System
when not matched by target then 
		insert (
			AC_AcceptancyDate,
			AC_Status,
			AC_UnsubscribeDate,
			add_address,
			additional_name_information,
			birthday,
			brand,
			campaign,
			city,
			company_name,
			country,
			email,
			first_name,
			gender,
			house_number,
			Jobcode14,
			[key],
			landline_number,
			language,
			last_name,
			market,
			mobile_number,
			payload,
			referer,
			registration_date,
			registration_ip,
			state,
			street,
			subscribe,
			subscribtion_date,
			subscribtion_ip,
			subscribtion_source,
			terms_consent,
			terms_consent_content,
			terms_participation,
			terms_participation_content,
			terms_subscribe,
			terms_subscribe_content,
			terms_usage,
			terms_usage_content,
			title,
			touchpoint,
			trck_additional_address,
			trck_additional_name_information,
			trck_birthday,
			trck_blockreason,
			trck_brand,
			trck_campaign,
			trck_change_comment,
			trck_city,
			trck_company_name,
			trck_consent_text,
			trck_country,
			trck_creation_date,
			trck_custom_1,
			trck_custom_2,
			trck_custom_3,
			trck_custom_4,
			trck_custom_5,
			trck_custom_6,
			trck_custom_7,
			trck_custom_8,
			trck_custom_9,
			trck_DCR,
			trck_division,
			trck_DMR,
			trck_doi,
			trck_email_address,
			trck_first_name,
			trck_gender,
			trck_house_number,
			trck_ID,
			trck_is_blocked,
			trck_is_consent,
			trck_is_contactable,
			trck_is_fake,
			trck_is_participation,
			trck_is_subscribe,
			trck_is_unsubscribed,
			trck_is_usage,
			trck_landline_number,
			trck_language,
			trck_last_click_date,
			trck_last_contact_date,
			trck_last_edited_date,
			trck_last_name,
			trck_last_open_date,
			trck_market,
			trck_mobile_number,
			trck_participation_text,
			trck_payload,
			trck_referer,
			trck_registration_date,
			trck_registration_ip,
			trck_segment,
			trck_Source,
			trck_source_System,
			trck_state,
			trck_street,
			trck_subscribe_text,
			trck_subscribtion_date,
			trck_subscribtion_ip,
			trck_subscribtion_source,
			trck_title,
			trck_touchpoint,
			trck_uniqueID,
			trck_unsubscribe_date,
			trck_usage_text,
			trck_zip_code,
			zip_code
		) values (
			source.AC_AcceptancyDate,
			source.AC_Status,
			source.AC_UnsubscribeDate,
			source.add_address,
			source.additional_name_information,
			source.birthday,
			source.brand,
			source.campaign,
			source.city,
			source.company_name,
			source.country,
			source.email,
			source.first_name,
			source.gender,
			source.house_number,
			source.Jobcode14,
			source.[key],
			source.landline_number,
			source.language,
			source.last_name,
			source.market,
			source.mobile_number,
			source.payload,
			source.referer,
			source.registration_date,
			source.registration_ip,
			source.state,
			source.street,
			source.subscribe,
			source.subscribtion_date,
			source.subscribtion_ip,
			source.subscribtion_source,
			source.terms_consent,
			source.terms_consent_content,
			source.terms_participation,
			source.terms_participation_content,
			source.terms_subscribe,
			source.terms_subscribe_content,
			source.terms_usage,
			source.terms_usage_content,
			source.title,
			source.touchpoint,
			source.trck_additional_address,
			source.trck_additional_name_information,
			source.trck_birthday,
			source.trck_blockreason,
			source.trck_brand,
			source.trck_campaign,
			source.trck_change_comment,
			source.trck_city,
			source.trck_company_name,
			source.trck_consent_text,
			source.trck_country,
			source.trck_creation_date,
			source.trck_custom_1,
			source.trck_custom_2,
			source.trck_custom_3,
			source.trck_custom_4,
			source.trck_custom_5,
			source.trck_custom_6,
			source.trck_custom_7,
			source.trck_custom_8,
			source.trck_custom_9,
			source.trck_DCR,
			source.trck_division,
			source.trck_DMR,
			source.trck_doi,
			source.trck_email_address,
			source.trck_first_name,
			source.trck_gender,
			source.trck_house_number,
			source.trck_ID,
			source.trck_is_blocked,
			source.trck_is_consent,
			source.trck_is_contactable,
			source.trck_is_fake,
			source.trck_is_participation,
			source.trck_is_subscribe,
			source.trck_is_unsubscribed,
			source.trck_is_usage,
			source.trck_landline_number,
			source.trck_language,
			source.trck_last_click_date,
			source.trck_last_contact_date,
			source.trck_last_edited_date,
			source.trck_last_name,
			source.trck_last_open_date,
			source.trck_market,
			source.trck_mobile_number,
			source.trck_participation_text,
			source.trck_payload,
			source.trck_referer,
			source.trck_registration_date,
			source.trck_registration_ip,
			source.trck_segment,
			source.trck_Source,
			source.trck_source_System,
			source.trck_state,
			source.trck_street,
			source.trck_subscribe_text,
			source.trck_subscribtion_date,
			source.trck_subscribtion_ip,
			source.trck_subscribtion_source,
			source.trck_title,
			source.trck_touchpoint,
			source.trck_uniqueID,
			source.trck_unsubscribe_date,
			source.trck_usage_text,
			source.trck_zip_code,
			source.zip_code
		)
	;

	

select * from ndev.[tbl_int_TrackOne]
select * from ndev.[tbl_int_TrackOnehist]
01746940550@vodafone.de, DE, LaRochePosay
select * from dbo.[tbl_int_TrackOne] 
	where trck_email_address = 'Stbe1982@yahoo.de'
		order by 
	  and trck_brand = 'LaRochePosay'
	  and trck_market = 'DE'

MEN-EXPERT
MEN-EXPERT

select [dbo].[udf_CreateLorealExport_FilePath](1 ,'a00', 'b')





DROP FUNCTION IF EXISTS [dbo].[udf_CreateLorealExport_FilePath]
GO
CREATE FUNCTION [dbo].[udf_CreateLorealExport_FilePath]
(
@cCountData nvarchar(12) ,
@ExportFile nvarchar(128),
@ExportPath nvarchar(255)
)
RETURNS NVARCHAR(512) 
AS
BEGIN
declare 
@ExportDate nvarchar(32) = NULL,
@CompleteExportFileName nvarchar(128) = NULL,
@CompleteExportLocation nvarchar(512) = NULL
;


--THROW 2018, 'missing paramter', 1


SET @ExportDate = 
convert(nvarchar,year(getdate())) 
+ right('0'+convert(nvarchar,month(getdate())),2)
+ right('0'+convert(nvarchar,day(getdate())),2) 
+ substring(replace(convert(nvarchar(29),getdate(),14),':',''),1,6)

IF LEN( @cCountData) >0 SET @cCountData = '_'+@cCountData

set @CompleteExportFileName = @ExportFile+'_' + @ExportDate + @cCountData+'.txt'
SET @CompleteExportLocation = @ExportPath + '\'+ @CompleteExportFileName

return @CompleteExportLocation;

END
go