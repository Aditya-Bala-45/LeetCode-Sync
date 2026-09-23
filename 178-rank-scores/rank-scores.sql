SELECT score,rank
FROM
(SELECT DENSE_RANK() OVER (ORDER BY score DESC) rank,
score FROM Scores)t
ORDER BY rank;