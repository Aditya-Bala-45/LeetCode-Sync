SELECT DISTINCT customer_id from Customer c
WHERE (SELECT COUNT( DISTINCT product_key) FROM Customer WHERE
customer_id=c.customer_id)=(SELECT COUNT(product_key) FROM Product)
;