{{ config(
    materialized='incremental',
    unique_key='commit_sha'
) }}

SELECT

    dc.date_key,
    dr.repository_key,

    sc.commit_sha,
    sc.repository_id,
    sc.repository_name,
    sc.author,
    sc.commit_message,
    sc.additions,
    sc.deletions,
    sc.total_changes,
    sc.commit_date

FROM {{ ref('stg_commits') }} sc

LEFT JOIN {{ ref('dim_repository') }} dr
    ON sc.repository_id = dr.repository_id

LEFT JOIN {{ ref('dim_date') }} dc
    ON CAST(sc.commit_date AS DATE) = dc.full_date

{% if is_incremental() %}

WHERE sc.commit_date >
(
    SELECT COALESCE(MAX(commit_date), '1900-01-01')
    FROM {{ this }}
)

{% endif %}