
with cte as(
select id,recordDate,temperature,
LAG(temperature) OVER (ORDER BY recordDate) as previous_temp,
LAG(recordDate) OVER (ORDER BY recordDate) as previous_date
from Weather 
)
Select id from cte
where temperature > previous_temp
AND recordDate=previous_date + INTERVAL '1 DAY'
order by id;