WITH cte AS (
    SELECT 
        managerId,
        COUNT(managerId) AS C
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
    
)

SELECT f.name
FROM cte
INNER JOIN Employee f
    ON cte.managerId = f.id;