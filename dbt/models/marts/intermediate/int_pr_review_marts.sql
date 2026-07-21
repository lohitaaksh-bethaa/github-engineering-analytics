{{ config(
    materialized='view'
) }}

SELECT
    pr_id,
    repository_name,
    author,
    state,
    is_merged,
    commits,
    additions,
    deletions,
    changed_files,
    created_at,
    merged_at,
    closed_at,

    DATEDIFF(
        'hour',
        created_at,
        closed_at
    ) AS review_time_hours,

    DATEDIFF(
        'hour',
        created_at,
        merged_at
    ) AS merge_time_hours

FROM {{ ref('stg_pull_requests') }}