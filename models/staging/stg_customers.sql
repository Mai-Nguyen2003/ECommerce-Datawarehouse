select
customer_id,
customer_unique_id as cust_uniqueId,
customer_city,
customer_state
from {{source('ecom','raw_customers_dataset')}}


