SELECT 
  repository_id,
  repository_name,
  full_name,
  language,
  cast(created_at as timestamp) as created_at,
  cast(updated_at as timestamp) as updated_at,
  cast(pushed_at as timestamp) as pushed_at,
  stars,
  forks,
  watchers,
  open_issues
  default_branch,
  ingestion_timestamp
FROM {{ source('raw', 'repositories') }}
