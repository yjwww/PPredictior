
select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=36
 	and d_moy=12
 	and d_year=2001
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=77
 	and d_moy=12
 	and d_year=2002
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=90
 	and d_moy=12
 	and d_year=2001
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=48
 	and d_moy=11
 	and d_year=1999
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=65
 	and d_moy=12
 	and d_year=1999
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=49
 	and d_moy=11
 	and d_year=1999
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=91
 	and d_moy=11
 	and d_year=1999
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=12
 	and d_moy=11
 	and d_year=2000
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=34
 	and d_moy=11
 	and d_year=2001
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=32
 	and d_moy=11
 	and d_year=1999
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=91
 	and d_moy=11
 	and d_year=2002
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=18
 	and d_moy=12
 	and d_year=2000
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=89
 	and d_moy=11
 	and d_year=2000
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=50
 	and d_moy=11
 	and d_year=2000
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=70
 	and d_moy=11
 	and d_year=1999
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=8
 	and d_moy=11
 	and d_year=1998
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=38
 	and d_moy=12
 	and d_year=2002
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=75
 	and d_moy=12
 	and d_year=2002
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=33
 	and d_moy=11
 	and d_year=2000
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=9
 	and d_moy=12
 	and d_year=2002
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;



select  i_brand_id brand_id, i_brand brand,
 	sum(ss_ext_sales_price) ext_price
 from date_dim, store_sales, item
 where d_date_sk = ss_sold_date_sk
 	and ss_item_sk = i_item_sk
 	and i_manager_id=76
 	and d_moy=12
 	and d_year=2002
 group by i_brand, i_brand_id
 order by ext_price desc, i_brand_id
LIMIT 100 ;


