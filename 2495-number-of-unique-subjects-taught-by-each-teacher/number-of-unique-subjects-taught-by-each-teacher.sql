SELECT teacher_id, count(DISTINCT subject_id) AS cnt
from Teacher 
GROUP BY teacher_id;