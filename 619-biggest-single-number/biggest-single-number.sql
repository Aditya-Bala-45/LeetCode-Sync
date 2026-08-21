SELECT MAX(num) AS num from MyNumbers n
WHERE (SELECT COUNT(*) FROM MyNumbers
WHERE num=n.num) = 1
;