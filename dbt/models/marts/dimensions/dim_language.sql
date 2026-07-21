{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['language']) }} as language_key,
    language as language_name
from {{ ref('stg_repositories') }}
where language is not null
group by language