declare @current_datefirst datetime;
DECLARE	 datelist_cursor CURSOR
FOR
    WITH x
         AS(SELECT n
            FROM(VALUES(0), (1), (2), (3), (4), (5), (6), (7), (8), (9)) v(n)),
         series
         AS(SELECT CAST((ones.n + 10 * tens.n) AS INT) n -- + 100*hundreds.n + 1000*thousands.n
            FROM x ones, 
                 x tens --,      x hundreds,       x thousands
         )
         SELECT CAST(DATEADD(DAY, 0, DATEFROMPARTS(YEAR(CURRENT_TIMESTAMP), MONTH(CURRENT_TIMESTAMP) - n, 1)) AS DATE) AS end_of_last_month
         --select n
         FROM series
         WHERE n < 7
         ORDER BY n;

OPEN  datelist_cursor
FETCH NEXT FROM datelist_cursor INTO 	@current_datefirst

WHILE @@FETCH_STATUS = 0
BEGIN
    with 
	reference_dates as 
	(select cast(floor(cast(cast(convert(char(8),@current_datefirst,112) as datetime)    as float)) as datetime)  today, 
			cast(floor(cast(cast(convert(char(8),@current_datefirst,112) as datetime)-30 as float)) as datetime)  todaybefore30, 
			cast(floor(cast(cast(convert(char(8),@current_datefirst,112) as datetime)-60 as float)) as datetime)  todaybefore60,
			cast(floor(cast(cast(convert(char(8),@current_datefirst,112) as datetime)-90 as float)) as datetime)  todaybefore90
	),
	window_nowTo90 as
	(	select cast(saledate as datetime) csaledate, gma_customer_reduced.*   from gma_customer_reduced, reference_dates
			where cast(saledate as datetime) between todaybefore90 and today
	),
	window_nowTo60 as
	(	select cast(saledate as datetime) csaledate, gma_customer_reduced.*   from gma_customer_reduced, reference_dates
			where cast(saledate as datetime) between todaybefore60 and today
	),
	window_nowTo30 as
	(	select cast(saledate as datetime) csaledate, gma_customer_reduced.*   from gma_customer_reduced, reference_dates
			where cast(saledate as datetime) between todaybefore30 and today
	),
	calc_between_0and90 as
	(	select customerid, window_nowTo90.csaledate, count(DISTINCT window_nowTo90.orderKey) cnt
				   from window_nowTo90, reference_dates				
				  where csaledate between todaybefore90  and today	
						group by window_nowTo90.customerid, window_nowTo90.orderKey, window_nowTo90.csaledate
	),
	calc_between_0and60 as
	(	select customerid, window_nowTo60.csaledate, count(DISTINCT window_nowTo60.orderKey) cnt
				   from window_nowTo60, reference_dates					
				   where csaledate between todaybefore60  and today
						group by window_nowTo60.customerid, window_nowTo60.orderKey, window_nowTo60.csaledate
	),
	calc_between_0and30 as
	(	select customerid, window_nowTo30.csaledate, count(DISTINCT window_nowTo30.orderKey) cnt
				   from window_nowTo30, reference_dates		
				   where csaledate between todaybefore30  and today
						group by window_nowTo30.customerid, window_nowTo30.orderKey, window_nowTo30.csaledate
	),
	calc_between_30and60 as
	(	select customerid, window_nowTo90.csaledate, count(distinct window_nowTo90.orderKey) cnt
				   from window_nowTo90, reference_dates
						where csaledate between todaybefore60  and todaybefore30
						group by window_nowTo90.customerid, window_nowTo90.orderKey, window_nowTo90.csaledate
	),
	calc_between_30and90 as
	(	select customerid, window_nowTo90.csaledate, count(DISTINCT window_nowTo90.orderKey) cnt
				   from window_nowTo90, reference_dates
						where csaledate between todaybefore90  and todaybefore30
						group by window_nowTo90.customerid, window_nowTo90.orderKey, window_nowTo90.csaledate
	),
	calc_between_60and90 as
	(	select customerid, window_nowTo90.csaledate, count(DISTINCT window_nowTo90.orderKey) cnt
				   from window_nowTo90, reference_dates
						where csaledate between todaybefore90  and todaybefore60
						group by window_nowTo90.customerid, window_nowTo90.orderKey, window_nowTo90.csaledate
	),
	result_set as
	(
	select  cast(today as date) as reference_date,
			gma_customer_reduced.customerid,

	--		iif (	
				(select isnull(count(cnt),0) 
										  from calc_between_0and90, reference_dates								  
										 where customerid = gma_customer_reduced.customerid 	
										   and csaledate between todaybefore90  and today
														    group by calc_between_0and90.customerid )
	--			is null, 0, 1)															 
			as mau_1,
--			iif (	

				(
				select '('+
					   cast(calc_0_30 as varchar)+'>='+
					   cast(calc_30_60 as varchar)+')='+
					   cast(iif((calc_0_30 >= 1) and (calc_0_30 >= calc_30_60), 1, 0) as varchar)
				  from (		
				  		select 
				  			isnull(
				  				(select isnull(sum(calc_between_0and30.cnt ),0) cnt
				  					from calc_between_0and30
				  									where calc_between_0and30.customerid  = gma_customer_reduced.customerid
				  										group by  customerid 
				  				), 0) calc_0_30,
				  			isnull(
				  				(select isnull(sum(calc_between_30and60.cnt ),0) cnt
				  					from calc_between_30and60
				  									where calc_between_30and60.customerid  = gma_customer_reduced.customerid  
				  										group by  customerid 
				  				), 0) calc_30_60
				  		) calc_mau_2
				 )

			as mau_2,
	--		iif (

				--(
				--	select --calc_0_30.cnt + calc_30_60.cnt
				--			 '('+
				--			 cast(isnull(calc_0_30.cnt, 0)  as varchar)+'<'+
				--			 cast(isnull(calc_30_60.cnt, 0) as varchar)+') == '+
				--			 cast(iif(isnull(calc_0_30.cnt, 0) < isnull(calc_30_60.cnt, 0), 1, 0) as varchar)
				--						  from (select customerid, isnull(sum(calc_between_0and30.cnt ),0) cnt
				--										from calc_between_0and30
				--													 where calc_between_0and30.customerid  = gma_customer_reduced.customerid
				--															group by  customerid 
				--								) calc_0_30
				--								outer apply	
				--								(select customerid, isnull(sum(calc_between_30and60.cnt ),0) cnt
				--										from calc_between_30and60
				--													 where calc_between_30and60.customerid  = gma_customer_reduced.customerid  
				--															group by  customerid 
				--								) calc_30_60											    
				--						 where calc_0_30.customerid  = gma_customer_reduced.customerid  
				--							or calc_30_60.customerid = gma_customer_reduced.customerid	
				--)

				(
				select '('+
					   cast(calc_0_30 as varchar)+'<'+
					   cast(calc_30_60 as varchar)+')='+
					   cast(iif((calc_0_30 < calc_30_60), 1, 0) as varchar)
				  from (		
				  		select 
				  			isnull(
				  				(select isnull(sum(calc_between_0and30.cnt ),0) cnt
				  					from calc_between_0and30
				  									where calc_between_0and30.customerid  = gma_customer_reduced.customerid
				  										group by  customerid 
				  				), 0) calc_0_30,
				  			isnull(
				  				(select isnull(sum(calc_between_30and60.cnt ),0) cnt
				  					from calc_between_30and60
				  									where calc_between_30and60.customerid  = gma_customer_reduced.customerid  
				  										group by  customerid 
				  				), 0) calc_30_60
				  		) calc_mau_2
				 )

				--(select cast(isnull(count(calc_between_0and30.customerid ), 0) as varchar)+':'+
				--		cast(isnull(count(calc_between_30and90.customerid), 0) as varchar)+'='+
				--		iif( isnull(count(calc_between_0and30.customerid ), 0) < isnull(count(calc_between_30and90.customerid), 0), '1','0')
				--						  from calc_between_0and30
				--								 outer apply	
				--							   calc_between_30and90 
				--								--	on calc_between_0and30.customerid = calc_between_30and90.customerid
				--						 where calc_between_0and30.customerid  = gma_customer_reduced.customerid  
				--							or calc_between_30and90.customerid = gma_customer_reduced.customerid	
				--														 group by calc_between_0and30.customerid
				--																, calc_between_30and90.customerid) 				 
		--		is null, 0, 1)															 
		as mau_3,
		--	iif (
				(

					select isnull(sum(calc_between_60and90.cnt ),0) cnt
								from calc_between_60and90
							   where calc_between_60and90.customerid = gma_customer_reduced.customerid
							     and not exists (select 1 from calc_between_0and60 where calc_between_0and60.customerid = calc_between_60and90.customerid)
									 group by  calc_between_60and90.customerid 
				)
		--		is null, 0, 1)	
		as mau_4


			from gma_customer_reduced, reference_dates
						group by customerid, today
		)
		insert into gma_customer_reduced_teststage01
		select reference_date, customerid, 
				iif(mau_1 is null, '0', '1') mau_1, 
				iif(mau_2 is null, '0', mau_2) mau_2, 
				iif(mau_3 is null, '0', mau_3) mau_3, 
				iif(mau_4 is null, '0', mau_4) mau_4
				--into gma_customer_reduced_teststage01	
			from result_set



	FETCH NEXT FROM datelist_cursor INTO @current_datefirst;

END;
CLOSE datelist_cursor
DEALLOCATE datelist_cursor;	