SELECT d.name AS Department,t.name AS Employee,t.salary AS Salary
FROM
(SELECT name,salary,departmentId,
DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY
salary DESC) rank
FROM Employee)t
JOIN Department d
ON t.departmentId=d.id
WHERE rank<=3
ORDER BY Salary DESC;