{% snapshot claims_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='claim_id',
    strategy='timestamp',
    updated_at='dbt_updated_at'
  )
}}

select * from {{ ref('claims_stg') }}

{% endsnapshot %}
