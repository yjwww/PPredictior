
select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 47
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 47
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 47
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 47
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 2
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 2
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 2
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 2
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 38
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 38
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 38
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 38
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 28
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 28
                                                    and ss_addr_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 28
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 28
                                                    and ss_addr_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 30
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 30
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 30
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 30
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 39
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 39
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 39
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 39
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 25
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 25
                                                    and ss_addr_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 25
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 25
                                                    and ss_addr_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 20
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 20
                                                    and ss_addr_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 20
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 20
                                                    and ss_addr_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 37
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 37
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 37
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 37
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 29
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 29
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 29
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 29
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 25
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 25
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 25
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 25
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 4
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 4
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 4
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 4
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 21
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 21
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 21
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 21
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 24
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 24
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 24
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 24
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 5
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 5
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 5
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 5
                                                    and ss_cdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 32
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 32
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 32
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 32
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 41
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 41
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 41
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 41
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 10
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 10
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 10
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 10
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 46
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 46
                                                    and ss_customer_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 46
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 46
                                                    and ss_customer_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 23
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 23
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 23
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 23
                                                    and ss_promo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;



select  asceding.rnk, i1.i_product_name best_performing, i2.i_product_name worst_performing
from(select *
     from (select item_sk,rank() over (order by rank_col asc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col 
                 from store_sales ss1
                 where ss_store_sk = 28
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 28
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V1)V11
     where rnk  < 11) asceding,
    (select *
     from (select item_sk,rank() over (order by rank_col desc) rnk
           from (select ss_item_sk item_sk,avg(ss_net_profit) rank_col
                 from store_sales ss1
                 where ss_store_sk = 28
                 group by ss_item_sk
                 having avg(ss_net_profit) > 0.9*(select avg(ss_net_profit) rank_col
                                                  from store_sales
                                                  where ss_store_sk = 28
                                                    and ss_hdemo_sk is null
                                                  group by ss_store_sk))V2)V21
     where rnk  < 11) descending,
item i1,
item i2
where asceding.rnk = descending.rnk 
  and i1.i_item_sk=asceding.item_sk
  and i2.i_item_sk=descending.item_sk
order by asceding.rnk
LIMIT 100;


