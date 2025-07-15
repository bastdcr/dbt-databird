{{ config(materialized='view') }}

SELECT 
    o.order_id,
    o.customer_id,
    o.store_id,
    o.staff_id,
    o.order_date,
    o.order_status,
    SUM(oi.quantity) as total_items,
    SUM(oi.net_amount) as order_total,
    COUNT(oi.item_id) as unique_products,
    AVG(oi.net_amount) as avg_item_value
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_order_items') }} oi ON o.order_id = oi.order_id
GROUP BY 1,2,3,4,5,6