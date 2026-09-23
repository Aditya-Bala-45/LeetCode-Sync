-- Write your PostgreSQL query statement below
SELECT user_id AS buyer_id,join_date,
COALESCE(orders_in_2019,0) AS orders_in_2019
FROM Users u
LEFT JOIN
(
SELECT COUNT(*) AS orders_in_2019,buyer_id FROM 
Orders
WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY buyer_id)t
ON u.user_id=t.buyer_id
ORDER BY buyer_id;
