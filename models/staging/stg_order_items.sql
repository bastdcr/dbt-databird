{{ config(materialized='view') }}

SELECT 
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount,
    ROUND(list_price * quantity * (1 - discount), 2) as net_amount
FROM {{ source('raw', 'order_items') }}
WHERE quantity > 0