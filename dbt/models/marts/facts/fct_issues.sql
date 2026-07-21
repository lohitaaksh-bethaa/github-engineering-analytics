{{ config(
    materialized='incremental',
    unique_key='issue_id'
) }}

SELECT

    dr.repository_key,

    dd.date_key,

    i.issue_id,
    i.author,
    i.state,
    i.comments,

    DATEDIFF(
        'day',
        i.created_at,
        i.closed_at
    ) AS resolution_time,

    DATEDIFF(
        'day',
        i.created_at,
        CURRENT_DATE()
    ) AS issue_age

FROM {{ ref('stg_issues') }} i

LEFT JOIN {{ ref('dim_repository') }} dr
ON i.repository_name = dr.repository_name

LEFT JOIN {{ ref('dim_date') }} dd
ON CAST(i.created_at AS DATE)=dd.full_date

{% if is_incremental() %}

    WHERE i.updated_at >
    (
        SELECT COALESCE(MAX(created_at), '1900-01-01')
        FROM {{ this }}
    )
{% endif %}