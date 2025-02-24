with order_items as (
Select  distinct order_id,product_id,seller_id,
count(*) over( partition by (order_id,product_id,seller_id) ) as quantity,
price, freight_value,
{{ total_price('quantity','price','freight_value') }} as total_order_price
from {{ref('stg_order_items')}}
),
payment_types as (
select order_id,
LISTAGG(distinct payment_type, ', ') AS payment_methods
from {{ ref('dim_payment') }}
group by order_id
), fact as(
select  order_id,do.customer_id, product_id, seller_id, 
o.quantity, o.total_order_price, p.payment_methods,do.purchase_time
from order_items as o
join payment_types as p using (order_id)
join {{ref('dim_order')}} as do using (order_id)
join {{ref('dim_seller')}} using(seller_id)
join {{ref('dim_product')}} using(product_id)
join {{(ref('dim_customer'))}} as dc on dc.customer_id = do.customer_id
)

Select * from fact 
