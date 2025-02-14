{% snapshot shipment_snapshot %} 
    {{
        config(
            target_database = env_var('DBT_SOURCE_DB','QWT_ANALYTICS_DEV'),
            schema = env_var('DBT_SNP_SCHEMA','snapshot_dev'),
            unique_key = "orderid||'-'||lineno",
            strategy = 'timestamp',
            updated_at = 'shipmentdate'
        )
    }} 
    select *
    from {{ ref('stg_shipments') }}
 
{% endsnapshot %}