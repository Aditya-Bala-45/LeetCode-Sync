(WITH cte AS
(SELECT m.user_id,COUNT(m.user_id) AS num,u.name
FROM MovieRating m LEFT JOIN Users u
ON m.user_id=u.user_id
GROUP BY m.user_id,u.name
ORDER BY num DESC,name)

SELECT name AS results 
FROM cte
LIMIT 1)

UNION ALL

(WITH ct AS
(SELECT m.movie_id,ROUND(AVG(m.rating),2) AS Average ,s.title
FROM MovieRating m LEFT JOIN Movies s
ON m.movie_id=s.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY m.movie_id,s.title
ORDER BY Average DESC,s.title)

SELECT title FROM ct
LIMIT 1)

;