SELECT t.id,
(CASE WHEN t.p_id IS NULL THEN 'Root'
     WHEN NOT EXISTS(SELECT 1 FROM Tree t2
     where t2.p_id=t.id) THEN 'Leaf'
     ELSE 'Inner'
     END)type
FROM Tree t;