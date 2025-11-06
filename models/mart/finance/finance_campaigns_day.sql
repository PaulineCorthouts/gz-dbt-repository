SELECT
date_date,
    revenue,
    margin,
    ads_cost,
    click as ads_clicks,
    impression as ads_impression,
    operational_margin,
    (operational_margin-ads_cost) as ads_margin,
    average_basket,
    purchase_cost,
    shipping_fee,
    log_cost,
    ship_cost,
    quantity
FROM {{ ref('finance_days') }}
INNER JOIN {{ ref('int_campaigns_day') }}
USING (date_date)
