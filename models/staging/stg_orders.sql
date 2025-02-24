select order_id,
customer_id,
order_status,
order_purchase_timestamp as purchase_time,
order_approved_at as approval_time,
order_delivered_carrier_date as shipping_start,
order_delivered_customer_date as actual_deliverdate,
order_estimated_delivery_date as estimate_deliverdate
from {{source('ecom','raw_orders_dataset')}}