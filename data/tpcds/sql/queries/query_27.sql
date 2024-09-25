
select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'M' and
       cd_education_status = '4 yr Degree' and
       d_year = 2002 and
       s_state in ('SD','TN', 'AL', 'TN', 'SD', 'SD')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'S' and
       cd_education_status = '2 yr Degree' and
       d_year = 2001 and
       s_state in ('SD','TN', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'M' and
       cd_education_status = 'College' and
       d_year = 1999 and
       s_state in ('SD','AL', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'U' and
       cd_education_status = 'Secondary' and
       d_year = 1999 and
       s_state in ('AL','SD', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'U' and
       cd_education_status = 'Unknown' and
       d_year = 1998 and
       s_state in ('SD','TN', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'U' and
       cd_education_status = 'Secondary' and
       d_year = 2000 and
       s_state in ('SD','AL', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'D' and
       cd_education_status = 'Primary' and
       d_year = 2000 and
       s_state in ('TN','AL', 'SD', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'U' and
       cd_education_status = 'Unknown' and
       d_year = 1998 and
       s_state in ('AL','SD', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'M' and
       cd_education_status = 'Advanced Degree' and
       d_year = 2002 and
       s_state in ('SD','AL', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'S' and
       cd_education_status = 'Advanced Degree' and
       d_year = 1999 and
       s_state in ('SD','AL', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'D' and
       cd_education_status = 'Unknown' and
       d_year = 1998 and
       s_state in ('SD','TN', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'S' and
       cd_education_status = 'Unknown' and
       d_year = 2002 and
       s_state in ('SD','TN', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'S' and
       cd_education_status = '4 yr Degree' and
       d_year = 2002 and
       s_state in ('AL','TN', 'SD', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'W' and
       cd_education_status = 'Secondary' and
       d_year = 2000 and
       s_state in ('TN','SD', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'U' and
       cd_education_status = '4 yr Degree' and
       d_year = 2002 and
       s_state in ('TN','SD', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'W' and
       cd_education_status = 'College' and
       d_year = 1998 and
       s_state in ('SD','AL', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'M' and
       cd_education_status = 'College' and
       d_year = 1998 and
       s_state in ('AL','SD', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'D' and
       cd_education_status = 'Unknown' and
       d_year = 2002 and
       s_state in ('SD','AL', 'TN', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'M' and
       cd_education_status = 'Secondary' and
       d_year = 2002 and
       s_state in ('TN','AL', 'SD', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'M' and
       cd_education_status = 'Unknown' and
       d_year = 1999 and
       s_state in ('TN','AL', 'SD', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;



select  i_item_id,
        s_state, grouping(s_state) g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from store_sales, customer_demographics, date_dim, store, item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'M' and
       cd_marital_status = 'U' and
       cd_education_status = 'Advanced Degree' and
       d_year = 1998 and
       s_state in ('TN','SD', 'AL', 'SD', 'TN', 'AL')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
 LIMIT 100;

