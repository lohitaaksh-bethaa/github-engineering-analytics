select
    issue_id,
    repository_id,
    repository_name,
    title,
    state,
    author,
    created_at,
    updated_at,
    closed_at,
    comments,
    labels,
    ingestion_timestamp
from {{ source('raw', 'issues') }}