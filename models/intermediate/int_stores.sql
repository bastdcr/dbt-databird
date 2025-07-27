select
    store_id,
    store_name,
    phone,
    email,
    concat(street," ",city," ",state," ",zip_code) as full_adress
from {{ ref('stg_stores') }}