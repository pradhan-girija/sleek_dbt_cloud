{{ config(materialized='table') }}

select
    c.customer_id,
    c.customer_name,
    p.policy_id,
    cl.claim_id,
    cl.claim_date,
    cl.claim_amount,
    cl.claim_severity,
    cl.loss_date
from {{ ref('customer_stg') }} c
join {{ ref('policies_stg') }} p
  on c.customer_id = p.customer_id
join {{ ref('claims_stg') }} cl
  on p.policy_id = cl.policy_id