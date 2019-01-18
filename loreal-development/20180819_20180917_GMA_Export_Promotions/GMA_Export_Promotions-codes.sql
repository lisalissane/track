USE MCC_REPORTING

IF EXISTS
(
	SELECT 1
	FROM INFORMATION_SCHEMA.TABLES
	WHERE UPPER(TABLE_NAME) = UPPER('tbl_GMA_Export_Promotions_files') AND 
		  UPPER(TABLE_SCHEMA) = UPPER('dbo')
)
	DROP TABLE dbo.tbl_GMA_Export_Promotions_files;
ELSE
	CREATE TABLE tbl_GMA_Export_Promotions_files ( 
				 iid        INT IDENTITY , 
				 filepath   VARCHAR(255) DEFAULT NULL , 
				 filename   VARCHAR(255) , 
				 importdate DATETIME2(6) DEFAULT SYSDATETIME() , 
				 state      INT DEFAULT 0
												 );
GO

IF EXISTS
(
	SELECT *
	FROM INFORMATION_SCHEMA.VIEWS
	WHERE UPPER(TABLE_NAME) = UPPER('vw_GMA_Export_Promotions') AND 
		  UPPER(TABLE_SCHEMA) = UPPER('dbo')
)
	BEGIN
		DROP VIEW dbo.vw_GMA_Export_Promotions;
	END;
GO
create view vw_GMA_Export_Promotions
as
SELECT tbl_GMA_Export_Promotions.[BusinessDay]
		,tbl_GMA_Export_Promotions.[PromotionID]
		,tbl_GMA_Export_Promotions.[PromotionName]
		,tbl_GMA_Export_Promotions.[PromotionMinBusinessDay]
		,tbl_GMA_Export_Promotions.[PromotionMaxBusinessDay]
		,tbl_GMA_Export_Promotions.[GuestCountTotal]
		,tbl_GMA_Export_Promotions.[GuestCountFranchise]
		,tbl_GMA_Export_Promotions.[GuestCountMcOpCo]
		,tbl_GMA_Export_Promotions.[GrossAmount]
		,tbl_GMA_Export_Promotions.[NetSalesAmountAfterDiscount]
		,tbl_GMA_Export_Promotions.[UnitsSold]
		,tbl_GMA_Export_Promotions.[AvgFPCostAvg]
		,tbl_GMA_Export_Promotions.[NetSalesAmount]
		,tbl_GMA_Export_Promotions.[FPCost]
		,tbl_GMA_Export_Promotions.[StoreCountFranchise]
		,tbl_GMA_Export_Promotions.[StoreCountMcOpCo]
		,tbl_GMA_Export_Promotions.[StoreCountTotal]
FROM [dbo].[tbl_GMA_Export_Promotions]
		INNER JOIN
(
	SELECT MAX(tec_sid) tec_sid_max, 
			MAX(BusinessDay) BusinessDay_max,	
			PromotionID, 
			PromotionName
	FROM [dbo].[tbl_GMA_Export_Promotions]
	GROUP BY PromotionID, 
				PromotionName
) AS tbl_GMA_Export_Promotions_newest ON     tbl_GMA_Export_Promotions.tec_sid       = tbl_GMA_Export_Promotions_newest.tec_sid_max
											AND tbl_GMA_Export_Promotions.BusinessDay   = tbl_GMA_Export_Promotions_newest.BusinessDay_max
											AND tbl_GMA_Export_Promotions.PromotionID   = tbl_GMA_Export_Promotions_newest.PromotionID
											AND tbl_GMA_Export_Promotions.PromotionName = tbl_GMA_Export_Promotions_newest.PromotionName;

GO


IF EXISTS ( SELECT 1
            FROM sysobjects
            WHERE name = 'prc_load_GMA_Export_Promotions'
          ) 
    BEGIN
        DROP PROCEDURE dbo.prc_load_GMA_Export_Promotions
    END;	
GO
CREATE PROCEDURE prc_load_GMA_Export_Promotions(@path NVARCHAR(512) = '\\vmware-host\Shared Folders\loreal-development\20180819_20180917_GMA_Export_Promotions\' OUT)
AS
     BEGIN			--some variables
         DECLARE @filename	VARCHAR(255),
				 @sql		VARCHAR(8000), 
				 @cmd		VARCHAR(1000), 
				 @archive	VARCHAR(512),
				 @iid		int,
				 @state		int
				 ;

         IF NOT EXISTS
         (
             SELECT 1
             FROM INFORMATION_SCHEMA.TABLES
             WHERE UPPER(TABLE_NAME) = UPPER('tbl_GMA_Export_Promotions_files')
                   AND UPPER(TABLE_SCHEMA) = UPPER('dbo')
         )
             BEGIN
                 CREATE TABLE tbl_GMA_Export_Promotions_files
                 (iid		 int identity,
				  filepath   VARCHAR(255) DEFAULT NULL, 
                  filename   VARCHAR(255), 
                  importdate DATETIME2(6) DEFAULT SYSDATETIME(), 
                  state      INT DEFAULT 0
                 );
             END;

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
         SET @cmd = 'dir "'+@path+'"*.csv /b';
         PRINT(@cmd);
         INSERT INTO dbo.tbl_GMA_Export_Promotions_files(filename)
         EXEC Master..xp_cmdShell 
              @cmd;
         UPDATE dbo.tbl_GMA_Export_Promotions_files
           SET 
               filepath = @path
         WHERE filepath IS NULL;

		 DELETE FROM dbo.tbl_GMA_Export_Promotions_files
         WHERE filename IS NULL or filename not like '%.csv%';


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
             FROM dbo.tbl_GMA_Export_Promotions_files 
             WHERE filename LIKE '%.csv%' 
			   AND state = 0
			   ;

         OPEN c1;
         FETCH NEXT FROM c1 INTO @iid, @path, @filename;
         WHILE @@fetch_status <> -1
             BEGIN
                 --bulk insert won't take a variable name, so make a sql and execute it instead:
                 SET @sql = 'BULK INSERT dbo.vw_ins_GMA_Export_Promotions FROM '''+@path+@filename+''' '+'     WITH ( 
							FIELDTERMINATOR = '';'', 
							ROWTERMINATOR = ''\n'', 
							FIRSTROW = 2 ,
							CODEPAGE = 65001 
						) ';
              
                 EXEC (@sql);

				 IF (@@ROWCOUNT > 0) 
						set @state = 1
				 ELSE	set @state = -1	

				 update tbl_GMA_Export_Promotions_files 
					set state = @state 
						where iid = @iid
				 --
				 -- file system operations (create direcory if it's not exist and move 
				 -- datafiles afterwards into
                 SET @cmd = 'mkdir '+@archive;
                 EXEC Master..xp_cmdShell 
                      @cmd;

                 SET @cmd = 'move "'+@path+@filename+'" '+@archive;
                 PRINT('move='+@cmd);
                 EXEC Master..xp_cmdShell 
                      @cmd;


                 FETCH NEXT FROM c1 INTO @iid, @path, @filename;
             END;
         CLOSE c1;
         DEALLOCATE c1;
     END;
GO


exec prc_load_GMA_Export_Promotions @path='\\vmware-host\Shared Folders\loreal-development\20180819_20180917_GMA_Export_Promotions\level2'

