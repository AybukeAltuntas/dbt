select
    date_date,
    orders_id,
    sum(quantity) as total_quantity,
    sum(quantity * purchase_price) as total_purchase_cost,
    sum(revenue) as total_revenue,
    sum(revenue - (quantity * purchase_price)) as total_margin
from {{ ref('int_sales_margin') }}
group by orders_id,date_date
