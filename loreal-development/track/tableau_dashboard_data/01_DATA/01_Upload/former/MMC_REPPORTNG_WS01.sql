
--
-- enabling feature of SSDS STRING_SPLIT
--
ALTER DATABASE MCC_Reporting SET COMPATIBILITY_LEVEL = 130
GO

-- 
-- needed stageuff setup
if OBJECT_ID('dbo.MCC_SalesHeaders_Plexure_v00', 'U') 
	is not null drop table dbo.MCC_SalesHeaders_Plexure_v00
go
if OBJECT_ID('dbo.MCC_SalesDetails_Plexure_v00', 'U') 
	is not null drop table dbo.MCC_SalesDetails_Plexure_v00
go
if OBJECT_ID('dbo.MCC_SalesHeaders_TDA_v00', 'U') 
	is not null drop table dbo.MCC_SalesHeaders_TDA_v00
go
if OBJECT_ID('dbo.MCC_SalesDetails_TDA_v00', 'U') 
	is not null drop table dbo.MCC_SalesDetails_TDA_v00
go

if OBJECT_ID('dbo.MCC_BatchMaster', 'U') 
	is not null drop table dbo.MCC_BatchMaster
go

drop sequence if exists dbo.batchid;
go
create sequence dbo.batchid
	start with 1
	increment by 1;
go

--
-- table stageructure setup

-- 
-- master data
--

-- +++++++++++++++++++++++++++
-- products
-- +++++++++++++++++++++++++++
if OBJECT_ID('dbo.MCC_Products_001', 'U') 
	is not null 
		alter table MCC_Products_001 set (system_versioning = off)
		drop table dbo.MCC_Products_001
		if OBJECT_ID('dbo.MCC_Products_001_history', 'U') 
			is not null drop table dbo.MCC_Products_001_history

go
select top 0 stage.*
	into MCC_Products_001 from MCC_ST_Products_001 stage
go
alter table MCC_Products_001
	alter column ProductCode nvarchar(255) not null

go
alter table MCC_Products_001
	alter column Category nvarchar(255) not null
go
alter table MCC_Products_001
	add primary key (ProductCode, Category);
go
alter table MCC_Products_001 
	add 
		ValidFrom datetime2 
			generated always as row start hidden not null,
		ValidTo datetime2 
			generated always as row end hidden not null,
		Period 
			for system_time(ValidFrom, ValidTo)
go	
alter table MCC_Products_001 
	set (system_versioning = on
			( history_table = dbo.MCC_Products_001_history,
			  data_consistency_check = on	
			)
		)
go	

-- +++++++++++++++++++++++++++
-- offers
-- +++++++++++++++++++++++++++
if OBJECT_ID('dbo.MCC_Offers_001', 'U') 
	is not null 
		alter table dbo.MCC_Offers_001 
			set (system_versioning = off)
		drop table dbo.MCC_Offers_001
		if OBJECT_ID('dbo.MCC_Offers_001_history', 'U') 
			is not null drop table dbo.MCC_Offers_001_history

go
select top 0 stage.*, cast(null as nvarchar(128)) as e1,
					  cast(null as nvarchar(128)) as e2,
					  cast(null as nvarchar(128)) as e3,
					  cast(null as nvarchar(128)) as e4,
					  cast(null as nvarchar(128)) as e5,
					  cast(null as nvarchar(128)) as e6
	into MCC_Offers_001 from MCC_ST_Offers_001 stage
go
alter table MCC_Offers_001
	alter column Id nvarchar(255) not null
go
alter table MCC_Offers_001
	alter column CampaignId nvarchar(255) not null
go
alter table MCC_Offers_001
	add primary key (Id, CampaignId);
go

alter table MCC_Offers_001 
	add 
		ValidFrom datetime2 
			generated always as row start hidden not null,
		ValidTo datetime2 
			generated always as row end hidden not null,
		Period 
			for system_time(ValidFrom, ValidTo)
go	
alter table MCC_Offers_001 
	set (system_versioning = on
			( history_table = dbo.MCC_Offers_001_history,
			  data_consistency_check = on	
			)
		)
go	


--
-- motion facts
--
if OBJECT_ID('dbo.MCC_SalesHeaders_Plexure_v00', 'U') 
	is not null drop table dbo.MCC_SalesHeaders_Plexure_v00
go
if OBJECT_ID('dbo.MCC_SalesDetails_Plexure_v00', 'U') 
	is not null drop table dbo.MCC_SalesDetails_Plexure_v00
go
if OBJECT_ID('dbo.MCC_SalesHeaders_TDA_v00', 'U') 
	is not null drop table dbo.MCC_SalesHeaders_TDA_v00
go
if OBJECT_ID('dbo.MCC_SalesDetails_TDA_v00', 'U') 
	is not null drop table dbo.MCC_SalesDetails_TDA_v00
go

if OBJECT_ID('dbo.MCC_BatchMaster', 'U') 
	is not null drop table dbo.MCC_BatchMaster
go
create table MCC_BatchMaster (
	batchid		bigint not null primary key default next value for dbo.batchid,
	runtime_ts	datetime default SYSUTCDATETIME(),
	source		nvarchar(64) default null,
	job_name	nvarchar(64) default null
	)
go
--
--
if OBJECT_ID('dbo.MCC_SalesHeaders_Plexure_v00', 'U') 
	is not null drop table dbo.MCC_SalesHeaders_Plexure_v00
go
select top 0 stage.*, cast(null as nvarchar(128)) as e1,
					  cast(null as nvarchar(128)) as e2,
					  cast(null as nvarchar(128)) as e3,
				  	  cast(0 as bigint) as BatchId
	into MCC_SalesHeaders_Plexure_v00 from MCC_ST_SalesHeaders_Plexure stage
go
alter table MCC_SalesHeaders_Plexure_v00 
	add constraint fk_MCC_SalesHeaders_Plexure_v00_batchid 
		foreign key(batchid)
				references dbo.MCC_BatchMaster(batchid)
				on delete cascade
				on update cascade
go


if OBJECT_ID('dbo.MCC_SalesDetails_Plexure_v00', 'U') 
	is not null drop table dbo.MCC_SalesDetails_Plexure_v00
go
select top 0 stage.*, cast(null as nvarchar(128)) as e1,
					  cast(null as nvarchar(128)) as e2,
					  cast(null as nvarchar(128)) as e3,
				  	  cast(0 as bigint) as BatchId
	into MCC_SalesDetails_Plexure_v00 from MCC_ST_SalesDetails_Plexure stage
go
alter table MCC_SalesDetails_Plexure_v00 
	add constraint fk_MCC_SalesDetails_Plexure_v00_batchid 
		foreign key(batchid)
				references dbo.MCC_BatchMaster(batchid)
				on delete cascade
				on update cascade
go

if OBJECT_ID('dbo.MCC_SalesHeaders_TDA_v00', 'U') 
	is not null drop table dbo.MCC_SalesHeaders_TDA_v00
go
select top 0 stage.*, cast(0 as bigint) as BatchId
	into MCC_SalesHeaders_TDA_v00 from MCC_ST_SalesHeaders_TDA stage
go
alter table MCC_SalesHeaders_TDA_v00 
	add constraint fk_MCC_SalesHeaders_TDA_v00_batchid 
		foreign key(batchid)
				references dbo.MCC_BatchMaster(batchid)
				on delete cascade
				on update cascade
go

if OBJECT_ID('dbo.MCC_SalesDetails_TDA_v00', 'U') 
	is not null drop table dbo.MCC_SalesDetails_TDA_v00
go
select top 0 stage.*, cast(0 as bigint) as BatchId
	into MCC_SalesDetails_TDA_v00 from MCC_ST_SalesDetails_TDA stage
go
alter table MCC_SalesDetails_TDA_v00 
	add constraint fk_MCC_SalesDetails_TDA_v00_batchid 
		foreign key(batchid)
				references dbo.MCC_BatchMaster(batchid)
				on delete cascade
				on update cascade
go




/*** DATA IMPORT SECTION
***/


--
-- transfer masterdate from stageageing to workspace tables
--


-- 
-- insert product master data
--
begin transaction
begin try
	insert into MCC_Products_001 
		select stage.* from MCC_ST_Products_001 stage
	commit transaction
end try 
begin catch
	rollback transaction
end catch
go

--
-- insert offers master data
--
begin transaction
begin try
	insert into MCC_Offers_001 
		-- 
		-- exdtracting data from titel field and store values as 
		-- separeted columns
		select stage.*, extracted_columns.*  from MCC_ST_Offers_001 stage
			cross apply (	select b.[e1], b.[e2], b.[e3], b.[e4], b.[e5], b.[e6]
								from (SELECT ('e'+cast(row_number() over (order by (select 100)) as varchar)) idx, value
											FROM STRING_SPLIT(stage.title,  '|') WHERE RTRIM(value) <> ''
										) a pivot (max(value)	for idx in ([e1], [e2], [e3], [e4],  [e5], [e6])) b
						) as extracted_columns
	commit transaction
end try 
begin catch
	rollback transaction
end catch
go



/*
select stage.ProductCode, count(distinct ProductCode) 
	from MCC_ST_Products_001 stage
		group by ProductCode 
		having count(ProductCode) > 1

select * from MCC_Products_001
	where productcode = '8305'
*/

--
-- generate set for batchrun


insert into MCC_BatchMaster (source) values ('nadja');
declare @current_batchid bigint = (select max(batchid) from MCC_BatchMaster)

--
-- transfer payload to targets
begin transaction
begin try
	insert into MCC_SalesHeaders_Plexure_v00 
		--select stage.*, @current_batchid from MCC_ST_SalesHeaders_Plexure stage
		select stage.*, extracted_columns.*, @current_batchid from MCC_ST_SalesHeaders_Plexure stage
			cross apply (	select b.[e1], b.[e2], b.[e3]
								from (SELECT ('e'+cast(row_number() over (order by (select 100)) as varchar)) idx, value
											FROM STRING_SPLIT(stage.saleid,  ':') WHERE RTRIM(value) <> ''
										) a pivot (max(value)	for idx in ([e1], [e2], [e3])) b
						) as extracted_columns


	insert into MCC_SalesDetails_Plexure_v00 
		--select stage.*, @current_batchid from MCC_ST_SalesDetails_Plexure stage
		select stage.*, extracted_columns.*, @current_batchid from MCC_ST_SalesDetails_Plexure stage
			cross apply (	select b.[e1], b.[e2], b.[e3]
								from (SELECT ('e'+cast(row_number() over (order by (select 100)) as varchar)) idx, value
											FROM STRING_SPLIT(stage.saleid,  ':') WHERE RTRIM(value) <> ''
										) a pivot (max(value)	for idx in ([e1], [e2], [e3])) b
						) as extracted_columns

	insert into MCC_SalesHeaders_TDA_v00 
		select stage.*, @current_batchid from MCC_ST_SalesHeaders_TDA stage

	insert into MCC_SalesDetails_TDA_v00 
		select stage.*, @current_batchid from MCC_ST_SalesDetails_TDA stage
		
	commit transaction
end try 
begin catch
	rollback transaction
end catch

go



500 005 752



select * from MCC_BatchMaster

select o.id+500000000, o.* from MCC_Offers_001 o
select * from MCC_Products_001
select * from MCC_SalesHeaders_Plexure_v00 order by OfferId
select * from MCC_SalesDetails_Plexure_v00
select * from MCC_SalesHeaders_TDA_v00
select * from MCC_SalesDetails_TDA_v00


--
-- view 1

create view reporting.V_MCC_tableau_resultset1
as
with ds as
(
select
	plxh.[DateOccurred]					as [Date],
	plxh.[ConsumerId]					as ConsumerId,
	plxh.e2								as SaleId,
	plxh.[TotalAmount]					as PaidAmount,
	plxh.OfferIds						as OfferId,
	right(plxh.[ExternalVenueId], 3)	as StoreId,
	tdah.[RegisterType]					as RegisterType,
	tdah.BatchId						as TakeId,
	tdah.[TotalAmount]					as TotalAmount,
	tdah.[DiscountAmount]				as DiscountAmount,
	plxo.e2								as OfferName,
	plxo.e3								as OfferPrice,
	-- calculated itemstotal
	-- calculatex items include	
	plxd.[Quantity]						as Quantity
	from 
			dbo.MCC_SalesHeaders_Plexure_v00 plxh
		  inner join
			dbo.MCC_SalesDetails_Plexure_v00 plxd
				on		plxh.e2		  = plxd.e2
					and plxh.OfferIds = plxd.OfferId
		  inner join
	  		dbo.MCC_Offers_001 plxo
				on		(plxo.id+500000000)  = plxh.OfferIds
					and	(plxo.id+500000000)  = plxd.OfferId	
		  inner join
			dbo.MCC_Products_001 products
				on		products.ProductCode =plxd.ProductCode
		  inner join
			dbo.MCC_SalesHeaders_TDA_v00 tdah
				on		tdah.orderNumber = plxh.e2
					and tdah.orderNumber = plxd.e2
)
select	ds.*,
		(select sum(cast(ds1.Quantity as integer)) 
			from ds ds1 
				where ds1.SaleId = ds.SaleId group by ds1.SaleId) as ItemTotal, 
		(select count(cast(ds1.Offerid as integer)) 
			from ds ds1 
				where ds1.SaleId = ds.SaleId and ds1.OfferId <> 0  group by ds1.SaleId) as ItemInclude		
		from ds


select * from reporting.V_MCC_tableau_resultset1

select * from mcc_reporting..V_MCC_tableau_resultset1
select * from mcc_reporting..V_MCC_tableau_resultset2


--
-- view 2

create view reporting.V_MCC_tableau_resultset2
as
select	
	plxd.e2								as SaleId,
	plxd.OfferId						as OfferId,
	plxd.[ProductCode]					as ProductCode,
	plxd.[Quantity]						as Quantity,
	products.[Category]					as Category,
	products.Combo						as Combo,
	products.Size						as Size,
	products.Name						as Name,
	products.ProductRange				as Productrange
	from 
		dbo.MCC_SalesHeaders_Plexure_v00 plxh
	  inner join
		dbo.MCC_SalesDetails_Plexure_v00 plxd
			on		plxh.e2		  = plxd.e2
				and plxh.OfferIds = plxd.OfferId
	  inner join
	  	dbo.MCC_Offers_001 plxo
			on		(plxo.id+500000000)  = plxh.OfferIds
				and	(plxo.id+500000000)  = plxd.OfferId	
	  inner join
		dbo.MCC_Products_001 products
			on		products.ProductCode =plxd.ProductCode
	  inner join
		dbo.MCC_SalesHeaders_TDA_v00 tdah
			on		tdah.orderNumber = plxh.e2
			    and tdah.orderNumber = plxd.e2


update MCC_Offers_001 set id =5272 where id = 5778
update MCC_Offers_001 set id =5275 where id = 5594
update MCC_Offers_001 set id =5285 where id = 5449
update MCC_Offers_001 set id =5752 where id = 5682

500005272
500005275
500005285
500005752

select * from [dbo].[MCC_SalesDetails_Plexure_v00]
		
			
-- /*** workspace area -----------------------------------------------------------------------------------------
-- ***/	

/*
select b.[e1], b.[e2], b.[e3], b.[e4], b.[e5], b.[e6]
	from (SELECT ('e'+cast(row_number() over (order by (select 100)) as varchar)) idx, value
				FROM STRING_SPLIT('20180430|1_MM_Big_Mac_1_Mc_Flurry|13.00|beef', '|') WHERE RTRIM(value) <> ''
			) a pivot (max(value)	for idx in ([e1], [e2], [e3], [e4],  [e5], [e6])) b

select offers.id, extracted_columns.*  from [dbo].[MCC_Offers_001] as offers
	cross apply (	select b.[e1], b.[e2], b.[e3], b.[e4], b.[e5], b.[e6]
						from (SELECT ('e'+cast(row_number() over (order by (select 100)) as varchar)) idx, value
									FROM STRING_SPLIT(offers.title,  '|') WHERE RTRIM(value) <> ''
								) a pivot (max(value)	for idx in ([e1], [e2], [e3], [e4],  [e5], [e6])) b
				) as extracted_columns



	) as   value_sets


ALTER DATABASE MCC_Reporting SET COMPATIBILITY_LEVEL = 130
GO
   
*/



select * from reporting.V_MCC_tableau_resultset2