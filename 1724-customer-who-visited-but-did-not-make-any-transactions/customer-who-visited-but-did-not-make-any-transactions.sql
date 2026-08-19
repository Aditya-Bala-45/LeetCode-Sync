-- Write your PostgreSQL query statement below
select 
customer_id,count(Visits.visit_id) as count_no_trans
from Visits 
left join Transactions on 
Visits.visit_id=Transactions.visit_id
where Transactions.transaction_id IS NULL 
group by customer_id
order by count_no_trans;