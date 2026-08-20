SELECT Signups.user_id,

ROUND(COALESCE(SUM(CASE WHEN action='confirmed' THEN 1 ELSE 0 END) * 1.0 /
NULLIF(COUNT(action),0),0),2) as confirmation_rate
from Signups left join Confirmations on 
Signups.user_id=Confirmations.user_id
GROUP BY Signups.user_id;

