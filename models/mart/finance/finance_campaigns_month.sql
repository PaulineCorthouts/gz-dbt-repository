SELECT 
FORMAT_DATE('%Y-%m', date_date) as datemonth,
    SUM(revenue) as revenue,
    SUM(margin) as margin,
    SUM(ads_cost) as ads_cost,
    SUM(ads_clicks) as ads_clicks,
    SUM(ads_impression) as ads_impression,
    SUM(operational_margin) as operational_margin,
    SUM(ads_margin) as ads_margin,
    AVG(average_basket) as average_basket,
    SUM(purchase_cost) as purchase_cost,
    SUM(shipping_fee) as shipping_fee,
    SUM(log_cost) as log_cost,
    SUM(ship_cost) as ship_cost,
    SUM(quantity) as quantity
FROM {{ ref('finance_campaigns_day') }}

