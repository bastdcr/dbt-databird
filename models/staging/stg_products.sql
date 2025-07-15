{{ config(materialized='view') }}

SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price
FROM {{ source('raw', 'products') }}