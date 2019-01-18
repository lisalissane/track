
IF EXISTS
    (
        SELECT
            1
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            UPPER(TABLE_NAME)   = UPPER('tbl_int_TrackOne_MasterData')
		AND	UPPER(TABLE_SCHEMA) = UPPER('nstage')
    )
	BEGIN	
		DROP  TABLE [nstage].tbl_int_TrackOne_MasterData;			
	END	      
GO
CREATE TABLE [nstage].[tbl_int_TrackOne_MasterData]
    (
		[bseqid]	   [INT]		   identity,	
        [email]        [NVARCHAR](128) NOT NULL,
        [market]       [NVARCHAR](64)  NOT NULL,
        [brand]        [NVARCHAR](64)  NOT NULL,
        [title]        [NVARCHAR](510) NULL,
        [first_name]   [NVARCHAR](510) NULL,
        [last_name]    [NVARCHAR](510) NULL,
        [birthday]     [NVARCHAR](510) NULL,
        [street]       [NVARCHAR](510) NULL,
        [house_number] [NVARCHAR](510) NULL,
        [add_address]  [NVARCHAR](510) NULL,
        [zip_code]     [NVARCHAR](510) NULL,
        [city]         [NVARCHAR](510) NULL,
        [state]        [NVARCHAR](510) NULL,
        [country]      [NVARCHAR](510) NULL,
		LOADCHECKSUM   BIGINT          NULL,	
		[LOADTS]       datetime2(6)    default sysdatetime()
		/*,
        CONSTRAINT [PK_stage_tbl_TrackOne_MasterData]
            PRIMARY KEY CLUSTERED ([email] ASC, [market] ASC, [brand] ASC)
            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                    ALLOW_PAGE_LOCKS = ON
                    ) ON [PRIMARY]
		*/
    ) ON [PRIMARY];
GO

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
            UPPER(TABLE_NAME)   = UPPER('tbl_TrackOne_MasterData')
		AND	UPPER(TABLE_SCHEMA) = UPPER('nstage')
    )
	BEGIN	
		DROP  TABLE [nstage].tbl_TrackOne_MasterData;			
	END	      
GO
CREATE TABLE [nstage].[tbl_TrackOne_MasterData]
    (
		[bseqid]	   [INT]		   identity,	
        [email]        [NVARCHAR](128) NOT NULL,
        [market]       [NVARCHAR](64)  NOT NULL,
        [brand]        [NVARCHAR](64)  NOT NULL,
        [title]        [NVARCHAR](510) NULL,
        [first_name]   [NVARCHAR](510) NULL,
        [last_name]    [NVARCHAR](510) NULL,
        [birthday]     [NVARCHAR](510) NULL,
        [street]       [NVARCHAR](510) NULL,
        [house_number] [NVARCHAR](510) NULL,
        [add_address]  [NVARCHAR](510) NULL,
        [zip_code]     [NVARCHAR](510) NULL,
        [city]         [NVARCHAR](510) NULL,
        [state]        [NVARCHAR](510) NULL,
        [country]      [NVARCHAR](510) NULL,
		LOADCHECKSUM   BIGINT          NULL,	
		[LOADTS]       datetime2(6)    default sysdatetime()
		/*,
        CONSTRAINT [PK_stage_tbl_TrackOne_MasterData]
            PRIMARY KEY CLUSTERED ([email] ASC, [market] ASC, [brand] ASC)
            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                    ALLOW_PAGE_LOCKS = ON
                    ) ON [PRIMARY]
		*/
    ) ON [PRIMARY];
GO

IF EXISTS
    (
        SELECT
            1
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            UPPER(TABLE_NAME)   = UPPER('tbl_TrackOne_MasterData')
		AND	UPPER(TABLE_SCHEMA) = UPPER('ndev')
    )
	BEGIN	
		ALTER TABLE [ndev].[tbl_TrackOne_MasterData] SET (SYSTEM_VERSIONING = OFF);
		DROP  TABLE [ndev].[tbl_TrackOne_MasterData];
		DROP  TABLE [ndev].[tbl_TrackOne_MasterData_hist];
	END	      
GO
CREATE TABLE [ndev].[tbl_TrackOne_MasterData]
    (
        [email]        [NVARCHAR](128) NOT NULL,
        [market]       [NVARCHAR](64)  NOT NULL,
        [brand]        [NVARCHAR](64)  NOT NULL,
        [title]        [NVARCHAR](510) NULL,
        [first_name]   [NVARCHAR](510) NULL,
        [last_name]    [NVARCHAR](510) NULL,
        [birthday]     [NVARCHAR](510) NULL,
        [street]       [NVARCHAR](510) NULL,
        [house_number] [NVARCHAR](510) NULL,
        [add_address]  [NVARCHAR](510) NULL,
        [zip_code]     [NVARCHAR](510) NULL,
        [city]         [NVARCHAR](510) NULL,
        [state]        [NVARCHAR](510) NULL,
        [country]      [NVARCHAR](510) NULL,
        [ValidFrom]    [DATETIME2](2)  GENERATED ALWAYS AS ROW START NOT NULL,
        [ValidTo]      [DATETIME2](2)  GENERATED ALWAYS AS ROW END NOT NULL,
        CONSTRAINT [PK_tbl_TrackOne_MasterData]
            PRIMARY KEY CLUSTERED ([email] ASC, [market] ASC, [brand] ASC)
            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                  ALLOW_PAGE_LOCKS = ON
                 ) ON [PRIMARY],
        PERIOD FOR SYSTEM_TIME([ValidFrom], [ValidTo])
    ) ON [PRIMARY]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [ndev].[tbl_TrackOne_MasterData_hist]));
GO

IF EXISTS
    (
        SELECT
            1
        FROM
            INFORMATION_SCHEMA.TABLES
        WHERE
            UPPER(TABLE_NAME)   = UPPER('tbl_C1_Interface_CustomerFlow')
		AND	UPPER(TABLE_SCHEMA) = UPPER('ndev')
    )
	BEGIN	
		ALTER TABLE [ndev].[tbl_C1_Interface_CustomerFlow] SET (SYSTEM_VERSIONING = OFF);
		DROP  TABLE [ndev].[tbl_C1_Interface_CustomerFlow];
		DROP  TABLE [ndev].[tbl_C1_Interface_CustomerFlow_hist];
	END	      
GO
CREATE TABLE [ndev].[tbl_C1_Interface_CustomerFlow]
    (
        [NID]          [UNIQUEIDENTIFIER] NULL,
        [EMAIL]        [NVARCHAR](128)    NOT NULL,
        [market]       [NVARCHAR](64)      NOT NULL,
        [brand]        [NVARCHAR](64)      NOT NULL,
        [TITLE]        [NVARCHAR](200)    NULL,
        [FIRST_NAME]   [NVARCHAR](200)    NULL,
        [LAST_NAME]    [NVARCHAR](200)    NULL,
        [BIRTHDAY]     [NVARCHAR](200)    NULL,
        [STREET]       [NVARCHAR](200)    NULL,
        [HOUSE_NUMBER] [NVARCHAR](200)    NULL,
        [ADD_ADDRESS]  [NVARCHAR](200)    NULL,
        [ZIP_CODE]     [NVARCHAR](200)    NULL,
        [CITY]         [NVARCHAR](200)    NULL,
        [STATE]        [NVARCHAR](200)    NULL,
        [COUNTRY]      [NVARCHAR](200)    NULL,
		[LOADTS]	   [DATETIME2](4)	  NULL,
        [ValidFrom]    [DATETIME2](2)     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
        [ValidTo]      [DATETIME2](2)     GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
        CONSTRAINT [PK_tbl_C1_Interface_CustomerFlow]
            PRIMARY KEY CLUSTERED ([EMAIL] ASC, [market] ASC, [brand] ASC)
            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                  ALLOW_PAGE_LOCKS = ON
                 ) ON [PRIMARY],
        PERIOD FOR SYSTEM_TIME([ValidFrom], [ValidTo])
    ) ON [PRIMARY]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [ndev].[tbl_C1_Interface_CustomerFlow_hist]));
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
         MERGE INTO [ndev].[tbl_TrackOne_MasterData] AS t
         USING [nstage].[tbl_TrackOne_MasterData] AS s
         ON t.email = s.email
            AND t.market = s.market
            AND t.brand = s.brand
             WHEN NOT MATCHED BY TARGET 
			 THEN
               INSERT([EMAIL], 
                      [MARKET], 
                      [BRAND], 
                      [TITLE], 
                      [FIRST_NAME], 
                      [LAST_NAME], 
                      [BIRTHDAY], 
                      [STREET], 
                      [HOUSE_NUMBER], 
                      [ADD_ADDRESS], 
                      [ZIP_CODE], 
                      [CITY], 
                      [STATE], 
                      [COUNTRY])
               VALUES
					 ([EMAIL], 
					  [MARKET], 
					  [BRAND], 
					  [TITLE], 
					  [FIRST_NAME], 
					  [LAST_NAME], 
					  [BIRTHDAY], 
					  [STREET], 
					  [HOUSE_NUMBER], 
					  [ADD_ADDRESS], 
					  [ZIP_CODE], 
					  [CITY], 
					  [STATE], 
					  [COUNTRY]
					 )
             WHEN MATCHED AND EXISTS
				 (
					 SELECT ist.[EMAIL], 
							ist.[MARKET], 
							ist.[BRAND], 
							ist.[TITLE], 
							ist.[FIRST_NAME], 
							ist.[LAST_NAME], 
							ist.[BIRTHDAY], 
							ist.[STREET], 
							ist.[HOUSE_NUMBER], 
							ist.[ADD_ADDRESS], 
							ist.[ZIP_CODE], 
							ist.[CITY], 
							ist.[STATE], 
							ist.[COUNTRY]
					 FROM [nstage].[tbl_TrackOne_MasterData] as ist
					 WHERE ist.email      = EMAIL
						   AND ist.market = MARKET
						   AND ist.brand  = BRAND
					 EXCEPT
					 SELECT ita.[EMAIL], 
							ita.[MARKET], 
							ita.[BRAND], 
							ita.[TITLE], 
							ita.[FIRST_NAME], 
							ita.[LAST_NAME], 
							ita.[BIRTHDAY], 
							ita.[STREET], 
							ita.[HOUSE_NUMBER], 
							ita.[ADD_ADDRESS], 
							ita.[ZIP_CODE], 
							ita.[CITY], 
							ita.[STATE], 
							ita.[COUNTRY]
					 FROM [ndev].[tbl_TrackOne_MasterData] as ita
					 WHERE     ita.email  = EMAIL
						   AND ita.market = MARKET
						   AND ita.brand  = BRAND
				 )
             THEN UPDATE SET 
                             t.[title] = s.[title], 
                             t.[first_name] = s.[first_name], 
                             t.[last_name] = s.[last_name], 
                             t.[street] = s.[street], 
                             t.[house_number] = s.[house_number], 
                             t.[zip_code] = s.[zip_code], 
                             t.[city] = s.[city];
     END;
 GO




IF EXISTS(SELECT 1
FROM sysobjects
WHERE name = 'process_TrackOne_deltaCalculation')
DROP PROCEDURE process_TrackOne_deltaCalculation;	
GO
CREATE PROCEDURE process_TrackOne_deltaCalculation
AS
     BEGIN
         IF NOT EXISTS
         (
             SELECT 1
             FROM [nstage].[tbl_TrackOne_MasterData]
             HAVING MAX(loadts) =
             (
                 SELECT MAX(loadts)
                 FROM ndev.tbl_C1_Interface_CustomerFlow
             )
         )
             BEGIN
                 DECLARE @rowsdeleted INTEGER= 0;
                 DELETE FROM 
                 --select * from 
                 ndev.tbl_C1_Interface_CustomerFlow
                 WHERE EXISTS
                 (
                     SELECT [EMAIL], 
                            [MARKET], 
                            [BRAND], 
                            [TITLE], 
                            [FIRST_NAME], 
                            [LAST_NAME], 
                            [BIRTHDAY], 
                            [STREET], 
                            [HOUSE_NUMBER], 
                            [ADD_ADDRESS], 
                            [ZIP_CODE], 
                            [CITY], 
                            [STATE], 
                            [COUNTRY]
                     FROM [nstage].[tbl_TrackOne_MasterData]
                     WHERE email = ndev.tbl_C1_Interface_CustomerFlow.EMAIL
                           AND market = ndev.tbl_C1_Interface_CustomerFlow.MARKET
                           AND brand = ndev.tbl_C1_Interface_CustomerFlow.BRAND
                     EXCEPT
                     SELECT [EMAIL], 
                            [MARKET], 
                            [BRAND], 
                            [TITLE], 
                            [FIRST_NAME], 
                            [LAST_NAME], 
                            [BIRTHDAY], 
                            [STREET], 
                            [HOUSE_NUMBER], 
                            [ADD_ADDRESS], 
                            [ZIP_CODE], 
                            [CITY], 
                            [STATE], 
                            [COUNTRY]
                     FROM [ndev].[tbl_TrackOne_MasterData]
                     WHERE email = ndev.tbl_C1_Interface_CustomerFlow.EMAIL
                           AND market = ndev.tbl_C1_Interface_CustomerFlow.MARKET
                           AND brand = ndev.tbl_C1_Interface_CustomerFlow.BRAND
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
                     FROM ndev.tbl_C1_Interface_CustomerFlow
                 ) = 0))
                     BEGIN
                         -- PRINT('delta-insertation')
                         WITH deltastmt
                              AS (SELECT NEWID() nid, 
                                         s.email, 
                                         s.market, 
                                         s.brand, 
                                         ndev.fn_ahc(s.title, a.title) TITLE, 
                                         ndev.fn_ahc(s.first_name, a.first_name) FIRST_NAME, 
                                         ndev.fn_ahc(s.last_name, a.last_name) LAST_NAME, 
                                         ndev.fn_ahc(s.birthday, a.birthday) BIRTHDAY, 
                                         ndev.fn_ahc(s.street, a.street) STREET, 
                                         ndev.fn_ahc(s.house_number, a.house_number) HOUSE_NUMBER, 
                                         ndev.fn_ahc(s.add_address, a.add_address) ADD_ADDRESS, 
                                         ndev.fn_ahc(s.zip_code, a.zip_code) ZIP_CODE, 
                                         ndev.fn_ahc(s.city, a.city) CITY, 
                                         ndev.fn_ahc(s.state, a.state) STATE, 
                                         ndev.fn_ahc(s.country, a.country) COUNTRY, 
                                         s.LOADTS
                                  FROM [nstage].[tbl_TrackOne_MasterData] s
                                       LEFT OUTER JOIN [ndev].[tbl_TrackOne_MasterData] a ON s.email = a.email
                                                                                             AND s.market = a.market
                                                                                             AND s.brand = a.brand)
                              INSERT INTO ndev.tbl_C1_Interface_CustomerFlow
                                     SELECT nid, 
                                            email, 
                                            market, 
                                            brand, 
                                            [TITLE], 
                                            [FIRST_NAME], 
                                            [LAST_NAME], 
                                            [BIRTHDAY], 
                                            [STREET], 
                                            [HOUSE_NUMBER], 
                                            [ADD_ADDRESS], 
                                            [ZIP_CODE], 
                                            [CITY], 
                                            [STATE], 
                                            [COUNTRY], 
                                            loadts
                                     FROM deltastmt
                                     WHERE COALESCE([TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS], [ZIP_CODE], [CITY], [STATE], [COUNTRY]) IS NOT NULL
                                           AND NOT EXISTS
                                     (
                                         SELECT [EMAIL], 
                                                [MARKET], 
                                                [BRAND], 
                                                [TITLE], 
                                                [FIRST_NAME], 
                                                [LAST_NAME], 
                                                [BIRTHDAY], 
                                                [STREET], 
                                                [HOUSE_NUMBER], 
                                                [ADD_ADDRESS], 
                                                [ZIP_CODE], 
                                                [CITY], 
                                                [STATE], 
                                                [COUNTRY]
                                         FROM ndev.tbl_C1_Interface_CustomerFlow
                                         WHERE email = deltastmt.EMAIL
                                               AND market = deltastmt.MARKET
                                               AND brand = deltastmt.BRAND
                                     );
                     END;
             END;
     END;
 GO





IF EXISTS(SELECT 1
FROM sysobjects
WHERE name = 'process_TrackOne_stageload')
BEGIN
DROP PROCEDURE process_TrackOne_stageload;
END;	
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
             WHERE UPPER(TABLE_NAME) = UPPER('tbl_TrackOne_MasterData')
                   AND UPPER(TABLE_SCHEMA) = UPPER('nstage')
         )
             BEGIN
                 DROP TABLE nstage.tbl_TrackOne_MasterData;
             END;
         WITH combind_staging
              AS (SELECT TOP 100 PERCENT bseqid, 
                                         loadts, 
                                         EMAIL, 
                                         MARKET, 
                                         BRAND, 
                                         COALESCE(NULLIF(TITLE, ''),
                  (
                      SELECT TOP 1 TITLE
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(TITLE, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS TITLE, 
                                         COALESCE(NULLIF(FIRST_NAME, ''),
                  (
                      SELECT TOP 1 FIRST_NAME
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(FIRST_NAME, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS FIRST_NAME, 
                                         COALESCE(NULLIF(LAST_NAME, ''),
                  (
                      SELECT TOP 1 LAST_NAME
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(LAST_NAME, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS LAST_NAME, 
                                         COALESCE(NULLIF(BIRTHDAY, ''),
                  (
                      SELECT TOP 1 BIRTHDAY
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(BIRTHDAY, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS BIRTHDAY, 
                                         COALESCE(NULLIF(STREET, ''),
                  (
                      SELECT TOP 1 STREET
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(STREET, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS STREET, 
                                         COALESCE(NULLIF(HOUSE_NUMBER, ''),
                  (
                      SELECT TOP 1 HOUSE_NUMBER
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(HOUSE_NUMBER, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS HOUSE_NUMBER, 
                                         ADD_ADDRESS, 
                                         COALESCE(NULLIF(ZIP_CODE, ''),
                  (
                      SELECT TOP 1 ZIP_CODE
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(ZIP_CODE, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS ZIP_CODE, 
                                         COALESCE(NULLIF(CITY, ''),
                  (
                      SELECT TOP 1 CITY
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(CITY, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS CITY, 
                                         COALESCE(NULLIF([STATE], ''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF([STATE], '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS [STATE], 
                                         COALESCE(NULLIF(COUNTRY, ''),
                  (
                      SELECT TOP 1 COUNTRY
                      FROM nstage.tbl_int_TrackOne_MasterData
                      WHERE email = s.email
                            AND NULLIF(COUNTRY, '') IS NOT NULL
                      ORDER BY bseqid DESC
                  )) AS COUNTRY
                  FROM nstage.tbl_int_TrackOne_MasterData AS s
                  ORDER BY bseqid DESC, 
                           email, 
                           brand, 
                           market),
              adjusted_combind_staging
              AS (SELECT cs.*
                  -- temp solution to perform the dataimport consolitation
                  -- INTO [nstage].[tbl_TrackOne_MasterData]	
                  --
                  FROM combind_staging AS cs
                       INNER JOIN
                  (
                      SELECT MAX(bseqid) AS bseqid, 
                             email, 
                             market, 
                             brand
                      FROM combind_staging
                      GROUP BY email, 
                               market, 
                               brand
                  ) AS tcs ON cs.email = tcs.email
                              AND cs.brand = tcs.brand
                              AND cs.market = tcs.market
                              AND cs.bseqid = tcs.bseqid),
              adjusted_masterdata
              AS (SELECT a.email, 
                         a.brand, 
                         a.market, 
                         COALESCE(NULLIF(a.first_name, ''), h.first_name) AS first_name, 
                         COALESCE(NULLIF(a.last_name, ''), h.last_name) AS last_name, 
                         COALESCE(NULLIF(a.BIRTHDAY, ''), h.BIRTHDAY) AS BIRTHDAY, 
                         COALESCE(NULLIF(a.TITLE, ''), h.TITLE) AS TITLE, 
                         COALESCE(NULLIF(a.street, ''), h.street) AS street, 
                         COALESCE(NULLIF(a.house_number, ''), h.house_number) AS house_number, 
                         COALESCE(NULLIF(a.ADD_ADDRESS, ''), h.ADD_ADDRESS) AS ADD_ADDRESS, 
                         COALESCE(NULLIF(a.zip_code, ''), h.zip_code) AS zip_code, 
                         COALESCE(NULLIF(a.city, ''), h.city) AS city, 
                         COALESCE(NULLIF(a.STATE, ''), h.STATE) AS [STATE], 
                         COALESCE(NULLIF(a.COUNTRY, ''), h.COUNTRY) AS COUNTRY
                  FROM ndev.tbl_TrackOne_MasterData AS a
                       LEFT OUTER JOIN ndev.tbl_TrackOne_MasterData_hist AS h ON a.email = h.email
                                                                                 AND a.brand = h.brand
                                                                                 AND a.market = h.market
                                                                                 AND a.ValidFrom = h.ValidTo)
              SELECT aa.email, 
                     aa.brand, 
                     aa.market, 
                     COALESCE(NULLIF(aa.first_name, ''), hh.first_name) AS first_name, 
                     COALESCE(NULLIF(aa.last_name, ''), hh.last_name) AS last_name, 
                     COALESCE(NULLIF(aa.BIRTHDAY, ''), hh.BIRTHDAY) AS BIRTHDAY, 
                     COALESCE(NULLIF(aa.TITLE, ''), hh.TITLE) AS TITLE, 
                     COALESCE(NULLIF(aa.street, ''), hh.street) AS street, 
                     COALESCE(NULLIF(aa.house_number, ''), hh.house_number) AS house_number, 
                     COALESCE(NULLIF(aa.ADD_ADDRESS, ''), hh.ADD_ADDRESS) AS ADD_ADDRESS, 
                     COALESCE(NULLIF(aa.zip_code, ''), hh.zip_code) AS zip_code, 
                     COALESCE(NULLIF(aa.city, ''), hh.city) AS city, 
                     COALESCE(NULLIF(aa.STATE, ''), hh.STATE) AS [STATE], 
                     COALESCE(NULLIF(aa.COUNTRY, ''), hh.COUNTRY) AS COUNTRY, 
                     aa.loadts
              -- temp solution to perform the dataimport consolitation
              INTO nstage.tbl_TrackOne_MasterData	
              --
              FROM adjusted_combind_staging AS aa
                   LEFT OUTER JOIN adjusted_masterdata AS hh ON aa.email = hh.email
                                                                AND aa.brand = hh.brand
                                                                AND aa.market = hh.market;
     END;
GO

If EXISTS (select 1 from sysobjects where name = 'process_C1_Interface_FileExport')
	DROP PROCEDURE process_C1_Interface_FileExport	
GO		 
CREATE PROCEDURE process_C1_Interface_FileExport
AS
     IF EXISTS
     (
         SELECT *
         FROM sysobjects
         WHERE name = 'tbl_C1_Interface_CustomerFlow_exportfile'
     )
         DROP TABLE [ndev].tbl_C1_Interface_CustomerFlow_exportfile;
     BEGIN
         SELECT [NID], 
                [EMAIL], 
                [MARKET], 
                [BRAND], 
                [TITLE], 
                [FIRST_NAME], 
                [LAST_NAME], 
                [BIRTHDAY], 
                [STREET], 
                [HOUSE_NUMBER], 
                [ADD_ADDRESS], 
                [ZIP_CODE], 
                [CITY], 
                [STATE], 
                [COUNTRY]
         INTO ndev.tbl_C1_Interface_CustomerFlow_exportfile
         FROM ndev.tbl_C1_Interface_CustomerFlow   c1icf
         WHERE EXISTS
         (	
             SELECT ist.[EMAIL], 
                    ist.[MARKET], 
                    ist.[BRAND], 
                    ist.[TITLE], 
                    ist.[FIRST_NAME], 
                    ist.[LAST_NAME], 
                    ist.[BIRTHDAY], 
                    ist.[STREET], 
                    ist.[HOUSE_NUMBER], 
                    ist.[ADD_ADDRESS], 
                    ist.[ZIP_CODE], 
                    ist.[CITY], 
                    ist.[STATE], 
                    ist.[COUNTRY]
             FROM [nstage].[tbl_TrackOne_MasterData] AS ist
             WHERE ist.email      =  c1icf.EMAIL
                   AND ist.market =  c1icf.MARKET
                   AND ist.brand  =  c1icf.BRAND
				   
             EXCEPT
             SELECT ita.[EMAIL], 
                    ita.[MARKET], 
                    ita.[BRAND], 
                    ita.[TITLE], 
                    ita.[FIRST_NAME], 
                    ita.[LAST_NAME], 
                    ita.[BIRTHDAY], 
                    ita.[STREET], 
                    ita.[HOUSE_NUMBER], 
                    ita.[ADD_ADDRESS], 
                    ita.[ZIP_CODE], 
                    ita.[CITY], 
                    ita.[STATE], 
                    ita.[COUNTRY]
             FROM [ndev].[tbl_TrackOne_MasterData] AS ita
             WHERE ita.email      = c1icf.EMAIL
                   AND ita.market = c1icf.MARKET
                   AND ita.brand  = c1icf.BRAND
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
               AND COALESCE([TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS], [ZIP_CODE], [CITY], [STATE], [COUNTRY]) IS NOT NULL;
     END;
GO

IF EXISTS
    (
        SELECT
            *
        FROM
            sysobjects
        WHERE
            name = 'fn_ahc'
            AND uid = SCHEMA_ID('ndev')
    )
    DROP FUNCTION ndev.fn_ahc;
GO
CREATE FUNCTION ndev.fn_ahc
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



-- checkstep-1
-- initiale beladung des testaufbaus
--
truncate table [nstage].[tbl_int_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_int_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_int_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], [birthday], [STATE]
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'',
		'',
		'',
		'',
		'graz',NULL, 'CH'
	),
  	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'',
		'friedrich',
		'',
		'',
		'',
		'graz' ,NULL, 'FR'
	),
		(	
		'nadja@gmail.com',
		'LOREAL',
		'AT',
		'gundi',
		'',
		'bergstrasse',
		'',
		'',
		'graz' ,NULL , 'AT'
	),	
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'',
		'',
		'baiernstrasse',
		'59',
		'',
		'graz', '30.09.1970', null
	),	
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'',
		'',
		'',
		'80',
		'8020',
		'graz' ,NULL,'DE'
	),
	(	'lina@gmail.com',
		'VICHY',
		'AT',
		'lisa',
		'',
		'mecklenburgerstrasse',
		'3',
		'',
		'd�sseldorf', '10.10.1885', null 
	),
	(	'lina@gmail.com',
		'VICHY',
		'AT',
		'',
		'theuer',
		'seidenhofstrasse',
		'33',
		'1070',
		'', null, 'BE'
	),
 	(	'lina@gmail.com',
		'VICHY',
		'AT',
		'',
		'theuer-friedrich',
		'seidenhofstrasse',
		'33',
		'1070',
		'', null, 'BE'
	),
	(	'lina@gmail.com',
		'VICHY',
		'AT',
		'',
		'theuer-friedrich',
		'seidenhofstrasse',
		'34',
		'1070',
		'', null, 'BE'
	)

	/*,		
	(	'lina@gmail.com',
		'VICHY',
		'AT',
		'nadja',
		'theuer',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien', @cdatetime2
	),
	(	'levin@gmail.com',
		'MEN-EXPERT',
		'AT',
		'levin',
		'petschauer',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien', @cdatetime2
	)  
	*/

	--
	-- beladen der tabellen f�r masterdata, delta und export
	--
exec process_TrackOne_stageload					-- consolidate inports
exec process_TrackOne_deltaCalculation
exec process_C1_Interface_FileExport
exec process_TrackOne_MasterData


	-- pr�fen des exportsates(mit der eingangs erstellten view
select * from ndev.tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from [nstage].[tbl_int_TrackOne_MasterData]
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]
select * from [ndev].[tbl_C1_Interface_CustomerFlow_hist]



-- checkstep-2
-- initiale beladung des testaufbaus
--
truncate table [nstage].[tbl_int_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_int_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_int_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], [birthday], [STATE]
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'',
		'',
		'',
		'',
		'',
		'',NULL, ''
	)

	--
	-- beladen der tabellen f�r masterdata, delta und export
	--
exec process_TrackOne_stageload					-- consolidate inports
exec process_TrackOne_deltaCalculation
exec process_C1_Interface_FileExport
exec process_TrackOne_MasterData


	-- pr�fen des exportsates(mit der eingangs erstellten view
select * from ndev.tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]
select * from [ndev].[tbl_C1_Interface_CustomerFlow_hist]


-- checkstep-3
-- neuen satz hinzuf�gen
--
truncate table [nstage].[tbl_int_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_int_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_int_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], [birthday], [STATE]
	) values
	(	'beate@gmail.com',
		'LOREAL',
		'AT',
		'Beate',
		'Frisch',
		'',
		'',
		'',
		'Hamburg',NULL, 'DE'
	)

	--
	-- beladen der tabellen f�r masterdata, delta und export
	--
exec process_TrackOne_stageload					-- consolidate inports
exec process_TrackOne_deltaCalculation
exec process_C1_Interface_FileExport
exec process_TrackOne_MasterData


	-- pr�fen des exportsates(mit der eingangs erstellten view
select * from ndev.tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from ndev.tbl_C1_Interface_CustomerFlow_exportfile (update)
select * from [ndev].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]
select * from [ndev].[tbl_C1_Interface_CustomerFlow_hist]


-- checkstep-4
-- neuen satz hinzuf�gen
--
truncate table [nstage].[tbl_int_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_int_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_int_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], [birthday], [STATE]
	) values
	(	'beate@gmail.com',
		'LOREAL',
		'AT',
		'Beate',
		'Frisch',
		'Willy Brand Strasse',
		'',
		'',
		'Hamburg',NULL, 'DE'
	),
	(	'beate@gmail.com',
		'LOREAL',
		'AT',
		'Beate',
		'Frisch',
		'Willy Brand Strasse',
		'75',
		'',
		'Hamburg',NULL, 'DE'
	)

	--
	-- beladen der tabellen f�r masterdata, delta und export
	--
exec process_TrackOne_stageload					-- consolidate inports
exec process_TrackOne_deltaCalculation
exec process_C1_Interface_FileExport
exec process_TrackOne_MasterData


	-- pr�fen des exportsates(mit der eingangs erstellten view
select * from ndev.tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]
select * from [ndev].[tbl_C1_Interface_CustomerFlow_hist]


-- checkstep-5
-- neuen satz hinzuf�gen
--
truncate table [nstage].[tbl_int_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_int_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_int_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], [birthday], [STATE]
	) values
	(	'beate@gmail.com',
		'LOREAL',
		'AT',
		'Beate',
		'Frisch',
		'Willy Brand Strasse',
		'',
		'20001',
		'Hamburg',NULL, 'DE'
	)

	--
	-- beladen der tabellen f�r masterdata, delta und export
	--
exec process_TrackOne_stageload					-- consolidate inports
exec process_TrackOne_deltaCalculation
exec process_C1_Interface_FileExport
exec process_TrackOne_MasterData


	-- pr�fen des exportsates(mit der eingangs erstellten view
select * from ndev.tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_TrackOne_MasterData_hist]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]
select * from [ndev].[tbl_C1_Interface_CustomerFlow_hist]




--
-- devpad

DECLARE @sql AS VARCHAR(MAX);
SELECT @sql = 'select t1.col1, '+STUFF(
(
    SELECT '+ case when t1.'+column_name+' = t2.'+column_name+' then '''' 
    else '''+column_name+''' end '
    FROM information_schema.columns
    WHERE table_name = 'A_new'
          AND column_name <> 'col1'
    ORDER BY column_name FOR XML PATH('')
), 1, 2, '')+' as list_of_changes from A_old t1 join A_new t2 on t1.col1 = t2.col1';
SELECT @sql = 'select t.col1, case when len(t.list_of_changes) = 0 then ''No changes'' 
              else t.list_of_changes end as list_of_changes 
              from('+@sql+')t;';
EXEC (@sql);




SELECT col1, col2, col3, col4
FROM
 (
   SELECT *
   FROM a_old
   UNION ALL
   SELECT *
   FROM a_new
)  t
GROUP BY col1, col2, col3, col4
HAVING COUNT(*) = 1
ORDER BY col1;


select * from [nstage].[tbl_TrackOne_MasterData]


SELECT a.email, 
       COALESCE(NULLIF(a.[first_name], ''), h.[first_name]) [first_name], 
       COALESCE(NULLIF(a.[last_name], ''), h.[last_name]) [last_name], 
       COALESCE(NULLIF(a.[street], ''), h.[street]) [street], 
       COALESCE(NULLIF(a.[house_number], ''), h.[house_number]) [house_number], 
       COALESCE(NULLIF(a.[zip_code], ''), h.[zip_code]) [zip_code], 
       COALESCE(NULLIF(a.[city], ''), h.[city]) [city]
FROM [ndev].[tbl_TrackOne_MasterData] a
     LEFT OUTER JOIN 
	 [ndev].[tbl_TrackOne_MasterData_hist] h ON a.[email] = h.[email]
                                            AND a.[brand] = h.[brand]
                                            AND a.[market] = h.[market]
                                            AND a.ValidFrom = h.ValidTo;


select a.email
	 , coalesce(nullif(a.[first_name], '')	, h.[first_name])	[first_name]
	 , coalesce(nullif(a.[last_name], '')	, h.[last_name])	[last_name]
	 , coalesce(nullif(a.[street], '')		, h.[street])		[street]
	 , coalesce(nullif(a.[house_number], ''), h.[house_number])	[house_number]
	 , coalesce(nullif(a.[zip_code], '')	, h.[zip_code])		[zip_code]
	 , coalesce(nullif(a.[city], '')		, h.[city])			[city]

  from 
		[nstage].[tbl_TrackOne_MasterData] s
		inner join
		[ndev].[tbl_TrackOne_MasterData] a
		on
		left outer join
		[ndev].[tbl_TrackOne_MasterData_hist] h
		on		a.[email]	= h.[email]
			    a.[brand]	= h.[brand]
		        a.[market]	= h.[market]
			and a.ValidFrom = h.ValidTo