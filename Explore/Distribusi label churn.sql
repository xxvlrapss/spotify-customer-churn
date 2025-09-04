-- distribusi churn vs tidak churn
SELECT churned, COUNT(*) AS n_users,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct
FROM spotify_churn
GROUP BY churned;
