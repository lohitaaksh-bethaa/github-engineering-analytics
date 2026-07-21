{{ config(
    materialized='view'
) }}

SELECT

    release_id,
    repository_name,
    release_name,
    tag_name,
    author,
    draft,
    prerelease,
    created_at,
    published_at,

    LAG(published_at)
        OVER (
            PARTITION BY repository_name ORDER BY published_at
        ) AS previous_release,

    DATEDIFF(
        'day',
        LAG(published_at)
            OVER (
                PARTITION BY repository_name ORDER BY published_at
            ),
        published_at
    ) AS days_since_previous_release

FROM {{ ref('stg_releases') }}