{{config(materialized='table', schema=env_var('DBT_SM_SCHEMA','salesmart_dev'))}}
{% set min_order_date=get_mindate()%}
{% set max_order_date= get_maxdate()%}
 
{{dbt_date.get_date_dimension(min_order_date,max_order_date)}}