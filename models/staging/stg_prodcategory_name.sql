select product_category_name as prodcat_name,
product_category_name_english as category
from {{source('ecom','raw_product_category_name_translation')}}