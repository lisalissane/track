	--BULK INSERT MULTIPLE FILES From a Folder 

--a table to loop thru filenames drop table ALLFILENAMES
drop TABLE tbl_GMA_Export_Promotions_files
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
\\vmware-host\Shared Folders\loreal-development\20180819_20180917_GMA_Export_Promotions\level2

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


exec prc_load_GMA_Export_Promotions '\\vmware-host\Shared Folders\loreal-development\20180819_20180917_GMA_Export_Promotions\level2'

	select * from tbl_GMA_Export_Promotions_files
	truncate table [dbo].[tbl_GMA_Export_Promotions]
	select * from [dbo].[tbl_GMA_Export_Promotions]

----Extras

----delete from ALLFILENAMES where WHICHFILE is NULL
----select * from ALLFILENAMES
----drop table ALLFILENAMES


BULK INSERT tbl_GMA_Export_Promotions FROM '\\vmware-host\Shared Folders\loreal-development\20180819_20180917_GMA_Export_Promotions\20180819_20180917_GMA_Export_Promotions.csv'      WITH ( 
                FIELDTERMINATOR = ';', 
                ROWTERMINATOR = '\n', 
                FIRSTROW = 2 
            ) 


select convert(nvarchar(20),GetDate(),112) 




DECLARE @tableName    NVARCHAR(64)   = 'tbl_GMA_Export_Promotions',
        @tableSchema  NVARCHAR(64)   = 'dbo',
		@alias		  NVARCHAR(32)	 = '',
        @columnstring NVARCHAR(2000) = NULL;

--
-- stage load/integrate sets
SELECT REPLACE(' COALESCE(NULLIF([CCCC], ''''),
                  (
                      SELECT TOP 1 [CCCC]
                      FROM [dbo].[tbl_GMA_Export_Promotions]
                      WHERE    [PromotionID] = s.[PromotionID]
                           AND [PromotionName] = s.[PromotionName]

                            AND NULLIF([CCCC], '''') IS NOT NULL
                      ORDER BY [tec_sid] DESC
                  )) [CCCC]', 'CCCC', column_name)+IIF(ORDINAL_POSITION <
(
    SELECT MAX(ORDINAL_POSITION)
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = @tableSchema
          AND TABLE_NAME = @tableName
          AND column_name NOT LIKE 'VALID%'
), ',', '')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @tableSchema
      AND TABLE_NAME = @tableName
      AND column_name NOT LIKE 'VALID%'
ORDER BY ORDINAL_POSITION;

select * from vw_GMA_Export_Promotions


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



WITH currently_condensed_GMA_Export_Promotions
     AS (SELECT TOP 100 PERCENT COALESCE(NULLIF([tec_sid], ''),
         (
             SELECT TOP 1 [tec_sid]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([tec_sid], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [tec_sid], 
                                COALESCE(NULLIF([tec_import_ts], ''),
         (
             SELECT TOP 1 [tec_import_ts]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([tec_import_ts], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [tec_import_ts], 
                                COALESCE(NULLIF([BusinessDay], ''),
         (
             SELECT TOP 1 [BusinessDay]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([BusinessDay], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [BusinessDay], 
                                COALESCE(NULLIF([PromotionID], ''),
         (
             SELECT TOP 1 [PromotionID]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([PromotionID], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [PromotionID], 
                                COALESCE(NULLIF([PromotionName], ''),
         (
             SELECT TOP 1 [PromotionName]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([PromotionName], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [PromotionName], 
                                COALESCE(NULLIF([PromotionMinBusinessDay], ''),
         (
             SELECT TOP 1 [PromotionMinBusinessDay]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([PromotionMinBusinessDay], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [PromotionMinBusinessDay], 
                                COALESCE(NULLIF([PromotionMaxBusinessDay], ''),
         (
             SELECT TOP 1 [PromotionMaxBusinessDay]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([PromotionMaxBusinessDay], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [PromotionMaxBusinessDay], 
                                COALESCE(NULLIF([GuestCountTotal], ''),
         (
             SELECT TOP 1 [GuestCountTotal]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([GuestCountTotal], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [GuestCountTotal], 
                                COALESCE(NULLIF([GuestCountFranchise], ''),
         (
             SELECT TOP 1 [GuestCountFranchise]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([GuestCountFranchise], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [GuestCountFranchise], 
                                COALESCE(NULLIF([GuestCountMcOpCo], ''),
         (
             SELECT TOP 1 [GuestCountMcOpCo]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([GuestCountMcOpCo], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [GuestCountMcOpCo], 
                                COALESCE(NULLIF([GrossAmount], ''),
         (
             SELECT TOP 1 [GrossAmount]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([GrossAmount], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [GrossAmount], 
                                COALESCE(NULLIF([NetSalesAmountAfterDiscount], ''),
         (
             SELECT TOP 1 [NetSalesAmountAfterDiscount]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([NetSalesAmountAfterDiscount], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [NetSalesAmountAfterDiscount], 
                                COALESCE(NULLIF([UnitsSold], ''),
         (
             SELECT TOP 1 [UnitsSold]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([UnitsSold], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [UnitsSold], 
                                COALESCE(NULLIF([AvgFPCostAvg], ''),
         (
             SELECT TOP 1 [AvgFPCostAvg]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([AvgFPCostAvg], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [AvgFPCostAvg], 
                                COALESCE(NULLIF([NetSalesAmount], ''),
         (
             SELECT TOP 1 [NetSalesAmount]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([NetSalesAmount], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [NetSalesAmount], 
                                COALESCE(NULLIF([FPCost], ''),
         (
             SELECT TOP 1 [FPCost]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([FPCost], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [FPCost], 
                                COALESCE(NULLIF([StoreCountFranchise], ''),
         (
             SELECT TOP 1 [StoreCountFranchise]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([StoreCountFranchise], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [StoreCountFranchise], 
                                COALESCE(NULLIF([StoreCountMcOpCo], ''),
         (
             SELECT TOP 1 [StoreCountMcOpCo]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([StoreCountMcOpCo], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [StoreCountMcOpCo], 
                                COALESCE(NULLIF([StoreCountTotal], ''),
         (
             SELECT TOP 1 [StoreCountTotal]
             FROM [dbo].[tbl_GMA_Export_Promotions]
             WHERE [PromotionID] = s.[PromotionID]
                   AND [PromotionName] = s.[PromotionName]
                   AND NULLIF([StoreCountTotal], '') IS NOT NULL
             ORDER BY [tec_sid] DESC
         )) [StoreCountTotal]
         FROM [dbo].tbl_GMA_Export_Promotions s
         ORDER BY [tec_sid] DESC, 
                  [BusinessDay], 
                  [PromotionID], 
                  [PromotionName])
     SELECT cs.*
     FROM currently_condensed_GMA_Export_Promotions cs
          INNER JOIN
			 (
				 SELECT MAX([tec_sid]) [tec_sid], 
						[PromotionID], 
						[PromotionName]
				 FROM currently_condensed_GMA_Export_Promotions
				 GROUP BY [PromotionID], 
						  [PromotionName]
			 ) tcs ON cs.[PromotionID]       = tcs.[PromotionID]
					  AND cs.[PromotionName] = tcs.[PromotionName]
					  AND cs.[tec_sid]       = tcs.[tec_sid]			  
			 order by cs.[PromotionID];

