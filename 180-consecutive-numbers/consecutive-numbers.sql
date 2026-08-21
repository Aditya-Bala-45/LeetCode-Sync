WITH cte AS(SELECT num,LEAD(num) OVER (ORDER BY id) AS next_num,
LEAD(num,2) OVER (ORDER BY id) AS next_num2
from Logs)

SELECT DISTINCT num AS ConsecutiveNums from cte 
WHERE num=next_num
and num=next_num2;
