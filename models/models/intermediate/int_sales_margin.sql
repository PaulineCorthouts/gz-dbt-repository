WITH sales AS(
    SELECT 
        *
    FROM {{ ref('stg_raw__sales') }} as s
    INNER JOIN {{ ref('stg_raw__product') }} as p
        USING (products_id)
),
purchase_cost AS(
    SELECT 
        products_id,
        date_date,
        orders_id,
        revenue,
        quantity,
        purchase_price, 
        (quantity*purchase_price) as purchase_cost
    FROM sales
)
SELECT 
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    purchase_price, 
    purchase_cost, 
    (revenue-purchase_cost) as margin
FROM purchase_cost as pc
