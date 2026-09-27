WITH cte AS(SELECT s.product_id,s.sale_date,s.quantity,s.price,
p.category,
CASE WHEN EXTRACT(MONTH FROM sale_date) IN (1,2,12) THEN 'Winter'
WHEN EXTRACT(MONTH FROM sale_date) IN (3,4,5) THEN 'Spring'
WHEN EXTRACT(MONTH FROM sale_date) IN (6,7,8) THEN 'Summer'
WHEN EXTRACT(MONTH FROM sale_date) IN (9,10,11) THEN 'Fall'
END AS season
FROM sales s JOIN products p
ON s.product_id=p.product_id)



SELECT season,category,total_quantity,total_revenue
FROM
(SELECT *,
ROW_NUMBER() OVER (PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC , category) AS rn 
FROM(SELECT season,category,SUM(quantity) AS total_quantity,
SUM(quantity*price) AS total_revenue
FROM cte 
GROUP BY season,category)t)x
WHERE rn=1

