-- Write your PostgreSQL query statement below
--
WITH t1 AS
(SELECT pid,tiv_2015,tiv_2016, COUNT(*) OVER (PARTITION BY tiv_2015) AS cnt_2015 FROM Insurance ),

t2 AS
(SELECT pid,tiv_2015,tiv_2016, COUNT(*) OVER (PARTITION BY lat,lon) AS loca FROM Insurance)
SELECT ROUND(SUM(t1.tiv_2016)::numeric,2) AS tiv_2016 FROM t2 
JOIN t1 on t2.pid=t1.pid
WHERE cnt_2015 > 1 AND loca=1;