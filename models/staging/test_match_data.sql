{{ config(materialized='view') }}

select * 
from {{ source('staging', 'innings_overs_2004') }}
where 
match_id in (select match_id from {{ source('staging', 'match_info_2004') }} where match_type = 'Test');