SELECT query_name,
ROUND(AVG(rating * 1.00 /position),2) as quality,
ROUND(AVG(CASE WHEN rating >= 3 THEN 0.0 ELSE 100.0 END),2) AS poor_query_percentage
from Queries
GROUP BY query_name;