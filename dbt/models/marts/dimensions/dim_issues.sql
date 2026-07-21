{{ config(materialized='table') }}

select
    md5(cast(issue_id as varchar)) as issue_key,
    issue_id,
    title,
    state,
    author,
    labels
from {{ ref('stg_issues') }}