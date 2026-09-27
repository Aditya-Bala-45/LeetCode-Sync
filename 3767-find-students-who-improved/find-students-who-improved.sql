SELECT * FROM
(SELECT student_id,subject,
MAX(CASE WHEN rn1=1 THEN score END) AS first_score,
MAX(CASE WHEN rn2=1 THEN score END) AS latest_score
FROM
(SELECT student_id,subject,score,
ROW_NUMBER() OVER (PARTITION BY student_id,subject ORDER BY 
exam_date) AS rn1,
ROW_NUMBER() OVER (PARTITION BY student_id,subject ORDER BY 
exam_date DESC) AS rn2
FROM Scores)t
GROUP BY student_id,subject)x
WHERE latest_score > first_score
