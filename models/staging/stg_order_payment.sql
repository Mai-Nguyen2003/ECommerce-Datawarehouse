select order_id,
payment_sequential,
payment_type,
payment_installments,
payment_value
from {{source('ecom','raw_order_payment_dataset')}}