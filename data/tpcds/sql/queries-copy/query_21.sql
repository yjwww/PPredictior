
select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1998-04-08' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1998-04-08' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1998-04-08' as date) - INTERVAL '30 day')
                    and (cast ('1998-04-08' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2001-06-15' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2001-06-15' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2001-06-15' as date) - INTERVAL '30 day')
                    and (cast ('2001-06-15' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1998-04-26' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1998-04-26' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1998-04-26' as date) - INTERVAL '30 day')
                    and (cast ('1998-04-26' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2002-06-30' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2002-06-30' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2002-06-30' as date) - INTERVAL '30 day')
                    and (cast ('2002-06-30' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2001-05-02' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2001-05-02' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2001-05-02' as date) - INTERVAL '30 day')
                    and (cast ('2001-05-02' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2001-04-07' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2001-04-07' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2001-04-07' as date) - INTERVAL '30 day')
                    and (cast ('2001-04-07' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2002-03-20' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2002-03-20' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2002-03-20' as date) - INTERVAL '30 day')
                    and (cast ('2002-03-20' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1999-06-26' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1999-06-26' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1999-06-26' as date) - INTERVAL '30 day')
                    and (cast ('1999-06-26' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2000-05-08' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2000-05-08' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2000-05-08' as date) - INTERVAL '30 day')
                    and (cast ('2000-05-08' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1998-03-15' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1998-03-15' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1998-03-15' as date) - INTERVAL '30 day')
                    and (cast ('1998-03-15' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1999-03-27' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1999-03-27' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1999-03-27' as date) - INTERVAL '30 day')
                    and (cast ('1999-03-27' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2002-05-12' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2002-05-12' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2002-05-12' as date) - INTERVAL '30 day')
                    and (cast ('2002-05-12' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2001-04-06' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2001-04-06' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2001-04-06' as date) - INTERVAL '30 day')
                    and (cast ('2001-04-06' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2001-02-05' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2001-02-05' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2001-02-05' as date) - INTERVAL '30 day')
                    and (cast ('2001-02-05' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1999-02-16' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1999-02-16' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1999-02-16' as date) - INTERVAL '30 day')
                    and (cast ('1999-02-16' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1998-03-31' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1998-03-31' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1998-03-31' as date) - INTERVAL '30 day')
                    and (cast ('1998-03-31' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2002-05-29' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2002-05-29' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2002-05-29' as date) - INTERVAL '30 day')
                    and (cast ('2002-05-29' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1998-02-28' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1998-02-28' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1998-02-28' as date) - INTERVAL '30 day')
                    and (cast ('1998-02-28' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2001-03-14' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2001-03-14' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2001-03-14' as date) - INTERVAL '30 day')
                    and (cast ('2001-03-14' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('2000-04-08' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('2000-04-08' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('2000-04-08' as date) - INTERVAL '30 day')
                    and (cast ('2000-04-08' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;



select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as date) < cast ('1999-03-26' as date))
	                then inv_quantity_on_hand 
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as date) >= cast ('1999-03-26' as date))
                      then inv_quantity_on_hand 
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and d_date between (cast ('1999-03-26' as date) - INTERVAL '30 day')
                    and (cast ('1999-03-26' as date) + INTERVAL '30 day')
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0 
             then inv_after / inv_before 
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 LIMIT 100;


