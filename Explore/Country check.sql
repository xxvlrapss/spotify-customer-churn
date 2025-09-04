-- 10 negara dengan user terbanyak
SELECT country, COUNT(*) AS n_users,
       SUM(CASE WHEN churned=1 THEN 1 ELSE 0 END) AS churned_users,
       ROUND(100.0*SUM(CASE WHEN churned=1 THEN 1 ELSE 0 END)/COUNT(*),2) AS churn_rate
FROM spotify_churn
GROUP BY country
ORDER BY n_users DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
