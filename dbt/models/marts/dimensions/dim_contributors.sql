{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['contributor_id']) }} as contributor_key,
    contributor_id,
    login,
    contributor_type,
    avatar_url
from {{ ref('stg_contributors') }}