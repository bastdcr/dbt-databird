SELECT
    s.store_name,
    COUNT(distinct o.order_id) as orders_count

FROM {{ ref('int_stores') }} as s
LEFT JOIN {{ ref('int_orders') }} as o
    ON s.store_id = o.store_id

GROUP BY s.store_name