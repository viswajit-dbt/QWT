{{ config(materialized="view", schema=env_var('DBT_SM_SCHEMA','salesmart_dev'))}}
 
select *
from {{ ref("trf_customers") }}