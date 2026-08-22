WITH cte AS
(SELECT customer_id,MIN(order_date) AS ord,MIN(customer_pref_delivery_date) AS pref
FROM Delivery
GROUP BY customer_id)
SELECT 
ROUND(AVG(CASE WHEN ord=pref THEN 100.00 ELSE 0.00 END),2)  AS immediate_percentage 
FROM cte;
;