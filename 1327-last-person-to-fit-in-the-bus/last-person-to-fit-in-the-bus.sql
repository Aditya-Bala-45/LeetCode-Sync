WITH cte AS(
SELECT person_name,turn,(SUM(weight) OVER 
(ORDER BY turn)) AS cumulat 
FROM Queue
ORDER BY cumulat DESC
)

SELECT person_name FROM cte 
WHERE cumulat<=1000 
limit 1
;