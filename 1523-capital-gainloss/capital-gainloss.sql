SELECT stock_name,
SUM(CASE WHEN operation='Buy' THEN 0-price
           ELSE 0+price END)AS capital_gain_loss
           FROM Stocks
           GROUP BY stock_name