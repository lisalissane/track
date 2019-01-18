
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
		DROP  TABLE [nstage].[tbl_TrackOne_MasterData];			
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


If EXISTS (select 1 from sysobjects where name = 'process_TrackOne_MasterData')
	DROP PROCEDURE process_TrackOne_MasterData	
go
CREATE PROCEDURE process_TrackOne_MasterData
AS
    BEGIN
        MERGE INTO [ndev].[tbl_TrackOne_MasterData] AS t
        USING [nstage].[tbl_TrackOne_MasterData] AS s
        ON t.email = s.email
           AND t.market = s.market
           AND t.brand = s.brand
        WHEN NOT MATCHED BY TARGET
            THEN INSERT
                     (
                         [email],
                         [MARKET],
                         [BRAND],
                         [title],
                         [first_name],
                         [last_name],
                         [street],
                         [house_number],
                         [zip_code],
                         [city]
                     )
                 VALUES
                     (
                         [email], [MARKET], [BRAND], [title], [first_name], [last_name], [street], [house_number],
                         [zip_code], [city]
                     )
        WHEN MATCHED
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
                 )
                     
                 SET @rowsdeleted =
                 (
                     SELECT @@ROWCOUNT AS DELETED
                 );

/*
                 TODO 
                   CHECKVALIDATION;
				*/

                 --
                 --	delta calculation and persisting against
                 --	delta hive

                 IF(@rowsdeleted > 0
                    OR (@rowsdeleted = 0
                        AND
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
                                         s.loadts
                                  FROM [nstage].[tbl_TrackOne_MasterData] s
                                       LEFT OUTER JOIN [ndev].[tbl_TrackOne_MasterData] a ON s.email = a.email
                                                                                             AND s.market = a.market
                                                                                             AND s.brand = a.brand)
						--INSERT INTO ndev.tbl_C1_Interface_CustomerFlow
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

--select * from [nstage].[tbl_TrackOne_MasterData]
--select * from ndev.[tbl_TrackOne_MasterData]

If EXISTS (select 1 from sysobjects where name = 'process_TrackOne_stageload')
	DROP PROCEDURE process_TrackOne_stageload	
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
                 DROP TABLE [nstage].[tbl_TrackOne_MasterData];
             END;

         WITH combind_staging
              AS (SELECT TOP 100 PERCENT [bseqid], 
                                         [EMAIL], 
                                         [MARKET], 
                                         [BRAND], 
                                         COALESCE(NULLIF([TITLE], ''),
                  (
                      SELECT TOP 1 [TITLE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([TITLE], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [TITLE], 
                                         COALESCE(NULLIF([FIRST_NAME], ''),
                  (
                      SELECT TOP 1 [FIRST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([FIRST_NAME], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [FIRST_NAME], 
                                         COALESCE(NULLIF([LAST_NAME], ''),
                  (
                      SELECT TOP 1 [LAST_NAME]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([LAST_NAME], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [LAST_NAME], 
                                         COALESCE(NULLIF([BIRTHDAY], ''),
                  (
                      SELECT TOP 1 [BIRTHDAY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([BIRTHDAY], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [BIRTHDAY], 
                                         COALESCE(NULLIF([STREET], ''),
                  (
                      SELECT TOP 1 [STREET]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STREET], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STREET], 
                                         COALESCE(NULLIF([HOUSE_NUMBER], ''),
                  (
                      SELECT TOP 1 [HOUSE_NUMBER]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([HOUSE_NUMBER], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [HOUSE_NUMBER], 
                                         [ADD_ADDRESS], 
                                         COALESCE(NULLIF([ZIP_CODE], ''),
                  (
                      SELECT TOP 1 [ZIP_CODE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([ZIP_CODE], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [ZIP_CODE], 
                                         COALESCE(NULLIF([CITY], ''),
                  (
                      SELECT TOP 1 [CITY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([CITY], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [CITY], 
                                         COALESCE(NULLIF([STATE], ''),
                  (
                      SELECT TOP 1 [STATE]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([STATE], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [STATE], 
                                         COALESCE(NULLIF([COUNTRY], ''),
                  (
                      SELECT TOP 1 [COUNTRY]
                      FROM [nstage].[tbl_int_TrackOne_MasterData]
                      WHERE [email] = s.[email]
                            AND NULLIF([COUNTRY], '') IS NOT NULL
                      ORDER BY [bseqid] DESC
                  )) [COUNTRY]
                  FROM [nstage].[tbl_TrackOne_MasterData] s
                  ORDER BY [bseqid] DESC, 
                           email, 
                           brand, 
                           market)
              SELECT cs.*
              INTO [nstage].[tbl_int_TrackOne_MasterData]	-- temp solution to perform the dataimport consolitation

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
GO

If EXISTS (select 1 from sysobjects where name = 'process_C1_Interface_FileExport')
	DROP PROCEDURE process_C1_Interface_FileExport	
GO

CREATE PROCEDURE process_C1_Interface_FileExport
AS

	IF EXISTS (select 1 from sysobjects where name = 'tbl_C1_Interface_CustomerFlow_exportfile')
		DROP TABLE [ndev].tbl_C1_Interface_CustomerFlow_exportfile

    BEGIN
        SELECT
            [NID],
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
       INTO
            ndev.tbl_C1_Interface_CustomerFlow_exportfile
        FROM
            ndev.tbl_C1_Interface_CustomerFlow
        WHERE
            EXISTS
            (
                SELECT
                    1
                FROM
                    [nstage].[tbl_TrackOne_MasterData] s
                WHERE
                         s.email = ndev.tbl_C1_Interface_CustomerFlow.EMAIL
                    AND s.market = ndev.tbl_C1_Interface_CustomerFlow.MARKET
                    AND s.brand  = ndev.tbl_C1_Interface_CustomerFlow.BRAND
            )
            AND COALESCE(
                            [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY]
                        ) IS NOT NULL
			
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


select checksum(''), checksum(0)

--
-- init


truncate table [nstage].[tbl_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city]
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'friedrich',
		'bergstrasse',
		'59',
		'8020',
		'graz'
	),
	(	'lina@gmail.com',
		'VICHY',
		'AT',
		'nadja',
		'theuer',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien'
	),
	(	'levin@gmail.com',
		'MEN-EXPERT',
		'AT',
		'levin',
		'petschauer',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien'
	)  

--
--	change surname
declare @cdatetime2 datetime2= sysdatetime();

truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'theuer',
		'bergstrasse',
		'59',
		'8020',
		'graz', @cdatetime2
	)

--
--	change surname(same pk, same changed value)
--  no action musst be performed
declare @cdatetime2 datetime2= sysdatetime();

truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'theuer',
		'bergstrasse',
		'59',
		'8020',
		'graz', @cdatetime2
	)


--
--	change surname(same pk, same changed value)birthday
--  a) no action musst be performed on the surname filed, 
--  b) but the change of the birthday filed musst be reportet
declare @cdatetime2 datetime2= sysdatetime();

truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [birthday],[street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'theuer',
		'08.05.1974',
		'bergstrasse',
		'59',
		'8020',
		'graz', @cdatetime2
	)


--
--	NULL-ing  of the fields surename, street, zipcode, housenumber(same pk) 
--  a) it is expected that a change will be detected and that no change 
--     will be reported
declare @cdatetime2 datetime2= sysdatetime();

truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [birthday],[street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'',
		'08.05.1974',
		'',
		'',
		'',
		'graz', @cdatetime2
	)




--
-- change 1
declare @cdatetime2 datetime2= sysdatetime();
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'friedrich',
		'bergstrasse',
		'',
		'',
		'graz', @cdatetime2
	)

--
-- change 2
declare @cdatetime2 datetime2= sysdatetime();
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'friedrich',
		'bergstrasse',
		'xxc',
		'1010',
		'wien', @cdatetime2
	)

--
-- change 3
declare @cdatetime2 datetime2= sysdatetime();
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'levin@gmail.com',
		'MEN-EXPERT',
		'AT',
		'Günther',
		'Spahl',
		'seidenhofstraß',
		'111b',
		'0815',
		'Marburg', @cdatetime2
	) 


--
-- change 4 (double entry)
declare @cdatetime2 datetime2= sysdatetime();
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'levin@gmail.com',
		'MEN-EXPERT',
		'AT',
		'01.01.2018',
		'Peter',
		'Schlei',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien', @cdatetime2
	),
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'17.07.2007',
		'lisa',
		'friedrich',
		'bergstrasse',
		'59a',
		'1010',
		'wien', @cdatetime2
	) 

--
-- change 5 (double entry, multi-fields)
declare @cdatetime2 datetime2= sysdatetime();
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'levin@gmail.com',
		'MEN-EXPERT',
		'AT',
		'01.01.2018',
		'Peter',
		'Schlei',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien', @cdatetime2
	),
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'17.07.2007',
		'lisa',
		'friedrich',
		'bergstrasse',
		'59a',
		'1010',
		'wien', @cdatetime2
	) 

exec process_TrackOne_deltaCalculation
--exec process_C1_Interface_FileExport
exec process_TrackOne_MasterData


select * from [nstage].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_TrackOne_MasterData]
select * from [ndev].[tbl_C1_Interface_CustomerFlow]	  
select * from [ndev].tbl_C1_Interface_CustomerFlow_exportfile




        SELECT
            a.[NID],
            a.[EMAIL],
            a.[MARKET],
            a.[BRAND],
            a.[TITLE],
            a.[FIRST_NAME],
            a.[LAST_NAME],
            a.[BIRTHDAY],
            a.[STREET],
            a.[HOUSE_NUMBER],
            a.[ADD_ADDRESS],
            a.[ZIP_CODE],
            a.[CITY],
            a.[STATE],
            a.[COUNTRY],
		    (SELECT hashbytes('md5', ( SELECT [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY] from [nstage].[tbl_TrackOne_MasterData] where email  = a.EMAIL
                    AND market = a.MARKET
                    AND brand  = a.BRAND FOR XML raw )))  s_check,
		    (SELECT hashbytes('md5', ( SELECT [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY] from ndev.tbl_C1_Interface_CustomerFlow where email  = s.EMAIL
                    AND market = s.MARKET
                    AND brand  = s.BRAND FOR XML raw )))  a_check
       -- INTO
       --     ndev.tbl_C1_Interface_CustomerFlow_exportfile
        FROM
            ndev.tbl_C1_Interface_CustomerFlow a
			inner join 
			[nstage].[tbl_TrackOne_MasterData] s
				on	    s.email  = a.EMAIL
                    AND s.market = a.MARKET
                    AND s.brand  = a.BRAND
        WHERE
           COALESCE(
                            a.[TITLE], a.[FIRST_NAME], a.[LAST_NAME], a.[BIRTHDAY], a.[STREET], a.[HOUSE_NUMBER], a.[ADD_ADDRESS],
                            a.[ZIP_CODE], a.[CITY], a.[STATE], a.[COUNTRY]
                        ) IS NOT NULL
			   and  (select (
                            s.[TITLE], s.[FIRST_NAME], s.[LAST_NAME], s.[BIRTHDAY], s.[STREET], s.[HOUSE_NUMBER], s.[ADD_ADDRESS],
                            s.[ZIP_CODE], s.[CITY], s.[STATE], s.[COUNTRY]
                        ) <>
						 COALESCE(
                            a.[TITLE], a.[FIRST_NAME], a.[LAST_NAME], a.[BIRTHDAY], a.[STREET], a.[HOUSE_NUMBER], a.[ADD_ADDRESS],
                            a.[ZIP_CODE], a.[CITY], a.[STATE], a.[COUNTRY]
                        ) )



        SELECT
            [NID],
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
       --INTO
       --     ndev.tbl_C1_Interface_CustomerFlow_exportfile
        FROM
            ndev.tbl_C1_Interface_CustomerFlow
        WHERE
            EXISTS
            (
                SELECT
                    1
                FROM
                    [nstage].[tbl_TrackOne_MasterData] s
                WHERE
                         s.email = ndev.tbl_C1_Interface_CustomerFlow.EMAIL
                    AND s.market = ndev.tbl_C1_Interface_CustomerFlow.MARKET
                    AND s.brand  = ndev.tbl_C1_Interface_CustomerFlow.BRAND
            )
            AND COALESCE(
                            [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY]
                        ) IS NOT NULL



SELECT hashbytes('md5', cast(sysdatetime() as varchar(max))) xxx  FOR XML raw, BINARY BASE64 
SELECT checksum(cast(sysdatetime() as varchar(max))) xxx  FOR XML raw, BINARY BASE64 


-- compute a single hash value for all rows of a table
BEGIN
    SET NOCOUNT ON;

    -- init hash variable
    DECLARE @tblhash VARCHAR(40);
    SET @tblhash = 'start';

    -- compute a single hash value
    SELECT @tblhash = sys.fn_varbintohexsubstring
    (0, HASHBYTES('sha1', (CONVERT(VARBINARY(MAX), @tblhash+
    (
        SELECT sys.fn_varbintohexsubstring
        (0, HASHBYTES('sha1', (CONVERT(VARBINARY(MAX),
               -- replace 'select *' if you want only specific columns to be included in the hash calculation
               -- [target table] is the name of the table to calc the hash from
               -- [row_id] is the primary key column within the target table
               -- modify those in the next lines to suit your needs:
        (
            SELECT *
            FROM [target_table] obj2
            WHERE obj2.[row_id] = obj1.[row_id] FOR XML RAW
        )))), 1, 0
        )
    )))), 1, 0
    )
    FROM [target_table] obj1;
    SET NOCOUNT OFF;

    -- return result
    SELECT @tblhash AS hashvalue;
END;




