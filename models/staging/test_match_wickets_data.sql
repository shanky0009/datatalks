{{ config(materialized='view') }}

select 
    d,match_id, 
    d.innings, 
    d.over, 
    offset+1 as ball_no, 
    item.bowler, 
    item.wickets
from {{ ref('test_match_data') }} as d
cross join unnest(deliveries.list) with OFFSET as `offset`
where item.wickets is not Null
