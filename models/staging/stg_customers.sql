{{ config(materialized='view') }}

SELECT 
    customer_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) as full_name,
    phone,
    email,
    street,
    city,
    state,
    zip_code
FROM {{ source('raw', 'customers') }}