select pr.product_id,
pc.category,
pr.product_weight_g as weight,
pr.product_length_cm as length,
pr.product_height_cm as height,
pr.product_width_cm as width 
from {{ ref('stg_prodcategory_name')}} as pc
inner join {{ ref("stg_products")}} as pr
using (prodcat_name) 