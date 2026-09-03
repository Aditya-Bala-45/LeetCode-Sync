SELECT d.name AS Department ,e.name AS Employee,
e.salary AS Salary FROM Employee e
JOIN
(SELECT MAX(salary) AS max_salary,departmentId
FROM Employee
GROUP BY departmentId)m
ON e.salary=m.max_salary AND e.departmentId=m.departmentId
JOIN Department d ON e.departmentId=d.id;
