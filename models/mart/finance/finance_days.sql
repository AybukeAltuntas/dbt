--{{ config(materialized='table') }}

select
  date_date,
  count(distinct orders_id) as total_orders,
  sum(total_revenue_per_order) as total_revenue,
  sum(total_revenue_per_order)/count(distinct orders_id) as avg_revenue_per_order,
  sum(operational_margin) as total_operational_margin,  -- ✅ eklendi
  sum(total_purchase_cost_per_order) as total_purchase_cost,
  sum(shipping_fee_per_order) as total_shipping_fee,
  sum(logcost_per_order) as total_log_cost,
  sum(total_quantity_per_order) as total_quantity
from {{ ref("int_orders_operational") }}
group by date_date
