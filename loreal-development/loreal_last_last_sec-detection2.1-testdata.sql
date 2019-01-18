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
		'nadja',
		'theuer',
		'seidenhofstrasse',
		'111',
		'1070',
		'wien'
	)  
	
SELECT * FROM [nstage].[tbl_TrackOne_MasterData]	;

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