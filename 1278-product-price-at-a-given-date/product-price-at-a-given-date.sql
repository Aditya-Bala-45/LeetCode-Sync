SELECT DISTINCT p.product_id,COALESCE(t.new_price,10) AS price
FROM
(SELECT product_id,new_price,change_date,
RANK() OVER 
(PARTITION BY product_id ORDER BY change_date DESC) AS rnk
FROM Products
WHERE change_date <= '2019-08-16' 
)t
RIGHT JOIN Products p
ON t.product_id=p.product_id
AND rnk=1
