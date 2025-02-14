{{ config(materialized="view", schema=env_var('DBT_RPT_SCHEMA',"reporting_dev"))}}

{% set lines = get_linenos() %}
select
    orderid,
    {% for linenumbers in lines %}
        sum(case when lineno = {{linenumbers }} then linesalesamount end) as lineno{{linenumbers}}_amount,
    {% endfor %}
    sum(linesalesamount) as total_amount
from {{ ref("fct_orders") }}
group by 1