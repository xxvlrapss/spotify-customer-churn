SELECT top_genre, 
       COUNT(*) AS n_users,
       SUM(CASE WHEN churned=1 THEN 1 ELSE 0 END) AS churned_users,
       ROUND(100.0*SUM(CASE WHEN churned=1 THEN 1 ELSE 0 END)/COUNT(*),2) AS churn_rate
FROM spotify_churn
GROUP BY top_genre
ORDER BY churn_rate DESC;
