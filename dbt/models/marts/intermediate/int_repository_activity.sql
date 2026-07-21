{{ config(
    materialized='view'
) }}

SELECT
     repository_name,
    COUNT(DISTINCT commit_sha) AS commits,
    SUM(additions) AS total_additions,
    SUM(deletions) AS total_deletions,
    SUM(total_changes) AS total_changes,
    MIN(commit_date) AS first_commit,
    MAX(commit_date) AS latest_commit

FROM {{ ref('stg_commits') }} 
GROUP BY repository_name