
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 742 and 742+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'papaya') and 
        (i_units = 'Pound' or i_units = 'Lb') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'burlywood' or i_color = 'navy') and
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'azure') and
        (i_units = 'N/A' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'cornflower') and
        (i_units = 'Bunch' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'salmon' or i_color = 'midnight') and 
        (i_units = 'Oz' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'snow' or i_color = 'steel') and
        (i_units = 'Carton' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'gainsboro') and
        (i_units = 'Dram' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'metallic' or i_color = 'forest') and
        (i_units = 'Gram' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 691 and 691+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'gainsboro' or i_color = 'firebrick') and 
        (i_units = 'Oz' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'puff' or i_color = 'turquoise') and
        (i_units = 'Gram' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'pale' or i_color = 'salmon') and
        (i_units = 'Unknown' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lemon' or i_color = 'spring') and
        (i_units = 'Box' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'goldenrod' or i_color = 'deep') and 
        (i_units = 'Case' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'moccasin' or i_color = 'medium') and
        (i_units = 'Bundle' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'wheat') and
        (i_units = 'Gross' or i_units = 'Cup') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'lawn') and
        (i_units = 'Tbl' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 700 and 700+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'magenta' or i_color = 'lawn') and 
        (i_units = 'Gross' or i_units = 'Bunch') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'rose' or i_color = 'mint') and
        (i_units = 'Carton' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'peach') and
        (i_units = 'Ton' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'dim') and
        (i_units = 'Tbl' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'salmon' or i_color = 'sandy') and 
        (i_units = 'Dozen' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'chocolate' or i_color = 'khaki') and
        (i_units = 'Bundle' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cyan' or i_color = 'midnight') and
        (i_units = 'Oz' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'moccasin' or i_color = 'lime') and
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'economy' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 770 and 770+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'moccasin' or i_color = 'white') and 
        (i_units = 'Tbl' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'powder') and
        (i_units = 'Ounce' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'sky') and
        (i_units = 'Bundle' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornsilk' or i_color = 'floral') and
        (i_units = 'Carton' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lime' or i_color = 'light') and 
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'goldenrod') and
        (i_units = 'N/A' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'gainsboro') and
        (i_units = 'Cup' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'orange') and
        (i_units = 'Ton' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'small')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 711 and 711+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'wheat' or i_color = 'saddle') and 
        (i_units = 'Bundle' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'sienna' or i_color = 'floral') and
        (i_units = 'Each' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'steel') and
        (i_units = 'Dram' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'deep') and
        (i_units = 'Tbl' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rosy' or i_color = 'green') and 
        (i_units = 'Oz' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'maroon' or i_color = 'yellow') and
        (i_units = 'Lb' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cyan' or i_color = 'beige') and
        (i_units = 'Ounce' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'grey') and
        (i_units = 'Gram' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 914 and 914+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dark' or i_color = 'chiffon') and 
        (i_units = 'Carton' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'powder' or i_color = 'turquoise') and
        (i_units = 'Tbl' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'wheat') and
        (i_units = 'Lb' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'maroon' or i_color = 'rose') and
        (i_units = 'Dram' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'salmon' or i_color = 'royal') and 
        (i_units = 'Ton' or i_units = 'Dozen') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'bisque') and
        (i_units = 'Cup' or i_units = 'Case') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'steel' or i_color = 'midnight') and
        (i_units = 'Pallet' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'chartreuse') and
        (i_units = 'Each' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 958 and 958+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'pink' or i_color = 'rose') and 
        (i_units = 'Pound' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'blush' or i_color = 'sky') and
        (i_units = 'Unknown' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'turquoise' or i_color = 'antique') and
        (i_units = 'Pallet' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'grey' or i_color = 'cream') and
        (i_units = 'Dozen' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'sandy') and 
        (i_units = 'Gram' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'ghost' or i_color = 'indian') and
        (i_units = 'Dram' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'medium') and
        (i_units = 'Carton' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'burlywood') and
        (i_units = 'Tbl' or i_units = 'Case') and
        (i_size = 'economy' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 851 and 851+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'lemon') and 
        (i_units = 'Unknown' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'deep' or i_color = 'smoke') and
        (i_units = 'Pound' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'aquamarine') and
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'cornflower') and
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'large' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'coral' or i_color = 'peach') and 
        (i_units = 'N/A' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'black') and
        (i_units = 'Gross' or i_units = 'Gram') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'forest') and
        (i_units = 'Bunch' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'tomato' or i_color = 'turquoise') and
        (i_units = 'Each' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'small')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 922 and 922+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'saddle') and 
        (i_units = 'Ounce' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'blush' or i_color = 'misty') and
        (i_units = 'Tsp' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'wheat') and
        (i_units = 'Tbl' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'khaki') and
        (i_units = 'Dram' or i_units = 'N/A') and
        (i_size = 'petite' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'mint' or i_color = 'smoke') and 
        (i_units = 'Case' or i_units = 'Bunch') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'deep' or i_color = 'moccasin') and
        (i_units = 'Lb' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'chartreuse') and
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'burnished') and
        (i_units = 'Carton' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 850 and 850+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'gainsboro' or i_color = 'saddle') and 
        (i_units = 'Pallet' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'almond' or i_color = 'hot') and
        (i_units = 'Ton' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'ghost' or i_color = 'firebrick') and
        (i_units = 'Case' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'misty') and
        (i_units = 'Pound' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'forest' or i_color = 'navajo') and 
        (i_units = 'Tsp' or i_units = 'Tbl') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'peru' or i_color = 'dim') and
        (i_units = 'Bunch' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'navy') and
        (i_units = 'Carton' or i_units = 'Oz') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'blanched') and
        (i_units = 'Dram' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'large')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 941 and 941+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'smoke' or i_color = 'forest') and 
        (i_units = 'Tbl' or i_units = 'Cup') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'peach' or i_color = 'cream') and
        (i_units = 'Unknown' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'dodger') and
        (i_units = 'Gross' or i_units = 'Pound') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'salmon') and
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'drab' or i_color = 'pink') and 
        (i_units = 'Dozen' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'thistle' or i_color = 'azure') and
        (i_units = 'Ounce' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'spring' or i_color = 'chocolate') and
        (i_units = 'Box' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'papaya') and
        (i_units = 'Gram' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 888 and 888+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tomato' or i_color = 'antique') and 
        (i_units = 'Gram' or i_units = 'Ton') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'cyan' or i_color = 'pale') and
        (i_units = 'Tsp' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'lawn') and
        (i_units = 'Gross' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'peach') and
        (i_units = 'Unknown' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'royal') and 
        (i_units = 'Each' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'white' or i_color = 'cornflower') and
        (i_units = 'Dozen' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'rosy') and
        (i_units = 'Pound' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'snow') and
        (i_units = 'Box' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'small')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 852 and 852+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'wheat' or i_color = 'pale') and 
        (i_units = 'Tsp' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'indian' or i_color = 'khaki') and
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'antique' or i_color = 'purple') and
        (i_units = 'N/A' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'orange' or i_color = 'firebrick') and
        (i_units = 'Pound' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chartreuse' or i_color = 'red') and 
        (i_units = 'Oz' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'aquamarine') and
        (i_units = 'Pallet' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'peach') and
        (i_units = 'Tbl' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'honeydew') and
        (i_units = 'Cup' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 977 and 977+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'firebrick' or i_color = 'indian') and 
        (i_units = 'Ton' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'lawn' or i_color = 'plum') and
        (i_units = 'Box' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'aquamarine' or i_color = 'sky') and
        (i_units = 'N/A' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'snow') and
        (i_units = 'Dram' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'burnished' or i_color = 'misty') and 
        (i_units = 'Tbl' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'yellow') and
        (i_units = 'Case' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'blanched') and
        (i_units = 'Bunch' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'grey') and
        (i_units = 'Tsp' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 939 and 939+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blanched' or i_color = 'turquoise') and 
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'dark' or i_color = 'grey') and
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'thistle' or i_color = 'tan') and
        (i_units = 'Oz' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'frosted') and
        (i_units = 'Gross' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'steel' or i_color = 'metallic') and 
        (i_units = 'Carton' or i_units = 'Bunch') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'ghost' or i_color = 'gainsboro') and
        (i_units = 'Ounce' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'black') and
        (i_units = 'Unknown' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'khaki' or i_color = 'purple') and
        (i_units = 'Bundle' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'small')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 966 and 966+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'olive' or i_color = 'antique') and 
        (i_units = 'Pound' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'sienna' or i_color = 'burlywood') and
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'deep' or i_color = 'wheat') and
        (i_units = 'Gram' or i_units = 'Cup') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'lace') and
        (i_units = 'Bunch' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lemon' or i_color = 'chocolate') and 
        (i_units = 'Tsp' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'orchid' or i_color = 'yellow') and
        (i_units = 'Case' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'seashell' or i_color = 'linen') and
        (i_units = 'Tbl' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'puff') and
        (i_units = 'Box' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'large')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 904 and 904+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navajo' or i_color = 'lemon') and 
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'ghost') and
        (i_units = 'Gross' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'indian' or i_color = 'mint') and
        (i_units = 'Cup' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'chiffon' or i_color = 'pale') and
        (i_units = 'Tsp' or i_units = 'Lb') and
        (i_size = 'large' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'purple' or i_color = 'tomato') and 
        (i_units = 'Ton' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'green' or i_color = 'turquoise') and
        (i_units = 'Ounce' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'rose') and
        (i_units = 'N/A' or i_units = 'Dozen') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'peach') and
        (i_units = 'Pound' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 917 and 917+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'drab' or i_color = 'midnight') and 
        (i_units = 'Dram' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'cyan' or i_color = 'yellow') and
        (i_units = 'Pound' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'wheat' or i_color = 'powder') and
        (i_units = 'Gram' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'pink') and
        (i_units = 'Unknown' or i_units = 'Lb') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'seashell' or i_color = 'plum') and 
        (i_units = 'Carton' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'olive' or i_color = 'dark') and
        (i_units = 'Each' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lemon' or i_color = 'blue') and
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'grey') and
        (i_units = 'Tsp' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 715 and 715+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'goldenrod' or i_color = 'turquoise') and 
        (i_units = 'Oz' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'antique' or i_color = 'rosy') and
        (i_units = 'Tbl' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'orange') and
        (i_units = 'Ton' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'red') and
        (i_units = 'Pallet' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'grey') and 
        (i_units = 'Dram' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'navajo' or i_color = 'burnished') and
        (i_units = 'Gross' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'misty') and
        (i_units = 'Pound' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'smoke' or i_color = 'chartreuse') and
        (i_units = 'Ounce' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 693 and 693+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'frosted' or i_color = 'honeydew') and 
        (i_units = 'Bunch' or i_units = 'Tbl') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'sky') and
        (i_units = 'Case' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'orchid') and
        (i_units = 'Ounce' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'antique' or i_color = 'floral') and
        (i_units = 'Gross' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'seashell' or i_color = 'dark') and 
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'grey' or i_color = 'beige') and
        (i_units = 'Cup' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'linen' or i_color = 'lime') and
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'peru') and
        (i_units = 'Carton' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 LIMIT 100;



select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 938 and 938+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'olive' or i_color = 'pink') and 
        (i_units = 'Gross' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'lawn' or i_color = 'violet') and
        (i_units = 'Dram' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'dim') and
        (i_units = 'Box' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'spring') and
        (i_units = 'Pallet' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sandy' or i_color = 'navy') and 
        (i_units = 'Tbl' or i_units = 'Oz') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'white' or i_color = 'tomato') and
        (i_units = 'Each' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'deep') and
        (i_units = 'Gram' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'forest') and
        (i_units = 'Unknown' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'small')
        )))) > 0
 order by i_product_name
 LIMIT 100;


