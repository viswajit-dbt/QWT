{{config(materialized = 'incremental', unique_key = ['orderid'],
schema=env_var('DBT_STAGING_SCHEMA','STAGING_DEV')) }}
 
select *
from
{{source('raw_qwt','raw_orders')}}
 
{% if is_incremental() %}
 
where orderdate > (select max(orderdate) from {{this}} )
 
{% endif %}
