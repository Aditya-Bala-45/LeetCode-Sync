WITH cte AS(SELECT p.employee_id,p.rating,e.name,
ROW_NUMBER()OVER (PARTITION BY p.employee_id ORDER BY p.review_date DESC) rn
FROM performance_reviews p JOIN
employees e ON
e.employee_id=p.employee_id),
cte2 AS
(SELECT employee_id,name,rn,rating-LEAD(rating,2) OVER (PARTITION BY employee_id ORDER BY rn) AS improvement_score,
rating-LEAD(rating,1) OVER (PARTITION BY employee_id ORDER BY rn) AS f_diff,
LEAD(rating,1) OVER (PARTITION BY employee_id ORDER BY rn)-LEAD(rating,2) OVER (PARTITION BY employee_id ORDER BY rn) AS s_diff
FROM cte)

SELECT employee_id,name,improvement_score
FROM cte2
WHERE rn=1 AND f_diff>0 AND s_diff>0
ORDER BY improvement_score DESC ,name
