
select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'AIRBORNE' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 49530 and 49530+28800 
 	and sm_carrier in ('DIAMOND','AIRBORNE')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'AIRBORNE' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 49530 AND 49530+28800 
 	and sm_carrier in ('DIAMOND','AIRBORNE')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'GREAT EASTERN' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 38409 and 38409+28800 
 	and sm_carrier in ('GREAT EASTERN','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'GREAT EASTERN' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_list_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_list_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_list_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_list_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_list_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_list_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_list_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_list_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_list_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_list_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_list_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_list_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 38409 AND 38409+28800 
 	and sm_carrier in ('GREAT EASTERN','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'TBS' || ',' || 'BOXBUNDLES' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 36576 and 36576+28800 
 	and sm_carrier in ('TBS','BOXBUNDLES')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'TBS' || ',' || 'BOXBUNDLES' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_list_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_list_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_list_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_list_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_list_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_list_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_list_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_list_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_list_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_list_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_list_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_list_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 36576 AND 36576+28800 
 	and sm_carrier in ('TBS','BOXBUNDLES')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'LATVIAN' || ',' || 'BARIAN' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 863 and 863+28800 
 	and sm_carrier in ('LATVIAN','BARIAN')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'LATVIAN' || ',' || 'BARIAN' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 863 AND 863+28800 
 	and sm_carrier in ('LATVIAN','BARIAN')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'PRIVATECARRIER' || ',' || 'RUPEKSA' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 17992 and 17992+28800 
 	and sm_carrier in ('PRIVATECARRIER','RUPEKSA')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'PRIVATECARRIER' || ',' || 'RUPEKSA' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_profit * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_profit * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_profit * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_profit * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_profit * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_profit * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_profit * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_profit * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_profit * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_profit * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_profit * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_profit * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 17992 AND 17992+28800 
 	and sm_carrier in ('PRIVATECARRIER','RUPEKSA')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ZOUROS' || ',' || 'ALLIANCE' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_profit * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_profit * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_profit * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_profit * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_profit * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_profit * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_profit * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_profit * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_profit * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_profit * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_profit * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_profit * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 34408 and 34408+28800 
 	and sm_carrier in ('ZOUROS','ALLIANCE')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ZOUROS' || ',' || 'ALLIANCE' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_profit * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_profit * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_profit * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_profit * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_profit * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_profit * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_profit * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_profit * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_profit * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_profit * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_profit * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_profit * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 34408 AND 34408+28800 
 	and sm_carrier in ('ZOUROS','ALLIANCE')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'GREAT EASTERN' || ',' || 'GERMA' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2001
 	and t_time between 17062 and 17062+28800 
 	and sm_carrier in ('GREAT EASTERN','GERMA')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'GREAT EASTERN' || ',' || 'GERMA' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_list_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_list_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_list_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_list_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_list_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_list_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_list_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_list_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_list_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_list_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_list_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_list_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2001
 	and t_time between 17062 AND 17062+28800 
 	and sm_carrier in ('GREAT EASTERN','GERMA')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'LATVIAN' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 1413 and 1413+28800 
 	and sm_carrier in ('LATVIAN','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'LATVIAN' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_list_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_list_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_list_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_list_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_list_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_list_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_list_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_list_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_list_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_list_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_list_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_list_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 1413 AND 1413+28800 
 	and sm_carrier in ('LATVIAN','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'PRIVATECARRIER' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 53592 and 53592+28800 
 	and sm_carrier in ('PRIVATECARRIER','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'PRIVATECARRIER' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 53592 AND 53592+28800 
 	and sm_carrier in ('PRIVATECARRIER','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'PRIVATECARRIER' || ',' || 'LATVIAN' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1999
 	and t_time between 37976 and 37976+28800 
 	and sm_carrier in ('PRIVATECARRIER','LATVIAN')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'PRIVATECARRIER' || ',' || 'LATVIAN' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_list_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_list_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_list_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_list_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_list_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_list_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_list_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_list_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_list_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_list_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_list_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_list_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1999
 	and t_time between 37976 AND 37976+28800 
 	and sm_carrier in ('PRIVATECARRIER','LATVIAN')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'LATVIAN' || ',' || 'BOXBUNDLES' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 2970 and 2970+28800 
 	and sm_carrier in ('LATVIAN','BOXBUNDLES')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'LATVIAN' || ',' || 'BOXBUNDLES' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 2970 AND 2970+28800 
 	and sm_carrier in ('LATVIAN','BOXBUNDLES')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_profit * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_profit * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_profit * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_profit * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_profit * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_profit * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_profit * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_profit * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_profit * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_profit * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_profit * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_profit * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 31840 and 31840+28800 
 	and sm_carrier in ('DIAMOND','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'MSC' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_list_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_list_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_list_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_list_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_list_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_list_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_list_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_list_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_list_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_list_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_list_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_list_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 31840 AND 31840+28800 
 	and sm_carrier in ('DIAMOND','MSC')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'RUPEKSA' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_profit * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_profit * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_profit * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_profit * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_profit * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_profit * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_profit * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_profit * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_profit * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_profit * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_profit * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_profit * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 35383 and 35383+28800 
 	and sm_carrier in ('RUPEKSA','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'RUPEKSA' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 35383 AND 35383+28800 
 	and sm_carrier in ('RUPEKSA','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ORIENTAL' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_profit * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_profit * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_profit * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_profit * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_profit * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_profit * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_profit * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_profit * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_profit * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_profit * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_profit * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_profit * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 22163 and 22163+28800 
 	and sm_carrier in ('ORIENTAL','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ORIENTAL' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1998
 	and t_time between 22163 AND 22163+28800 
 	and sm_carrier in ('ORIENTAL','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'RUPEKSA' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1999
 	and t_time between 50997 and 50997+28800 
 	and sm_carrier in ('DIAMOND','RUPEKSA')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'RUPEKSA' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1999
 	and t_time between 50997 AND 50997+28800 
 	and sm_carrier in ('DIAMOND','RUPEKSA')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DHL' || ',' || 'ORIENTAL' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_ship * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 54533 and 54533+28800 
 	and sm_carrier in ('DHL','ORIENTAL')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DHL' || ',' || 'ORIENTAL' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_profit * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_profit * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_profit * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_profit * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_profit * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_profit * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_profit * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_profit * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_profit * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_profit * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_profit * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_profit * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 54533 AND 54533+28800 
 	and sm_carrier in ('DHL','ORIENTAL')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'ORIENTAL' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 43581 and 43581+28800 
 	and sm_carrier in ('DIAMOND','ORIENTAL')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'ORIENTAL' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 43581 AND 43581+28800 
 	and sm_carrier in ('DIAMOND','ORIENTAL')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_list_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_list_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_list_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_list_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_list_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_list_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_list_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_list_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_list_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_list_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_list_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_list_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_profit * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_profit * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_profit * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_profit * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_profit * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_profit * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_profit * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_profit * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_profit * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_profit * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_profit * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_profit * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1999
 	and t_time between 2693 and 2693+28800 
 	and sm_carrier in ('DIAMOND','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'DIAMOND' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 1999
 	and t_time between 2693 AND 2693+28800 
 	and sm_carrier in ('DIAMOND','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ZHOU' || ',' || 'ZOUROS' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_ext_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_ext_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_ext_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_ext_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_ext_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_ext_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_ext_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_ext_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_ext_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_ext_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_ship_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 2817 and 2817+28800 
 	and sm_carrier in ('ZHOU','ZOUROS')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ZHOU' || ',' || 'ZOUROS' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_ship * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2002
 	and t_time between 2817 AND 2817+28800 
 	and sm_carrier in ('ZHOU','ZOUROS')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'AIRBORNE' || ',' || 'UPS' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 46544 and 46544+28800 
 	and sm_carrier in ('AIRBORNE','UPS')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'AIRBORNE' || ',' || 'UPS' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_ext_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_ext_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_ext_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_ext_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_ext_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_ext_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_ext_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_ext_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_ext_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_ext_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid_inc_tax * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2000
 	and t_time between 46544 AND 46544+28800 
 	and sm_carrier in ('AIRBORNE','UPS')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;



select   
         w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
        ,ship_carriers
        ,year
 	,sum(jan_sales) as jan_sales
 	,sum(feb_sales) as feb_sales
 	,sum(mar_sales) as mar_sales
 	,sum(apr_sales) as apr_sales
 	,sum(may_sales) as may_sales
 	,sum(jun_sales) as jun_sales
 	,sum(jul_sales) as jul_sales
 	,sum(aug_sales) as aug_sales
 	,sum(sep_sales) as sep_sales
 	,sum(oct_sales) as oct_sales
 	,sum(nov_sales) as nov_sales
 	,sum(dec_sales) as dec_sales
 	,sum(jan_sales/w_warehouse_sq_ft) as jan_sales_per_sq_foot
 	,sum(feb_sales/w_warehouse_sq_ft) as feb_sales_per_sq_foot
 	,sum(mar_sales/w_warehouse_sq_ft) as mar_sales_per_sq_foot
 	,sum(apr_sales/w_warehouse_sq_ft) as apr_sales_per_sq_foot
 	,sum(may_sales/w_warehouse_sq_ft) as may_sales_per_sq_foot
 	,sum(jun_sales/w_warehouse_sq_ft) as jun_sales_per_sq_foot
 	,sum(jul_sales/w_warehouse_sq_ft) as jul_sales_per_sq_foot
 	,sum(aug_sales/w_warehouse_sq_ft) as aug_sales_per_sq_foot
 	,sum(sep_sales/w_warehouse_sq_ft) as sep_sales_per_sq_foot
 	,sum(oct_sales/w_warehouse_sq_ft) as oct_sales_per_sq_foot
 	,sum(nov_sales/w_warehouse_sq_ft) as nov_sales_per_sq_foot
 	,sum(dec_sales/w_warehouse_sq_ft) as dec_sales_per_sq_foot
 	,sum(jan_net) as jan_net
 	,sum(feb_net) as feb_net
 	,sum(mar_net) as mar_net
 	,sum(apr_net) as apr_net
 	,sum(may_net) as may_net
 	,sum(jun_net) as jun_net
 	,sum(jul_net) as jul_net
 	,sum(aug_net) as aug_net
 	,sum(sep_net) as sep_net
 	,sum(oct_net) as oct_net
 	,sum(nov_net) as nov_net
 	,sum(dec_net) as dec_net
 from (
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ORIENTAL' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then ws_sales_price* ws_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then ws_sales_price* ws_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then ws_sales_price* ws_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then ws_sales_price* ws_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then ws_sales_price* ws_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then ws_sales_price* ws_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then ws_sales_price* ws_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then ws_sales_price* ws_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then ws_sales_price* ws_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then ws_sales_price* ws_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then ws_sales_price* ws_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then ws_sales_price* ws_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then ws_net_paid_inc_tax * ws_quantity else 0 end) as dec_net
     from
          web_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	  ,ship_mode
     where
            ws_warehouse_sk =  w_warehouse_sk
        and ws_sold_date_sk = d_date_sk
        and ws_sold_time_sk = t_time_sk
 	and ws_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2001
 	and t_time between 52773 and 52773+28800 
 	and sm_carrier in ('ORIENTAL','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 union all
     select 
 	w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,'ORIENTAL' || ',' || 'PRIVATECARRIER' as ship_carriers
       ,d_year as year
 	,sum(case when d_moy = 1 
 		then cs_sales_price* cs_quantity else 0 end) as jan_sales
 	,sum(case when d_moy = 2 
 		then cs_sales_price* cs_quantity else 0 end) as feb_sales
 	,sum(case when d_moy = 3 
 		then cs_sales_price* cs_quantity else 0 end) as mar_sales
 	,sum(case when d_moy = 4 
 		then cs_sales_price* cs_quantity else 0 end) as apr_sales
 	,sum(case when d_moy = 5 
 		then cs_sales_price* cs_quantity else 0 end) as may_sales
 	,sum(case when d_moy = 6 
 		then cs_sales_price* cs_quantity else 0 end) as jun_sales
 	,sum(case when d_moy = 7 
 		then cs_sales_price* cs_quantity else 0 end) as jul_sales
 	,sum(case when d_moy = 8 
 		then cs_sales_price* cs_quantity else 0 end) as aug_sales
 	,sum(case when d_moy = 9 
 		then cs_sales_price* cs_quantity else 0 end) as sep_sales
 	,sum(case when d_moy = 10 
 		then cs_sales_price* cs_quantity else 0 end) as oct_sales
 	,sum(case when d_moy = 11
 		then cs_sales_price* cs_quantity else 0 end) as nov_sales
 	,sum(case when d_moy = 12
 		then cs_sales_price* cs_quantity else 0 end) as dec_sales
 	,sum(case when d_moy = 1 
 		then cs_net_paid * cs_quantity else 0 end) as jan_net
 	,sum(case when d_moy = 2 
 		then cs_net_paid * cs_quantity else 0 end) as feb_net
 	,sum(case when d_moy = 3 
 		then cs_net_paid * cs_quantity else 0 end) as mar_net
 	,sum(case when d_moy = 4 
 		then cs_net_paid * cs_quantity else 0 end) as apr_net
 	,sum(case when d_moy = 5 
 		then cs_net_paid * cs_quantity else 0 end) as may_net
 	,sum(case when d_moy = 6 
 		then cs_net_paid * cs_quantity else 0 end) as jun_net
 	,sum(case when d_moy = 7 
 		then cs_net_paid * cs_quantity else 0 end) as jul_net
 	,sum(case when d_moy = 8 
 		then cs_net_paid * cs_quantity else 0 end) as aug_net
 	,sum(case when d_moy = 9 
 		then cs_net_paid * cs_quantity else 0 end) as sep_net
 	,sum(case when d_moy = 10 
 		then cs_net_paid * cs_quantity else 0 end) as oct_net
 	,sum(case when d_moy = 11
 		then cs_net_paid * cs_quantity else 0 end) as nov_net
 	,sum(case when d_moy = 12
 		then cs_net_paid * cs_quantity else 0 end) as dec_net
     from
          catalog_sales
         ,warehouse
         ,date_dim
         ,time_dim
 	 ,ship_mode
     where
            cs_warehouse_sk =  w_warehouse_sk
        and cs_sold_date_sk = d_date_sk
        and cs_sold_time_sk = t_time_sk
 	and cs_ship_mode_sk = sm_ship_mode_sk
        and d_year = 2001
 	and t_time between 52773 AND 52773+28800 
 	and sm_carrier in ('ORIENTAL','PRIVATECARRIER')
     group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
       ,d_year
 ) x
 group by 
        w_warehouse_name
 	,w_warehouse_sq_ft
 	,w_city
 	,w_county
 	,w_state
 	,w_country
 	,ship_carriers
       ,year
 order by w_warehouse_name
 LIMIT 100;


