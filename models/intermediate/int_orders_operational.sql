select
    date_date,
    orders_id,
    sum(total_quantity) as total_quantity_per_order,
    sum(total_revenue) as total_revenue_per_order,
    sum(total_purchase_cost) as total_purchase_cost_per_order,
    sum(total_revenue - total_purchase_cost) as total_margin_per_order,
    sum(cast(ship_cost as float64)) as ship_cost_total_per_order,
    sum(cast(shipping_fee as float64)) as shipping_fee_per_order,
    sum(cast(logcost as float64)) as logcost_per_order,
    sum(total_revenue - total_purchase_cost)
      + sum(cast(shipping_fee as float64))
      - sum(cast(logcost as float64))
      - sum(cast(ship_cost as float64)) as operational_margin
from {{ ref('int_orders_margin') }}
join {{ ref('stg_raw__ship') }}
using(orders_id)
group by orders_id,date_date


