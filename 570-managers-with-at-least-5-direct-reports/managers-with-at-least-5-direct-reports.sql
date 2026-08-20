-- Write your PostgreSQL query statement below
WITH cte AS(
Select e.managerId,s.name,count(e.id) as direct from Employee as e
join Employee as s on e.managerId=s.id
where e.managerId is NOT NULL 
group by e.managerId,s.name)
SELECT name from cte
where direct >= 5
;