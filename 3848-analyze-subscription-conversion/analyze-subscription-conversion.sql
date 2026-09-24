WITH T AS (SELECT user_id,ROUND(AVG(activity_duration),2) AS trial_avg_duration FROM UserActivity WHERE 
activity_type='free_trial' 
GROUP BY user_id
),

P AS (SELECT user_id,ROUND(AVG(activity_duration),2) AS paid_avg_duration FROM UserActivity WHERE 
activity_type='paid' 
GROUP BY user_id
)


SELECT T.user_id,
T.trial_avg_duration,
P.paid_avg_duration
FROM T JOIN P ON T.user_id = P.user_id
