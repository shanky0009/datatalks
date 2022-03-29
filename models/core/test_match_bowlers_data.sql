{{ config(materialized='table') }}

select 
    d.match_id, 
    d.over, 
    d.ball_no,
    d.bowler, 
    item.kind, 
    item.player_out
from {{ ref('test_match_wickets_data') }} as d
cross join unnest(wickets.list)