select
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    store_id
from {{ source('localBike', 'orders') }}