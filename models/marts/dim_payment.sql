select distinct order_id, payment_sequential, payment_type,
sum(payment_value) over( partition by (order_id, payment_type)) as payprice_per_type
from {{ ref("stg_order_payment")}}
