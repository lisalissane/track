
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
CREATE TABLE [nstage].[tbl_TrackOne_MasterData]
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
        CONSTRAINT [PK_stage_tbl_TrackOne_MasterData]
            PRIMARY KEY CLUSTERED ([email] ASC, [market] ASC, [brand] ASC)
            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                    ALLOW_PAGE_LOCKS = ON
                    ) ON [PRIMARY]
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

If EXISTS (select 1 from sysobjects where name = 'process_TrackOne_deltaCalculation')
	DROP PROCEDURE process_TrackOne_deltaCalculation	
go
CREATE PROCEDURE process_TrackOne_deltaCalculation
AS
    BEGIN
        DELETE FROM
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
                    AND s.brand = ndev.tbl_C1_Interface_CustomerFlow.BRAND
            );

        --
        --	delta calculation and persisting against
        --	delta hive

        INSERT INTO ndev.tbl_C1_Interface_CustomerFlow
                    SELECT
                            NEWID(),
                            s.email,
                            s.market,
                            s.brand,
                            ndev.fn_ahc(s.title, a.title)               TITLE,
                            ndev.fn_ahc(s.first_name, a.first_name)     FIRST_NAME,
                            ndev.fn_ahc(s.last_name, a.last_name)       LAST_NAME,
                            ndev.fn_ahc(s.birthday, a.birthday)         BIRTHDAY,
                            ndev.fn_ahc(s.street, a.street)             STREET,
                            ndev.fn_ahc(s.house_number, a.house_number) HOUSE_NUMBER,
                            ndev.fn_ahc(s.add_address, a.add_address)   ADD_ADDRESS,
                            ndev.fn_ahc(s.zip_code, a.zip_code)         ZIP_CODE,
                            ndev.fn_ahc(s.city, a.city)                 CITY,
                            ndev.fn_ahc(s.state, a.state)               STATE,
                            ndev.fn_ahc(s.country, a.country)           COUNTRY
                    FROM
                            [nstage].[tbl_TrackOne_MasterData] s
                        LEFT OUTER JOIN
                            [ndev].[tbl_TrackOne_MasterData]   a
                                ON s.email = a.email
                                   AND s.market = a.market
                                   AND s.brand = a.brand;
    END;
 GO


If EXISTS (select 1 from sysobjects where name = 'process_TrackOne_stageload')
	DROP PROCEDURE process_TrackOne_stageload	
GO

CREATE PROCEDURE process_TrackOne_stageload
AS
BEGIN	  SELECT 1
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


--
-- init
truncate table [nstage].[tbl_TrackOne_MasterData]  
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
-- change 1
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'friedrich',
		'bergstrasse',
		'59a',
		'8020',
		'graz'
	)

--
-- change 2
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'lisa',
		'friedrich',
		'bergstrasse',
		'59a',
		'1010',
		'wien'
	)

--
-- change 3
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'levin@gmail.com',
		'MEN-EXPERT',
		'AT',
		'Peter',
		'Schlei',
		'seidenhofstrasse',
		'111',
		'4021',
		'linz'
	) 


--
-- change 4 (double entry)
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [birthday],[first_name], [last_name], [street], [house_number], [zip_code], [city] 
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
		'wien'
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
		'wien'
	) 

--
-- change 5 (double entry, multi-fields)
truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [birthday],[first_name], [last_name], [street], [house_number], [zip_code], [city] 
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
		'wien'
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
		'wien'
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