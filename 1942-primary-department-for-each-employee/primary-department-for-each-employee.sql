SELECT employee_id,department_id
FROM Employee e
WHERE primary_flag='Y' OR (SELECT COUNT(department_id) FROM 
Employee WHERE employee_id=e.employee_id)=1;