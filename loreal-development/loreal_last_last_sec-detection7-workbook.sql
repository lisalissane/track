

declare @cleaning_sql nvarchar(max) =
'
If EXISTS (select 1 from sysobjects where name = ''process_TrackOne_stageload'')
	DROP PROCEDURE process_TrackOne_stageload	
'

EXECUTE sp_executesql @cleaning_sql

declare @create_sql nvarchar(max) =
'
CREATE PROCEDURE process_TrackOne_stageload
AS
     BEGIN
			
		-- delete the cache table for the aggregation of 
		-- inbound deliveries 

         IF EXISTS
         (
             SELECT 1
             FROM INFORMATION_SCHEMA.TABLES
             WHERE UPPER(TABLE_NAME) = UPPER(''tbl_TrackOne_MasterData'')
                   AND UPPER(TABLE_SCHEMA) = UPPER(''nstage'')
         )
             BEGIN
                 DROP TABLE [nstage].[tbl_TrackOne_MasterData];
             END;

         WITH combind_staging
              AS (SELECT TOP 100 PERCENT [bseqid], 
										 loadts,
                                         [EMAIL], 
                                         [MARKET], 
                                         [BRAND], 
                                         COALESCE(NULLIF([TITLE], ''''),
                  (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER], 
                                         [ADD_ADDRESS], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY],
				  COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE1], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME1], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME1], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY1], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET1], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER1], 
                                          [ADD_ADDRESS] [ADD_ADDRESS1], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE1], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY1], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE1], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY1],
										COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE2], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME2], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME2], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY2], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET2], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER2], 
                                          [ADD_ADDRESS] [ADD_ADDRESS2], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE2], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY2], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE2], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY2],
				  COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE3], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME3], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME3], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY3], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET3], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER3], 
                                          [ADD_ADDRESS] [ADD_ADDRESS3], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE3], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY3], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE3], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY3],
				  
										COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE4], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME4], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME4], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY4], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET4], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER4], 
                                          [ADD_ADDRESS] [ADD_ADDRESS4], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE4], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY4], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE4], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY4]'
				+
				  ','
				+
				  '
				  COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE5], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME5], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME5], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY5], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET5], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER5], 
                                          [ADD_ADDRESS] [ADD_ADDRESS5], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE5], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY5], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE5], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY5]
				  '
				+
				  ','
				+
				  '
				  COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE6], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME6], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME6], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY6], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET6], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER6], 
                                          [ADD_ADDRESS] [ADD_ADDRESS6], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE6], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY6], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE6], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY6]
				  '
				+
				  '
                  FROM [nstage].[tbl_int_TrackOne_MasterData] s
                  ORDER BY [bseqid] DESC, 
                           email, 
                           brand, 
                           market)
              SELECT cs.*
			  -- temp solution to perform the dataimport consolitation
              INTO [nstage].[tbl_TrackOne_MasterData]	
			  --
              FROM combind_staging cs
                   INNER JOIN
              (
                  SELECT MAX(bseqid) bseqid, 
                         email, 
                         market, 
                         brand
                  FROM combind_staging
                  GROUP BY email, 
                           market, 
                           brand
              ) tcs ON cs.email = tcs.email
                       AND cs.brand = tcs.brand
                       AND cs.market = tcs.market
                       AND cs.bseqid = tcs.bseqid;
     END;
'

EXECUTE sp_executesql @create_sql




										COALESCE(NULLIF([TITLE], ''''),
                 (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE5], 
                                         COALESCE(NULLIF([FIRST_NAME], ''''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME5], 
                                         COALESCE(NULLIF([LAST_NAME], ''''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME5], 
                                         COALESCE(NULLIF([BIRTHDAY], ''''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY5], 
                                         COALESCE(NULLIF([STREET], ''''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET5], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER5], 
                                          [ADD_ADDRESS] [ADD_ADDRESS5], 
                                         COALESCE(NULLIF([ZIP_CODE], ''''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE5], 
                                         COALESCE(NULLIF([CITY], ''''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY5], 
                                         COALESCE(NULLIF([STATE], ''''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE5], 
                                         COALESCE(NULLIF([COUNTRY], ''''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '''') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY5]


exec process_TrackOne_stageload