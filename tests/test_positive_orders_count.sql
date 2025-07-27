-- Test que le nombre de commandes est toujours positif ou zéro
select *
from {{ ref('order_metrics') }}
where orders_count < 0