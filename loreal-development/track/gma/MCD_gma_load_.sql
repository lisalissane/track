USE MCD_REPORTINGGO

IF EXISTS( SELECT 1	FROM sys.procedures WHERE OBJECT_ID = OBJECT_ID('dbo.prc_MCCCH_powershell_preparecsv')
		 ) DROP PROCEDURE dbo.prc_MCCCH_powershell_preparecsv;	
GO	
create procedure dbo.prc_MCCCH_powershell_preparecsv
	(	@baseFile			NVARCHAR(250)	= '\\DESKTOP-0TIC911\Users\nadja\Documents\tableau_dashboard_data\raw_data\offers-20181021.csv'   
	,	@filePostix			NVARCHAR(32)	= '_converted.csv'
	,	@delimiterIN		NVARCHAR(10)	= '|'
	,	@delimiterOUT		NVARCHAR(10)    = '|'
	,	@filePreProcessed	NVARCHAR(250)	OUTPUT
	) 
	as declare		
		@cmd           NVARCHAR(4000)			
	BEGIN
		--
		-- reconfigure necessary stuff
		EXEC sp_configure 
			 'show advanced options', 
			 1;
		RECONFIGURE;
		EXEC sp_configure 
			 'xp_cmdshell', 
			 1;
		RECONFIGURE;
		
		SET @filePreProcessed = @baseFile+@filePostix;
		SET @cmd = 'powershell "Import-csv -path '+@baseFile+' -encoding UTF8 -Delimiter '''+@delimiterIN+''' | Export-CSV -path '+@filePreProcessed+' -Delimiter '''+@delimiterOUT+''' -encoding UTF8 -NoType " ';
		--PRINT @cmd;
		EXEC master..xp_cmdshell
			 @cmd , NO_OUTPUT;

	END;
go

IF EXISTS( SELECT 1	FROM sys.procedures WHERE OBJECT_ID = OBJECT_ID('dbo.prc_MCD_gma_customerload_csv')
		 ) DROP PROCEDURE dbo.prc_MCD_gma_customerload_csv;	
GO	
create procedure dbo.prc_MCD_gma_customerload_csv
	(	@mccBbaseFile		NVARCHAR(250)	= '\\DESKTOP-0TIC911\Users\nadja\Documents\tableau_dashboard_data\gma\customerID_000000000000r.csv'
	,	@formatFile			NVARCHAR(250)   = '\\DESKTOP-0TIC911\Users\nadja\Documents\tableau_dashboard_data\gma\'
	,	@filePreProcessed   NVARCHAR(250)	OUTPUT
	,	@delimiterIN		NVARCHAR(10)	= ','
	,	@delimiterOUT		NVARCHAR(10)    = ','
	,	@firstRow			NVArCHAR(3)		= 2
	,	@targetTable		NVARCHAR(250)	= 'dbo.MCC_ST_Offers_001'
	) 
	as declare		
		@cmd					NVARCHAR(4000)	
	,	@cSQL					NVARCHAR(max)	
	,	@delimiterTitelParser	NVARCHAR(10)= '='		
	BEGIN
		--
		-- reconfigure necessary stuff
		EXEC sp_configure 
			 'show advanced options', 
			 1;
		RECONFIGURE WITH OverRide;
		EXEC sp_configure 
			 'xp_cmdshell', 
			 1;
		RECONFIGURE WITH OverRide;
		EXEC sp_configure 
			'Ad Hoc Distributed Queries', 
			1;
		RECONFIGURE WITH OverRide;


		exec dbo.prc_MCCCH_powershell_preparecsv 
			@baseFile			= @mccBbaseFile
		  ,	@delimiterIN		= @delimiterIN
		  ,	@delimiterOUT		= @delimiterOUT
		  , @filePreProcessed	= @filePreProcessed OUTPUT


		set @cSQL =
		'
		insert into    '+@targetTable+' 
		   (businessDay,
			saleDate,
			saleTime,
			saleHH,
			saleMM,
			saleSS,
			tenderPOS,
			orderKey,
			CustomerID,
			Head_offerID,
			Head_PromotionID,
			Head_PromotionName,
			orderID,
			storeNr,
			saleStatus,
			transactionKind,
			pod,
			takeID,
			isPOSRedirect,
			isTableDelivery,
			totalAmount,
			bdTotalAmount,
			totalTaxAmount,
			DiscountAmount,
			ItemForExtraction,
			productCode,
			description,
			dtName,
			Item_PromotionID,
			quantity,
			quantitySold,
			quantityPromo,
			unitPrice,
			adUnitPrice,
			totalPrice,
			adTotalPrice,
			totalTax,
			netPrice,
			itemLevel,
			itemCode,
			prodAction,
			isGrillLine,
			taxID,
			taxRate,
			voucherPosition) 					
		select  		  
		    replace(businessDay, ''"'',''''),
			saleDate,
			saleTime,
			saleHH,
			saleMM,
			saleSS,
			tenderPOS,
			orderKey,
			CustomerID,
			Head_offerID,
			Head_PromotionID,
			Head_PromotionName,
			orderID,
			storeNr,
			saleStatus,
			transactionKind,
			pod,
			takeID,
			isPOSRedirect,
			isTableDelivery,
			totalAmount,
			bdTotalAmount,
			totalTaxAmount,
			DiscountAmount,
			ItemForExtraction,
			productCode,
			description,
			dtName,
			Item_PromotionID,
			quantity,
			quantitySold,
			quantityPromo,
			unitPrice,
			adUnitPrice,
			totalPrice,
			adTotalPrice,
			totalTax,
			netPrice,
			itemLevel,
			itemCode,
			prodAction,
			isGrillLine,
			taxID,
			taxRate,
			replace(voucherPosition, ''"'','''')
				from OPENROWSET( BULK         '''+@filePreProcessed+''', 
								 FORMATFILE   = '''+@formatFile+'''
							   , FIRSTROW     = '  +@firstRow+'
							   , MAXERRORS    = 10000
							   , CODEPAGE     = ''65000''
							   ) gma_customer_csv
	
		 ';
		 print @cSQL;
		 EXEC SP_EXECUTESQL @cSQL;
		
	END;
go


IF EXISTS( SELECT 1	FROM sys.procedures WHERE OBJECT_ID = OBJECT_ID('dbo.prc_MCD_gma_customerload')
		 ) DROP PROCEDURE dbo.prc_MCD_gma_customerload;	
GO	
CREATE PROCEDURE prc_MCD_gma_customerload
	(	@path NVARCHAR(512) = '\\DESKTOP-0TIC911\Users\nadja\Documents\tableau_dashboard_data\gma'
	)
	 AS DECLARE -- types
	 	@mcc_file_to_table_mapping TABLE 
			(	fixed_name_part varchar(255), 
				tablename       varchar(255),
				typ 		    varchar(16),		
				firstrow		int,
				fieldterminator varchar(3) default  ','
			);
	 
		Declare -- variables
		@filename	VARCHAR(255),
		@sql		VARCHAR(max), 
		@cmd		VARCHAR(1000), 
		@archive	VARCHAR(512),
		@iid		int,
		@state		int
		
     BEGIN			
        
		
         IF NOT EXISTS ( SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('dbo.tbl_MCD_gma_customer_loadings')
                       ) CREATE TABLE tbl_MCD_gma_customer_loadings
							(	  iid		 int identity,
								  filepath   VARCHAR(255) DEFAULT NULL, 
								  filename   VARCHAR(255), 
								  importdate DATETIME2(6) DEFAULT SYSDATETIME(), 
								  state      INT DEFAULT 0
							 );


		 -- static config
		 --
		 insert into @mcc_file_to_table_mapping
				(fixed_name_part, tablename                          , typ  , firstrow)
		 values ('customerID_'  ,'dbo.gma_customer', 'D'  , 2);
				

		select * from @mcc_file_to_table_mapping;


		 --
		 -- configure and enable shell execution
         EXEC sp_configure 
              'show advanced options', 
              1;
         RECONFIGURE;
         EXEC sp_configure 
              'xp_cmdshell', 
              1;
         RECONFIGURE;

         --
         --get the list of files to process:

         SET @path = @path+'\';
         SET @cmd = 'dir "'+@path+'"*.csv "'+@path+'"*.psv "'+@path+'"*.xlsx /b';
         PRINT(@cmd);
         INSERT INTO dbo.tbl_MCD_gma_customer_loadings(filename)
         EXEC Master..xp_cmdShell 
              @cmd;

         UPDATE dbo.tbl_MCD_gma_customer_loadings
           SET 
               filepath = @path
         WHERE filepath IS NULL;

		 DELETE FROM dbo.tbl_MCD_gma_customer_loadings
         WHERE filename IS NULL or (filename not like '%.csv%' and filename not like '%.psv%' and filename not like '%.xlsx%') ;


         --select * from tbl_GMA_Export_Promotions_files

         SET @archive = '"'+@path+'"\Archive\'+
						 (
							 SELECT CONVERT(NVARCHAR(20), GETDATE(), 112)
						 )+'\';

		 --
         --cursor loop
         DECLARE c1 CURSOR
         FOR SELECT iid,
					filepath, 
                    filename
             FROM  dbo.tbl_MCD_gma_customer_loadings 
             WHERE (filename LIKE '%.csv%' or filename LIKE '%.psv%'  or filename LIKE '%.xlsx%')
			   AND state = 0
			   ;

         OPEN c1;
         FETCH NEXT FROM c1 INTO @iid, @path, @filename;
         WHILE @@fetch_status <> -1
             BEGIN
				print(@filename)		   
			    select 
					 @sql = 
					 '
					
					begin declare @filePreProcessed nvarchar(255);

						exec dbo.prc_MCD_gma_customerload_csv 
								@mccBbaseFile = '''+@path+@filename+'''
							,   @formatFile   = '''+@path+'\gma_customers.xml''
							,   @targetTable  = '''+tablename+'''
							, @filePreProcessed= @filePreProcessed OUT;

					end
					
					 '
				 from @mcc_file_to_table_mapping 
					where patindex(fixed_name_part+'%', @filename) > 0
				 ;

              
				 print @sql;
                 EXEC (@sql);


	 			 IF (@@ROWCOUNT > 0) 
						set @state = 1
				 ELSE	set @state = -1	

				 update tbl_MCD_gma_customer_loadings 
						set state = @state where iid = @iid

				 ----
				 ---- file system operations (create direcory if it's not exist and move 
				 ---- datafiles afterwards into
                 SET @cmd = 'mkdir '+@archive;
                 EXEC Master..xp_cmdShell 
                      @cmd;

                 SET @cmd = 'move "'+@path+@filename+'*" '+@archive;
                 PRINT('move='+@cmd);
                 EXEC Master..xp_cmdShell 
                      @cmd;

	             FETCH NEXT FROM c1 INTO @iid, @path, @filename;
             END;
         CLOSE c1;
         DEALLOCATE c1;
     END;
GO


-- exec prc_MCD_gma_customerload '\\DESKTOP-0TIC911\Users\nadja\Documents\tableau_dashboard_data\gma'

