{{ config(materialized='view') }}

SELECT 
    order_id,
    customer_id,
    order_status,
    CAST(order_date AS DATE) as order_date,
    CAST(required_date AS DATE) as required_date,
    CAST(shipped_date AS DATE) as shipped_date,
    store_id,
    staff_id
FROM {{ source('raw', 'orders') }}
WHERE order_date IS NOT NULL