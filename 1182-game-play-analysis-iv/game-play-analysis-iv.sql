WITH cte AS
(SELECT player_id,MIN(event_date) AS first_log
FROM Activity
--WHERE games_played>0
GROUP BY player_id)

SELECT 
ROUND(COUNT(DISTINCT CASE WHEN (event_date=first_log + INTERVAL '1 DAY'
--AND games_played>0
) THEN a.player_id  END) * 1.00/(SELECT  COUNT(DISTINCT Activity.player_id) FROM Activity),2) AS fraction
FROM Activity a LEFT JOIN cte
ON a.player_id=cte.player_id

;