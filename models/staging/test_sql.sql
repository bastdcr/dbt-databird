select
    customer_id
from {{ source('localBike', 'customers') }}