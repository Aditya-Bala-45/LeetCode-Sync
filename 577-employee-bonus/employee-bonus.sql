
SELECT name,Bonus from 
Employee left join Bonus on Employee.empId=Bonus.empId
where bonus < 1000 OR bonus IS NULL
order by name;