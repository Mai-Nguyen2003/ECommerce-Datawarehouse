select seller_id, 
seller_state,
seller_city
from {{source('ecom','raw_sellers_dataset')}}
