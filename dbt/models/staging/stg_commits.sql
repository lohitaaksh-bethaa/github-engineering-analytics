select
    commit_sha,
    repository_id,
    repository_name,
    author,
    commit_message,
    commit_date,
    additions,
    deletions,
    total_changes,
    ingestion_timestamp
from {{ source('raw', 'commits') }}