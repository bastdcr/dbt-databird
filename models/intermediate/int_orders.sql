select
    order_id,
    customer_id,
    order_status,
    coalesce(order_date, required_date) as order_date,
    store_id
from {{ ref('stg_orders') }}