SELECT
    repository_id,
    repository_name,
    full_name,
    language,
    CAST(created_at AS TIMESTAMP) AS created_at,
    CAST(updated_at AS TIMESTAMP) AS updated_at,
    CAST(pushed_at AS TIMESTAMP) AS pushed_at,
    stars,
    forks,
    watchers,
    open_issues,
    default_branch,
    ingestion_timestamp
FROM {{ source('raw', 'repositories') }}