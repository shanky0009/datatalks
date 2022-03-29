{{ config(materialized='table') }}

select 
    d.match_id, 
    d.over, 
    offset+1 as ball_no,
    item.batter, 
    item.bowler,
    item.runs.batter as runs_scored,
    item.non_striker,
    d.innings
from {{ ref('test_match_data') }} as d
cross join unnest(d.deliveries.list) with OFFSET as `offset`