select
    contributor_id,
    repository_id,
    repository_name,
    login,
    contributions,
    avatar_url,
    contributor_type,
    ingestion_timestamp
from {{ source('raw', 'contributors') }}