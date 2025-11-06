SELECT 
FORMAT_DATE('%Y-%m', date_date) as datemonth,
    revenue,
    margin,
    ads_cost,
    ads_clicks,
    ads_impression,
    operational_margin,
    ads_margin,
    average_basket,
    purchase_cost,
    shipping_fee,
    log_cost,
    ship_cost,
    quantity
FROM {{ ref('finance_campaigns_day') }}

