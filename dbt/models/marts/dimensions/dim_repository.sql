{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['repository_id']) }} as repository_key,
    repository_id,
    repository_name,
    full_name,
    language,
    default_branch,
    created_at,
    updated_at,
    pushed_at,
    stars,
    forks,
    watchers,
    open_issues

from {{ ref('stg_repositories') }}