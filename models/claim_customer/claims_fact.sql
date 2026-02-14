{{ config(
    materialized='incremental',
    unique_key='claim_id'
) }}

-- select *
-- from {{ ref('claims_stg') }}
select *
from (
    select
        *,
        row_number() over (
            partition by claim_id
            order by loss_date desc
        ) as rn
    from {{ ref('claims_stg') }}
)
where rn = 1

-- {% if is_incremental() %}
-- where dbt_updated_at > (select max(dbt_updated_at) from {{ this }})
-- {% endif %}

