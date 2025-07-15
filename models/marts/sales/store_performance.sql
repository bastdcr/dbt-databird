{{ config(materialized='table') }}

SELECT 
    s.store_id,
    s.store_name,
    s.city,
    s.state,
    COUNT(DISTINCT om.order_id) as total_orders,
    SUM(om.order_total) as total_revenue,
    ROUND(AVG(om.order_total), 2) as avg_order_value,
    COUNT(DISTINCT om.customer_id) as unique_customers,
    ROUND(SUM(om.order_total) / COUNT(DISTINCT om.customer_id), 2) as revenue_per_customer
FROM {{ ref('stg_stores') }} s
LEFT JOIN {{ ref('int_order_metrics') }} om ON s.store_id = om.store_id
GROUP BY 1,2,3,4
ORDER BY total_revenue DESC