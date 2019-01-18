USE [Loreal]
GO

/****** Object:  Table [ndev].[tbl_int_TrackOne]    Script Date: 05.09.2018 19:24:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
							     

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


	   					  
		SELECT * FROM INFORMATION_SCHEMA.TABLES				  

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

DBCC SQLPERF(LOGSPACE);  
-- Check the AdventureWorks2012 database.  

DBCC CHECKALLOC (Loreal);  
GO  



ALTER TABLE ndev.[tbl_C1_Interface_CustomerFlow] SET (SYSTEM_VERSIONING = OFF);
DROP TABLE ndev.[tbl_C1_Interface_CustomerFlow];
GO
DROP TABLE ndev.[tbl_C1_Interface_CustomerFlow_hist];
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



--
-- initial load pad

truncate table [nstage].[tbl_TrackOne_MasterData] 

insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'lisa',
		'friedrich',
		'bergstrasse',
		'59',
		'8020',
		'graz'
	),
	(	'nadja.lisa@gmail.coom',
		'nadja',
		'theuer',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien'
	) 
	;

exec ndev.process_TrackOne_MasterData
--
-- updatepad
-- 1
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'nadja lisa',
		'friedrich',
		'strassburgerstrasse',
		'3',
		'',
		'linz'
	)
go
exec ndev.process_TrackOne_MasterData
-- 2
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'gerda',
		'friedrich',
		'baiernstrasse',
		'3',
		'',
		'müchen'
	)
go
exec ndev.process_TrackOne_MasterData
-- 3
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'gerda',
		'friedrich',
		'baiernstrasse',
		'3',
		'1111',
		'müchen'
	)
go
exec ndev.process_TrackOne_MasterData
-- 4
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'gerda',
		'mayer',
		'',
		'3',
		'',
		''
	)
go
exec ndev.process_TrackOne_MasterData
-- 5
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja.lisa@gmail.coom',
		'michael',
		'theuer',
		'willy brand strasse',
		'75',
		'',
		'Hamburg'
	)
go
exec ndev.process_TrackOne_MasterData
-- 6
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja.lisa@gmail.coom',
		'michael',
		'theuer',
		'willy brand strasse',
		'75',
		'',
		'köln'
	)
go
exec ndev.process_TrackOne_MasterData
-- 7
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja.lisa@gmail.coom',
		'michaela',
		'theuer',
		'willy brand strasse',
		'75',
		'',
		'köln'
	)
go
exec ndev.process_TrackOne_MasterData

-- 8
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'gerda',
		'theuer',
		'willy brand strasse',
		'76',
		'',
		'köln'
	)
go
exec ndev.process_TrackOne_MasterData
-- 9
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja.lisa@gmail.coom',
		'michaela',
		'theuer',
		'willy brand strasse',
		'76',
		'0815',
		'köln'
	)
go
exec ndev.process_TrackOne_MasterData
-- 10
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja.lisa@gmail.coom',
		'michaela',
		'theuer',
		'willy brand strasse',
		'76',
		'0815',
		''
	)
go
exec ndev.process_TrackOne_MasterData
-- 10
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja.lisa@gmail.coom',
		'igit',
		'rozenblium',
		'willy brand strasse',
		'76',
		'0815',
		''
	)
go
exec ndev.process_TrackOne_MasterData

-- 11
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'enrika.rozenblium@gmail.coom',
		'enrika',
		'rozenblium',
		'unter den auen',
		'21',
		'33729',
		'Bielefeld'
	)
go
exec ndev.process_TrackOne_MasterData

-- 12
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'enrika.rozenblium@gmail.coom',
		'enrika',
		'rozenblium',
		'',
		'3',
		'33729',
		'Bielefeld'
	)
go
exec ndev.process_TrackOne_MasterData
-- 13
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'enrika.rozenblium@gmail.coom',
		'enrika',
		'rozenblium',
		'',
		'3a',
		'33729',
		'Bielefeld'
	)
go
exec ndev.process_TrackOne_MasterData
-- 14
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'enrika.rozenblium@gmail.coom',
		'enrika',
		'rozenblium',
		'Mecklenburgerstrasse',
		'',
		'33729',
		'Bielefeld'
	)
go
exec ndev.process_TrackOne_MasterData
exec ndev.process_TrackOne_MasterData
-- 15
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'enrika.rozenblium@gmail.coom',
		'enrika',
		'rozenblium',
		'Rosenstrasse',
		'',
		'33729',
		'Bielefeld'
	)
go
exec ndev.process_TrackOne_MasterData
-- 16
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'andrea@gmail.coom',
		'andreas',
		'ketelhut',
		'',
		'',
		'',
		'Hamburg'
	)
go
exec ndev.process_TrackOne_MasterData

-- 17
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [title], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'nadja@gmail.coom',
		'Dr.',
		'',
		'Theuer',
		'',
		'',
		'',
		''
	)
go
exec ndev.process_TrackOne_MasterData

-- 18
truncate table [nstage].[tbl_TrackOne_MasterData] 
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [first_name], [last_name], [street], [house_number], [zip_code], [city] 
	) values
	(	'andrea@gmail.coom',
		'andreas',
		'ketelhut',
		'Katharinenstrasse',
		'',
		'',
		''
	)
go
exec ndev.process_TrackOne_MasterData

select * from  [nstage].[tbl_TrackOne_MasterData] 

--
-- v1
--

create procedure ndev.process_TrackOne_MasterData
as
	begin

		MERGE INTO [ndev].[tbl_TrackOne_MasterData]	AS t
			 USING [nstage].[tbl_TrackOne_MasterData]	AS s 
				ON t.email = s.email
		WHEN NOT MATCHED BY TARGET THEN
			INSERT ([email], [first_name], [last_name], [street], [house_number], [zip_code], [city])
			VALUES ([email], [first_name], [last_name], [street], [house_number], [zip_code], [city])

		WHEN MATCHED THEN
			UPDATE SET t.[email]		= s.[email]
					 , t.[first_name]	= s.[first_name]
					 , t.[last_name]	= s.[last_name]
					 , t.[street]		= s.[street]
					 , t.[house_number]	= s.[house_number]
					 , t.[zip_code]		= s.[zip_code]
					 , t.[city]			= s.[city]
		;

	end;

--
-- v2
--
MERGE INTO [ndev].[tbl_TrackOne_MasterData]	AS t
	 USING [nstage].[tbl_TrackOne_MasterData]	AS s 
		ON t.email = s.email
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([email], [first_name], [last_name], [street], [house_number], [zip_code], [city])
    VALUES ([email], [first_name], [last_name], [street], [house_number], [zip_code], [city])

WHEN MATCHED THEN
    UPDATE SET t.[email]		= s.[email]
			 , t.[first_name]	= s.[first_name]
			 , t.[last_name]	= s.[last_name]
			 , t.[street]		= s.[street]
			 , t.[house_number]	= s.[house_number]
			 , t.[zip_code]		= s.[zip_code]
			 , t.[city]			= s.[city]	
;


--
-- CODE:
-- v3
--
ALTER PROCEDURE ndev.process_TrackOne_MasterData
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
                            a.email,
                            a.market,
                            a.brand,
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
                            ndev.fn_ahc(s.country, a.country)           COUNTRYTRY
                    FROM
                            [nstage].[tbl_TrackOne_MasterData] s
                        LEFT OUTER JOIN
                            [ndev].[tbl_TrackOne_MasterData]   a
                                ON		s.email  = a.email
                                   AND	s.market = a.market
                                   AND	s.brand  = a.brand;

        --
        --	Preparation of delta-expot records based 
        --	on the delta hive

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
            )
            AND COALESCE(
                            [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY]
                        ) IS NOT NULL;


        MERGE INTO [ndev].[tbl_TrackOne_MasterData] AS t
        USING [nstage].[tbl_TrackOne_MasterData] AS s
        ON t.email = s.email
        WHEN NOT MATCHED BY TARGET
            THEN INSERT
                     (
                         [email],
						 [market],
						 [brand],
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
                         [email], [market], [brand], [title], [first_name], [last_name], [street], [house_number], [zip_code], [city]
                     )
        WHEN MATCHED
            THEN UPDATE SET
					 /* no update on key emelemnts email,market,brand */
                     t.[title] = s.[title],
                     t.[first_name] = s.[first_name],
                     t.[last_name] = s.[last_name],
                     t.[street] = s.[street],
                     t.[house_number] = s.[house_number],
                     t.[zip_code] = s.[zip_code],
                     t.[city] = s.[city];


    END;



--
-- CODE:
-- v4
--
CREATE PROCEDURE ndev.process_TrackOne_MasterData
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
 		-- SELECT * FROM [ndev].[tbl_C1_Interface_CustomerFlow]
		-- SELECT * FROM [ndev].[tbl_C1_Interface_CustomerFlow_hist] 


        --
        --	Preparation of delta-expot records based 
        --	on the delta hive


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
			
			INTO ndev.tbl_C1_Interface_CustomerFlow_exportfile	

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
                    AND s.brand = ndev.tbl_C1_Interface_CustomerFlow.BRAND
            )
            AND COALESCE(
                            [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY]
                        ) IS NOT NULL;


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

	-- SELECT * FROM [ndev].[tbl_TrackOne_MasterData]
	-- SELECT * FROM [ndev].[tbl_TrackOne_MasterData_hist] 
 
--
--	Split-Code:	
--	v5
--
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

CREATE PROCEDURE process_TrackOne_stageload
AS
BEGIN	  NULL
END;

CREATE PROCEDURE process_C1_Interface_FileExport
AS
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
                    AND s.brand = ndev.tbl_C1_Interface_CustomerFlow.BRAND
            )
            AND COALESCE(
                            [TITLE], [FIRST_NAME], [LAST_NAME], [BIRTHDAY], [STREET], [HOUSE_NUMBER], [ADD_ADDRESS],
                            [ZIP_CODE], [CITY], [STATE], [COUNTRY]
                        ) IS NOT NULL;
    END;







OUTPUT ISNULL(inserted.a, deleted.a),
       GETDATE() AS dt,
       SUSER_SNAME()+' '+$action+'d.' AS what
INTO #log (a, dt, what);


SELECT * FROM [ndev].tbl_C1_Interface_CustomerFlow FOR SYSTEM_TIME all

select * from [ndev].[tbl_TrackOne_MasterData_hist]

select  row_number() over (partition by [email] order by [ValidTo] desc) key_sequence_nr, *
		from [ndev].[tbl_TrackOne_MasterData_hist]

select a.email
	 , iif(ascii(a.[first_name]		) is null, h.[first_name]+'*',		iif(a.[first_name]   <> h.[first_name],		a.[first_name]+'**',	a.[first_name]))	[first_name]
	 , iif(ascii(a.[last_name]		) is null, h.[last_name]+'*',		iif(a.[last_name]	 <> h.[last_name],		a.[last_name]+'**',		a.[last_name]))		[last_name]
	 , iif(ascii(a.[street]			) is null, h.[street]+'*',			iif(a.[street]		 <> h.[street],			a.[street]+'**',		a.[street]))		[street]
	 , iif(ascii(a.[house_number]	) is null, h.[house_number]+'*',	iif(a.[house_number] <> h.[house_number],	a.[house_number]+'**',	a.[house_number]))	[house_number]
	 , iif(ascii(a.[zip_code]		) is null, h.[zip_code]+'*',		iif(a.[zip_code]	 <> h.[zip_code],		a.[zip_code]+'**',		a.[zip_code]))		[zip_code]
	 , iif(ascii(a.[city]			) is null, h.[city]+'*',			iif(a.[city]		 <> h.[city],			a.[city]+'**',			a.[city]))			[city]

  from 
		[ndev].[tbl_TrackOne_MasterData] a
		left outer join
		[ndev].[tbl_TrackOne_MasterData_hist] h
		on		a.[email]	= h.[email]
			and a.ValidFrom = h.ValidTo


			SELECT * FROM (VALUES (1, 2), (3, 4), (5, 6), (7, 8), (9, 10) ) as mytable(a,b)

--
-- take last historical row/col 
--
select a.email
	 , coalesce(nullif(a.[first_name], '')	, h.[first_name])	[first_name]
	 , coalesce(nullif(a.[last_name], '')	, h.[last_name])	[last_name]
	 , coalesce(nullif(a.[street], '')		, h.[street])		[street]
	 , coalesce(nullif(a.[house_number], ''), h.[house_number])	[house_number]
	 , coalesce(nullif(a.[zip_code], '')	, h.[zip_code])		[zip_code]
	 , coalesce(nullif(a.[city], '')		, h.[city])			[city]

  from 
		[ndev].[tbl_TrackOne_MasterData] a
		left outer join
		[ndev].[tbl_TrackOne_MasterData_hist] h
		on		a.[email]	= h.[email]
			and a.ValidFrom = h.ValidTo


--
-- fill with the last valid historical column value 
--
select a.email
	 , coalesce(nullif(a.[first_name], '')	, coalesce(nullif(h.[first_name], '')+'*', (select top 1 [first_name] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and nullif([first_name], '') is not null order by ValidTo desc))+'x')		[first_name]
	 , coalesce(nullif(a.[last_name], '')	, coalesce(nullif(h.[last_name], '')+'*', (select top 1 [last_name] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and nullif([last_name], '') is not null order by ValidTo desc))+'x')		[last_name]
	 , coalesce(nullif(a.[street], '')	, coalesce(nullif(h.[street], '')+'*', (select top 1 [street] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and nullif([street], '') is not null order by ValidTo desc))+'x')		[street]
	 , coalesce(nullif(a.[house_number], ''), coalesce(nullif(h.[house_number], '')+'*', (select top 1 [house_number] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and  nullif([house_number], '') is not null order by ValidTo desc))+'x')		[house_number]
	 , coalesce(nullif(a.[zip_code], '')	, coalesce(nullif(h.[zip_code], '')+'*', (select top 1 [zip_code] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and nullif([zip_code], '') is not null order by ValidTo desc))+'x')		[zip_code]
	 , coalesce(nullif(a.[city], '')		, coalesce(nullif(h.[city], '')+'*', (select top 1 [city] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and  nullif([city], '') is not null order by ValidTo desc))+'x')		[city]

  from 
		[ndev].[tbl_TrackOne_MasterData] a
		left outer join
		[ndev].[tbl_TrackOne_MasterData_hist] h
		on		a.[email]	= h.[email]
			and a.ValidFrom = h.ValidTo

select a.email
	 , coalesce(nullif(a.[first_name], '')	, h.[first_name])	[first_name]
	 , coalesce(nullif(a.[last_name], '')	, h.[last_name])	[last_name]
	 , coalesce(nullif(a.[street], '')	, coalesce(nullif(h.[street], '')+'*', (select top 1 [street] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and nullif([street], '') is not null order by ValidTo desc))+'x')		[street]
	 , coalesce(nullif(a.[house_number], ''), coalesce(nullif(h.[house_number], '')+'*', (select top 1 [house_number] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and  nullif([house_number], '') is not null order by ValidTo desc))+'x')		[house_number]
	 , coalesce(nullif(a.[zip_code], '')	, h.[zip_code])		[zip_code]
	 , coalesce(nullif(a.[city], '')		, coalesce(nullif(h.[city], '')+'*', (select top 1 [city] from [ndev].[tbl_TrackOne_MasterData_hist] where [email] = a.[email] and  nullif([city], '') is not null order by ValidTo desc))+'x')		[city]

  from 
		[ndev].[tbl_TrackOne_MasterData] a
		left outer join
		[ndev].[tbl_TrackOne_MasterData_hist] h
		on		a.[email]	= h.[email]
			and a.ValidFrom = h.ValidTo


	select * FROM [ndev].[tbl_TrackOne_MasterData_hist] FOR SYSTEM_TIME ALL
			where [email] = 'nadja@gmail.coom'
				order by [VALIDTO] desc

	select * FROM [ndev].[tbl_TrackOne_MasterData] FOR SYSTEM_TIME ALL
			where [email] = 'enrika.rozenblium@gmail.coom'
				order by [VALIDTO] desc
	
SELECT [email], [first_name], [last_name], [street], [house_number], [zip_code], [city] FROM trackone_l



select * FROM [ndev].[tbl_TrackOne_MasterData_hist] 
			where [email] = 'nadja@gmail.coom'
				order by [VALIDTO] DESC
 

 --
 -- simple compare

DROP FUNCTION ndev.fn_ahc;
GO
CREATE FUNCTION ndev.fn_ahc (@ac NVARCHAR(200),
                            @hc NVARCHAR(200))
RETURNS NVARCHAR(200)
BEGIN
    DECLARE @rv NVARCHAR(200);

    SET @rv = CASE
                   WHEN CHECKSUM(@ac) = CHECKSUM(@hc) THEN NULL
                   ELSE IIF(@ac = '', NULL, @ac)END;

    RETURN @rv;
END;
GO




DELETE FROM ndev.tbl_C1_Interface_CustomerFlow
 WHERE ndev.tbl_C1_Interface_CustomerFlow.EMAIL IN (   SELECT email
                                            FROM [ndev].[tbl_TrackOne_MasterData] h
                                           WHERE h.email = 'nadja@gmail.coom' );
go

/*
WITH histset
  AS (SELECT TOP 1 *
        FROM [ndev].[tbl_TrackOne_MasterData_hist] h
       WHERE h.email = 'nadja@gmail.coom'
       ORDER BY h.ValidFrom DESC)
*/
WITH masterdata
  AS (SELECT *
        FROM [ndev].[tbl_TrackOne_MasterData] h
       WHERE h.email = 'nadja@gmail.coom'
       )
--INSERT INTO ndev.tbl_C1_Interface_CustomerFlow
SELECT            NEWID(),
                  a.email,
                  ndev.fn_ahc(a.title, h.title) TITLE,
                  ndev.fn_ahc(a.first_name, h.first_name) FIRST_NAME,
                  ndev.fn_ahc(a.last_name, h.last_name) LAST_NAME,
                  ndev.fn_ahc(a.birthday, h.birthday) BIRTHDAY,
                  ndev.fn_ahc(a.street, h.street) STREET,
                  ndev.fn_ahc(a.house_number, h.house_number) HOUSE_NUMBER,
                  ndev.fn_ahc(a.add_address, h.add_address) ADD_ADDRESS,
                  ndev.fn_ahc(a.zip_code, h.zip_code) ZIP_CODE,
                  ndev.fn_ahc(a.city, h.city) CITY,
                  ndev.fn_ahc(a.state, h.state) STATE,
                  ndev.fn_ahc(a.country, h.country) COUNTRY
  FROM            masterdata h
  LEFT OUTER JOIN [ndev].tbl_C1_Interface_CustomerFlow a
    ON a.email = h.email;

SELECT *
  FROM ndev.tbl_C1_Interface_CustomerFlow
 ORDER BY email,
          ts;


SELECT * FROM [ndev].[tbl_TrackOne_MasterData] FOR SYSTEM_TIME ALL WHERE email = 'nadja@gmail.coom' ORDER BY ValidTo desc
SELECT * FROM  ndev.tbl_C1_Interface_CustomerFlow FOR SYSTEM_TIME ALL WHERE email = 'nadja@gmail.coom' ORDER BY ValidTo desc
SELECT *FROM  ndev.tbl_C1_Interface_CustomerFlow_hist c1ih



		WHEN MATCHED THEN
			


			UPDATE SET t.[email]		= s.[email]
					 , t.[first_name]	= s.[first_name]
					 , t.[last_name]	= s.[last_name]
					 , t.[street]		= s.[street]
					 , t.[house_number]	= s.[house_number]
					 , t.[zip_code]		= s.[zip_code]
					 , t.[city]			= s.[city]

--
--	CDOE:
--	Creating the column selector for column-based delta set determination
--

SELECT UPPER(REPLACE('ndev.fn_ahc(a.CCCC,h.CCCC) CCCC', 'CCCC', column_name))
	 + iif (ORDINAL_POSITION < (SELECT MAX(ORDINAL_POSITION) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA= 'ndev' AND TABLE_NAME = 'tbl_TrackOne_MasterData' AND column_name NOT LIKE 'VALID%'), ',','')
  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA= 'ndev' AND TABLE_NAME = 'tbl_TrackOne_MasterData' AND column_name NOT LIKE 'VALID%' ORDER BY ORDINAL_POSITION;

--
--	CDOE:
--	Creating the column selector for column-based delta set determination
DECLARE @tableName    NVARCHAR(64)   = 'tbl_C1_Interface_CustomerFlow',
        @tableSchema  NVARCHAR(64)   = 'ndev',
		@alias		  NVARCHAR(32)	 = 'a',
        @columnstring NVARCHAR(2000) = NULL;

SELECT @columnstring
    = COALESCE(@columnstring, '') + QUOTENAME(UPPER(IIF(checksum(NULLIF(@alias,'')) <> 0, @alias+'.', '')+COLUMN_NAME))
      + IIF(
            ORDINAL_POSITION < (   SELECT MAX(ORDINAL_POSITION)
                                     FROM INFORMATION_SCHEMA.COLUMNS
                                    WHERE TABLE_SCHEMA = @tableSchema
                                      AND TABLE_NAME   = @tableName
                                      AND COLUMN_NAME NOT LIKE 'VALID%'),
            ',',
            '')
  FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA = @tableSchema
   AND TABLE_NAME   = @tableName
   AND COLUMN_NAME NOT LIKE 'VALID%'
 ORDER BY ORDINAL_POSITION;

SELECT @columnstring;

DECLARE @value NVARCHAR(100)= 'a'
SELECT NULLIF(ASCII(@value), '')



DECLARE 



SELECT            *
  FROM            [ndev].[tbl_TrackOne_MasterData] a
  LEFT OUTER JOIN [ndev].[tbl_TrackOne_MasterData_hist] h
    ON a.validfrom = h.validto
 WHERE            a.email = 'nadja@gmail.coom';

	order by [VALIDTO] desc
	



dbcc checkconstraints([ndev].[tbl_TrackOne_MasterData] )

select getdate()

select * from [ndev].[tbl_TrackOne_MasterData] where email = 'andrea@gmail.coom'
select * from [ndev].[tbl_TrackOne_MasterData_hist] where email = 'andrea@gmail.coom' order by validto desc

update [ndev].[tbl_TrackOne_MasterData] set title= 'Mrs.' where email = 'andrea@gmail.coom'


WITH TableA(Col1, Col2, Col3) 
     AS (SELECT 'Dog',1,1     UNION ALL 
         SELECT 'Cat',27,86   UNION ALL 
         SELECT 'Cat',128,92), 
     TableB(Col1, Col2, Col3) 
     AS (SELECT 'Dog',1,1     UNION ALL 
         SELECT 'Cat',27,105  UNION ALL 
         SELECT 'Lizard',83,NULL) 
SELECT CA.*
FROM   TableA A 
       FULL OUTER JOIN TableB B 
         ON A.Col1 = B.Col1 
            AND A.Col2 = B.Col2 
/*Unpivot the joined rows*/
CROSS APPLY (SELECT 'TableA' AS what, A.* UNION ALL
             SELECT 'TableB' AS what, B.*) AS CA     
/*Exclude identical rows*/
WHERE  EXISTS (SELECT A.* 
               EXCEPT 
               SELECT B.*) 
/*Discard NULL extended row*/
AND CA.Col1 IS NOT NULL      
ORDER BY CA.Col1, CA.Col2






CREATE TABLE dbo.TableA (
   Col1 varchar(10),
   Col2 int,
   Col3 int,
   Col4 varchar(10),
   Col5 varchar(10),
   Col6 varchar(10),
   Col7 varchar(10),
   Col8 varchar(10),
   Col9 varchar(10),
   Col10 varchar(10),
   Col11 varchar(10),
   Col12 varchar(10),
   Col13 varchar(10),
   Col14 varchar(10),
   Col15 varchar(10),
   Col16 varchar(10),
   Col17 varchar(10),
   Col18 varchar(10),
   Col19 varchar(10),
   Col20 varchar(10),
   Col21 varchar(10),
   Col22 varchar(10),
   Col23 varchar(10),
   Col24 varchar(10),
   Col25 varchar(10),
   Col26 varchar(10),
   Col27 varchar(10),
   Col28 varchar(10),
   Col29 varchar(10),
   Col30 varchar(10)
);

CREATE TABLE dbo.TableB (
   Col1 varchar(10),
   Col2 int,
   Col3 int,
   Col4 varchar(10),
   Col5 varchar(10),
   Col6 varchar(10),
   Col7 varchar(10),
   Col8 varchar(10),
   Col9 varchar(10),
   Col10 varchar(10),
   Col11 varchar(10),
   Col12 varchar(10),
   Col13 varchar(10),
   Col14 varchar(10),
   Col15 varchar(10),
   Col16 varchar(10),
   Col17 varchar(10),
   Col18 varchar(10),
   Col19 varchar(10),
   Col20 varchar(10),
   Col21 varchar(10),
   Col22 varchar(10),
   Col23 varchar(10),
   Col24 varchar(10),
   Col25 varchar(10),
   Col26 varchar(10),
   Col27 varchar(10),
   Col28 varchar(10),
   Col29 varchar(10),
   Col30 varchar(10)
);

INSERT dbo.TableA (Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15, Col16, Col17, Col18, Col19, Col20, Col21, Col22, Col23, Col24, Col25, Col26, Col27, Col28, Col29, Col30)
VALUES
   ('Cat', 27, 86, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Cat', 128, 92, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Porcupine', NULL, 42, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Tapir', NULL, NULL, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0')
;

INSERT dbo.TableB (Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15, Col16, Col17, Col18, Col19, Col20, Col21, Col22, Col23, Col24, Col25, Col26, Col27, Col28, Col29, Col30)
VALUES
   ('Cat', 27, 105, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Cat', 27, 87, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Lizard', 83, NULL, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Porcupine', NULL, 42, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0'),
   ('Tapir', NULL, NULL, 'a', 'b', 'c', 'd', 'e', 'f', 'g',' h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0');


SELECT
   Which = 'TableA',
   *
FROM (
   SELECT * FROM dbo.TableA
   EXCEPT
   SELECT * FROM dbo.TableB
) X
UNION ALL
SELECT
   'TableB',
   *
FROM (
   SELECT * FROM dbo.TableB
   EXCEPT
   SELECT * FROM dbo.TableA
) X
ORDER BY
   Col1, Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, Col10, Col11, Col12, Col13, Col14, Col15, Col16, Col17, Col18, Col19, Col20, Col21, Col22, Col23, Col24, Col25, Col26, Col27, Col28, Col29, Col30
;


drop table #tab1_audit

create table #tab1_audit
(
cls_run_id int,
prcs_dt datetime,
part_id int,
prdct_id char(15),

pay_clct_am numeric (19,9),
pstn_type_cd char(1),

ccy_cd char(3),
tick_val_am numeric (19,9),
tick_dnmtn_am numeric (19,9),
adt_ts datetime,
adt_user_id varchar(20),
adt_actn_cd char(2)
)


Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1002,'VEDF201112',-10800,'P','USD',0.25,10000,'4/8/11 1:18 AM','APADMIN','CO')
Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1002,'VEDF201112',-10800,'P','USD',0.25,10000,'4/8/11 10:29 AM','APADMIN','CO')
Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1002,'VEDF201112', -11880,'P','USD',0.25,10000,'4/8/11 10:29 AM','APADMIN','CN')
Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1002,'VEDF201112',-11880,'P','USD',0.25,10000,'4/8/11 11:04 PM','APADMIN','CO')
Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1002,'VEDF201112',-10,'P','INR',0.25,10000,'4/8/11 11:04 PM','APADMIN','CN')
Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1003,'VEDF201112',-110,'P','EUR',0.25,10000,'4/8/11 11:04 PM','APADMIN','CO')
Insert into #tab1_audit values (1,'4/6/11 12:00 AM',1003,'VEDF201111',-110,'P','USD',0.25,20000,'4/8/11 11:04 PM','APADMIN','CN')
Insert into #tab1_audit values (1,'9/9/18 12:00 AM',1004,'VEDF201118',-1,'P','USD',0.25,20000,'4/8/11 11:04 PM','APADMIN','CN')
Insert into #tab1_audit values (1,'9/10/18 12:00 AM',1004,'VEDF201118',-1,'P','USD',0.25,20000,'4/8/11 11:04 PM','APADMIN','CN')
Insert into #tab1_audit values (1,'9/10/18 12:00 AM',1004,'VEDF201118',-188,'P','CAN',0.23,20000,'4/8/11 11:04 PM','APADMIN','CO')


SELECT * FROM #tab1_audit
SELECT      t1.part_id,
            t1.adt_ts,
            CASE
                 WHEN t1.pay_clct_am = t2.pay_clct_am THEN 'unchanged'
                 ELSE 'old:' + CAST(t1.pay_clct_am AS VARCHAR(20)) + ', new:' + CAST(t2.pay_clct_am AS VARCHAR(20))END AS pay_clct_am,
            CASE
                 WHEN t1.ccy_cd = t2.ccy_cd THEN 'unchanged'
                 ELSE 'old:' + CAST(t1.ccy_cd AS VARCHAR(20)) + ', new:' + CAST(t2.ccy_cd AS VARCHAR(20))END AS ccy_cd
  FROM      #tab1_audit t1
 INNER JOIN #tab1_audit t2
    ON t1.part_id     = t2.part_id
   AND t1.adt_ts      = t2.adt_ts
   AND t1.adt_actn_cd = 'CO'
   AND t2.adt_actn_cd = 'CN'
 WHERE      (   t1.pay_clct_am <> t2.pay_clct_am
           OR   t1.ccy_cd <> t2.ccy_cd
           OR   t1.tick_val_am <> t2.tick_val_am
           OR   t1.pay_clct_am <> t2.pay_clct_am
           OR   t1.tick_dnmtn_am <> t2.tick_dnmtn_am);


