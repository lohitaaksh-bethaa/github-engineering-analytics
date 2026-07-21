{{ config(
    materialized='incremental',
    unique_key='pr_id'
) }}

SELECT

    dr.repository_key,
    dd.date_key,

    pr.pr_id,
    pr.author,
    pr.state,
    pr.is_merged,
    pr.commits,
    pr.additions,
    pr.deletions,
    pr.changed_files,

    DATEDIFF(
        'hour',
        pr.created_at,
        pr.closed_at
    ) AS review_time_hours,

    DATEDIFF(
        'hour',
        pr.created_at,
        pr.merged_at
    ) AS merge_time_hours

FROM {{ ref('stg_pull_requests') }} pr

LEFT JOIN {{ ref('dim_repository') }} dr
ON pr.repository_name = dr.repository_name

LEFT JOIN {{ ref('dim_date') }} dd
ON CAST(pr.created_at AS DATE)=dd.full_date

{%if is_incremental() %}

    WHERE pr.updated_at >
    (
        SELECT COALESCE(MAX(created_at), '1900-01-01')
        FROM {{ this }}
    )
{% endif %}