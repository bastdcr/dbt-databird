SELECT
  
  store_name,
  count(order_id) as orders_count
  

FROM {{ ref('int_orders') }} as o
join {{ ref('int_stores') }} as s
on o.store_id = s.store_id

group by store_name