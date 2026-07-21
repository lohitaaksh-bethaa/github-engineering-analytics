{{ config(
    materialized='incremental',
    unique_key='release_id'
) }}

SELECT

    dr.repository_key,

    dd.date_key,

    r.release_id,
    r.release_name,
    r.tag_name,
    r.author,
    r.draft,
    r.prerelease,
    r.created_at,
    r.published_at,

    1 AS release_frequency

FROM {{ ref('stg_releases') }} r

LEFT JOIN {{ ref('dim_repository') }} dr
ON r.repository_name = dr.repository_name

LEFT JOIN {{ ref('dim_date') }} dd
ON CAST(r.published_at AS DATE)=dd.full_date

{% if is_incremental() %}

    WHERE r.published_at >
    (
        SELECT COALESCE(MAX(published_at), '1900-01-01')
        FROM {{ this }}
    )
{% endif %}