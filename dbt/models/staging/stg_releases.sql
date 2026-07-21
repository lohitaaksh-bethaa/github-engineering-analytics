select
    release_id,
    repository_id,
    repository_name,
    release_name,
    tag_name,
    author,
    draft,
    prerelease,
    created_at,
    published_at,
    ingestion_timestamp
from {{ source('raw', 'releases') }}