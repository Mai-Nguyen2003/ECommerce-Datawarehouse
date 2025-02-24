select product_id,
product_category_name as prodcat_name,
product_name_lenght,
product_weight_g,
product_length_cm,
product_height_cm,
product_width_cm
from {{source('ecom','raw_products_dataset')}}


