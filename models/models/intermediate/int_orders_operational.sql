-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

WITH cost AS(
SELECT 
orders_id, 
date_date,
margin,
shipping_fee,
quantity,
logcost,
ship_cost,
purchase_cost,
revenue,
FROM {{ ref('int_orders_margin') }} as o
INNER JOIN {{ ref('stg_raw__ship') }} as s
USING (orders_id)
)
SELECT
orders_id,
MAX(date_date) as date_date, 
SUM(margin) as margin, 
SUM(quantity) as quantity, 
round(sum(purchase_cost),2) as purchase_cost, 
SUM(revenue) as revenue,
SUM(shipping_fee) as shipping_fee, 
SUM(logcost) as log_cost, 
SUM(ship_cost) as ship_cost,
ROUND(SUM (margin+shipping_fee-logcost-ship_cost),2) as operational_margin
FROM cost as c
GROUP BY orders_id
ORDER BY date_date DESC, orders_id DESC
