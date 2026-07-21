{{ config(materialized='table') }}

select
    md5(cast(pr_id as varchar)) as pull_request_key,
    pr_id,
    title,
    state,
    author,
    is_merged
from {{ ref('stg_pull_requests') }}