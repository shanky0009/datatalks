{{ config(materialized='view') }}

select * 
from {{ source('staging', 'innings_data') }}
where 
match_id in (select match_id from {{ source('staging', 'match_info') }} where match_type = 'Test')