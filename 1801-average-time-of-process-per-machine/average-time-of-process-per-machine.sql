with cte as(
select machine_id,process_id,
MAX(case when activity_type='start' then timestamp  end) as start_time,
MAX(case when activity_type='end' then timestamp end) as 
end_time
from Activity
group by machine_id,process_id
)
SELECT machine_id, round(AVG(end_time-start_time)::numeric,3) as processing_time
from cte
group by machine_id
order by machine_id
; 