SELECT m.reports_to AS employee_id,e.name,count(e.employee_id) AS reports_count,
ROUND(AVG(m.age)) as average_age FROM Employees m
join Employees e ON m.reports_to=e.employee_id
GROUP BY m.reports_to,e.name
ORDER BY employee_id
;