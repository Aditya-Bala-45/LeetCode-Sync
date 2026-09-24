SELECT p1.product_id AS product1_id,
p2.product_id AS product2_id,
pi.category AS product1_category,
pi2.category AS product2_category
,COUNT(*) AS customer_count FROM
ProductPurchases p1 JOIN ProductPurchases p2
ON p1.user_id=p2.user_id AND
p1.product_id < p2.product_id
JOIN ProductInfo pi
ON p1.product_id=pi.product_id
JOIN ProductInfo pi2
ON p2.product_id = pi2.product_id

GROUP BY p1.product_id,p2.product_id,pi.category,pi2.category
HAVING COUNT(*) > 2
ORDER BY customer_count DESC,p1.product_id,p2.product_id
