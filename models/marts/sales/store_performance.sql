-- Performance globale des magasins
{{ config(
    materialized='table',
    description='Analyse de performance des magasins avec métriques de vente et clients'
) }}

WITH store_metrics AS (
    SELECT 
        s.store_id,
        s.store_name,
        s.city,
        s.state,
        COUNT(DISTINCT o.order_id) as total_orders,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as total_revenue,
        ROUND(AVG(oi.quantity * oi.list_price * (1 - oi.discount)), 2) as avg_order_value,
        COUNT(DISTINCT o.customer_id) as unique_customers
    FROM {{ ref('stores') }} s
    LEFT JOIN {{ ref('orders') }} o ON s.store_id = o.store_id
    LEFT JOIN {{ ref('order_items') }} oi ON o.order_id = oi.order_id
    GROUP BY s.store_id, s.store_name, s.city, s.state
)

SELECT 
    *,
    ROUND(total_revenue / NULLIF(unique_customers, 0), 2) as revenue_per_customer
FROM store_metrics
ORDER BY total_revenue DESC