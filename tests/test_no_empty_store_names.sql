-- Test que le nom du magasin n'est pas vide
select *
from {{ ref('order_metrics') }}
where store_name = '' 
   or trim(store_name) = ''