SELECT
orders_id, 
MAX(date_date) as date_date, 
ROUND(SUM(revenue),2) as revenue,
SUM(quantity) as quantity, 
round(sum(purchase_cost),2) as purchase_cost, 
round(sum(margin), 2) as margin
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id
ORDER BY date_date DESC, orders_id DESC