
select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1212 and 1212 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1190 and 1190 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1178 and 1178 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1222 and 1222 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1192 and 1192 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1215 and 1215 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1220 and 1220 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1220 and 1220 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1199 and 1199 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1185 and 1185 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1221 and 1221 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1192 and 1192 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1181 and 1181 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1205 and 1205 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1185 and 1185 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1206 and 1206 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1210 and 1210 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1178 and 1178 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1178 and 1178 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1191 and 1191 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;



select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1215 and 1215 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
LIMIT 100;


