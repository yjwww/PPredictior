
select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1998-04-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1998-04-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1998-04-08' as date) - interval '30 day')
                and (cast ('1998-04-08' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2001-06-15' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2001-06-15' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2001-06-15' as date) - interval '30 day')
                and (cast ('2001-06-15' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1998-04-26' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1998-04-26' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1998-04-26' as date) - interval '30 day')
                and (cast ('1998-04-26' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2002-06-30' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2002-06-30' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2002-06-30' as date) - interval '30 day')
                and (cast ('2002-06-30' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2001-05-02' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2001-05-02' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2001-05-02' as date) - interval '30 day')
                and (cast ('2001-05-02' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2001-04-07' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2001-04-07' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2001-04-07' as date) - interval '30 day')
                and (cast ('2001-04-07' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2002-03-20' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2002-03-20' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2002-03-20' as date) - interval '30 day')
                and (cast ('2002-03-20' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1999-06-26' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1999-06-26' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1999-06-26' as date) - interval '30 day')
                and (cast ('1999-06-26' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2000-05-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2000-05-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2000-05-08' as date) - interval '30 day')
                and (cast ('2000-05-08' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1998-03-15' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1998-03-15' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1998-03-15' as date) - interval '30 day')
                and (cast ('1998-03-15' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1999-03-27' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1999-03-27' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1999-03-27' as date) - interval '30 day')
                and (cast ('1999-03-27' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2002-05-12' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2002-05-12' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2002-05-12' as date) - interval '30 day')
                and (cast ('2002-05-12' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2001-04-06' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2001-04-06' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2001-04-06' as date) - interval '30 day')
                and (cast ('2001-04-06' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2001-02-05' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2001-02-05' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2001-02-05' as date) - interval '30 day')
                and (cast ('2001-02-05' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1999-02-16' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1999-02-16' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1999-02-16' as date) - interval '30 day')
                and (cast ('1999-02-16' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1998-03-31' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1998-03-31' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1998-03-31' as date) - interval '30 day')
                and (cast ('1998-03-31' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2002-05-29' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2002-05-29' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2002-05-29' as date) - interval '30 day')
                and (cast ('2002-05-29' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1998-02-28' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1998-02-28' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1998-02-28' as date) - interval '30 day')
                and (cast ('1998-02-28' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2001-03-14' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2001-03-14' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2001-03-14' as date) - interval '30 day')
                and (cast ('2001-03-14' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('2000-04-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('2000-04-08' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('2000-04-08' as date) - interval '30 day')
                and (cast ('2000-04-08' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;



select  
   w_state
  ,i_item_id
  ,sum(case when (cast(d_date as date) < cast ('1999-03-26' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when (cast(d_date as date) >= cast ('1999-03-26' as date)) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   catalog_sales left outer join catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,warehouse 
  ,item
  ,date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between (cast ('1999-03-26' as date) - interval '30 day')
                and (cast ('1999-03-26' as date) + interval '30 day') 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
LIMIT 100;


