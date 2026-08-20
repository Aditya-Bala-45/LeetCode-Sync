-- Write your PostgreSQL query statement below
SELECT project_id,ROUND(AVG(e.experience_years),2) as average_years
from Project as p left join Employee as e 
on p.employee_id=e.employee_id
GROUP BY project_id
ORDER BY average_years;