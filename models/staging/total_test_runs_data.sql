{{ config(materialized='view') }}

select item.batter, sum(item.runs.batter) as total_runs
-- from `forward-camera-339110.cric_test.innings_overs_2004`
from {{ source('staging', 'innings_overs_2004') }}
cross join unnest(deliveries.list)
group by item.batter
order by total_runs desc