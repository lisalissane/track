
--
-- temporär anstelle der methode zum aufbau des exportsates
-- erstellen einer view
--

create view tbl_C1_Interface_CustomerFlow_exportfile
as
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
go


-- step-1
-- initiale beladung des testaufbaus
--
truncate table [nstage].[tbl_TrackOne_MasterData]  
DBCC CHECKIDENT ('nstage.tbl_TrackOne_MasterData', RESEED, 1);  
GO

insert into  [nstage].[tbl_TrackOne_MasterData] 
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
		'düsseldorf', '10.10.1885', null 
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
	-- beladen der tabellen für masterdata, delta und export
	--
exec process_TrackOne_deltaCalculation
exec process_TrackOne_MasterData
--exec process_C1_Interface_FileExport

	-- prüfen des exportsates(mit der eingangs erstellten view
select * from tbl_C1_Interface_CustomerFlow_exportfile
	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]


--
-- a
WITH combind_staging
     AS (SELECT TOP 100 PERCENT [bseqid], 
                                [EMAIL], 
                                [MARKET], 
                                [BRAND], 
                                COALESCE(NULLIF([TITLE], ''),
         (
             SELECT TOP 1 [TITLE]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([TITLE], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [TITLE], 
                                COALESCE(NULLIF([FIRST_NAME], ''),
         (
             SELECT TOP 1 [FIRST_NAME]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([FIRST_NAME], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [FIRST_NAME], 
                                COALESCE(NULLIF([LAST_NAME], ''),
         (
             SELECT TOP 1 [LAST_NAME]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([LAST_NAME], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [LAST_NAME], 
                                COALESCE(NULLIF([BIRTHDAY], ''),
         (
             SELECT TOP 1 [BIRTHDAY]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([BIRTHDAY], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [BIRTHDAY], 
                                COALESCE(NULLIF([STREET], ''),
         (
             SELECT TOP 1 [STREET]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([STREET], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [STREET], 
                                COALESCE(NULLIF([HOUSE_NUMBER], ''),
         (
             SELECT TOP 1 [HOUSE_NUMBER]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([HOUSE_NUMBER], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [HOUSE_NUMBER], 
                                [ADD_ADDRESS], 
                                COALESCE(NULLIF([ZIP_CODE], ''),
         (
             SELECT TOP 1 [ZIP_CODE]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([ZIP_CODE], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [ZIP_CODE], 
                                COALESCE(NULLIF([CITY], ''),
         (
             SELECT TOP 1 [CITY]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([CITY], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [CITY], 
                                COALESCE(NULLIF([STATE], ''),
         (
             SELECT TOP 1 [STATE]
             FROM [nstage].[tbl_TrackOne_MasterData]
             WHERE [email] = s.[email]
                   AND NULLIF([STATE], '') IS NOT NULL
             ORDER BY [bseqid] DESC
         )) [STATE], 
                                COALESCE(NULLIF([COUNTRY], ''),
         (
             SELECT TOP 1 [COUNTRY]
             FROM [nstage].[tbl_TrackOne_MasterData]
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
					



SELECT [bseqid], 
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
FROM [nstage].[tbl_TrackOne_MasterData] s
WHERE [bseqid] =
(
    SELECT MAX([bseqid])
    FROM [nstage].[tbl_TrackOne_MasterData]
    WHERE [EMAIL] = s.[EMAIL]
          AND [MARKET] = s.[MARKET]
          AND [BRAND] = s.[BRAND]
)
ORDER BY [bseqid] desc, 
                  email, 
                  brand, 
                  market




WITH tc
     AS (SELECT TOP 100 PERCENT [EMAIL], 
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
         FROM [nstage].[tbl_TrackOne_MasterData] s
         ORDER BY [bseqid] desc, 
                  email, 
                  brand, 
                  market)
     SELECT [EMAIL], 
            [MARKET], 
            [BRAND], 
            MAX([TITLE]) [TITLE], 
            MAX([FIRST_NAME]) [FIRST_NAME], 
            MAX([LAST_NAME]) [LAST_NAME], 
            MAX([BIRTHDAY]) [BIRTHDAY], 
            MAX([STREET]) [STREET], 
            MAX([HOUSE_NUMBER]) [HOUSE_NUMBER], 
            MAX([ADD_ADDRESS]) [ADD_ADDRESS], 
            MAX([ZIP_CODE]) [ZIP_CODE], 
            MAX([CITY]) [CITY], 
            MAX([STATE]) [STATE], 
            MAX([COUNTRY]) [COUNTRY]
     FROM tc
     GROUP BY [EMAIL], 
              [MARKET], 
              [BRAND];
--
-- step-2
-- exempl. change [last_name]  friedrich -> theuer
declare @cdatetime2 datetime2= sysdatetime();

truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'',
		'theuer',
		'bergstrasse',
		'',
		'8020',
		'graz', @cdatetime2
	)



	--
	-- beladen der tabellen für masterdata, delta und export
	--
exec process_TrackOne_deltaCalculation
exec process_TrackOne_MasterData
--exec process_C1_Interface_FileExport

	-- prüfen des exportsates(mit der eingangs erstellten view
	-- a) Export: darf nur den surename enthlten
	-- b) Masterdate: enthält das update des feldes [last_name] 
select * from tbl_C1_Interface_CustomerFlow_exportfile

	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]	  

			 
--
-- step-2a
-- exempl. change [last_name] delete one
declare @cdatetime2 datetime2= sysdatetime();

truncate table [nstage].[tbl_TrackOne_MasterData]  
insert into  [nstage].[tbl_TrackOne_MasterData] 
	(	[email], [brand], [market], [first_name], [last_name], [street], [house_number], [zip_code], [city], LOADTS
	) values
	(	'nadja@gmail.com',
		'LOREAL',
		'AT',
		'',
		'theuer',
		'bergstrasse',
		'59',
		'8020',
		'graz', @cdatetime2
	)

	--
	-- beladen der tabellen für masterdata, delta und export
	--
exec process_TrackOne_deltaCalculation
exec process_TrackOne_MasterData
--exec process_C1_Interface_FileExport

	-- prüfen des exportsates(mit der eingangs erstellten view
	-- a) Export: darf nur den surename enthlten
	-- b) Masterdate: enthält das update des feldes [last_name] 
select * from tbl_C1_Interface_CustomerFlow_exportfile

	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]


--
-- step-3
-- exempl. change [last_name]
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
	-- beladen der tabellen für masterdata, delta und export
	--
exec process_TrackOne_deltaCalculation
exec process_TrackOne_MasterData
--exec process_C1_Interface_FileExport

	-- prüfen des exportsates(mit der eingangs erstellten view
	-- a) Export: darf nur den surename enthlten
	-- b) Masterdate: enthält das update des feldes [last_name] 
select * from tbl_C1_Interface_CustomerFlow_exportfile

	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]	  


--
--	step-4
--	change surname(same pk, same changed value)birthday
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
	-- beladen der tabellen für masterdata, delta und export
	--
exec process_TrackOne_deltaCalculation
exec process_TrackOne_MasterData
--exec process_C1_Interface_FileExport

	-- prüfen des exportsates(mit der eingangs erstellten view
	--  a) no action musst be performed on the surname filed, 
	--  b) but the change of the birthday filed musst be reportet
select * from tbl_C1_Interface_CustomerFlow_exportfile

	-- check staging
select * from [nstage].[tbl_TrackOne_MasterData]
	-- check master (update)
select * from [ndev].[tbl_TrackOne_MasterData]
	-- check recurrent_flow delta-tab(insert only changes)
select * from [ndev].[tbl_C1_Interface_CustomerFlow]	  

