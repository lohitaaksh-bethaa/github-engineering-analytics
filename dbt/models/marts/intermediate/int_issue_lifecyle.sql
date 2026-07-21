{{ config(
    materialized='view'
) }}

SELECT
    issue_id,
    repository_name,
    author,
    state,
    comments,
    labels,
    created_at,
    updated_at,
    closed_at,

    DATEDIFF(
        'day',
        created_at,
        closed_at
    ) AS resolution_time_days,

    DATEDIFF(
        'day',
        created_at,
        CURRENT_DATE()
    ) AS issue_age_days

FROM {{ ref('stg_issues') }}