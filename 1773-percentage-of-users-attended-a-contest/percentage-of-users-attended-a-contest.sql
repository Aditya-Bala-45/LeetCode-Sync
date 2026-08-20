SELECT r.contest_id, ROUND(COUNT(DISTINCT r.user_id) * 100.00 /(SELECT COUNT(*) from Users),2 ) AS percentage from Users as u 
join Register as r on u.user_id=r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC,r.contest_id;
