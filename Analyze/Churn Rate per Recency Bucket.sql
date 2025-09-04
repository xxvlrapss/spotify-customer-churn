SELECT recency_bucket,
       COUNT(*) AS users,
       SUM(churned) AS churned_users,
       CAST(100.0 * SUM(churned) / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features
GROUP BY recency_bucket
ORDER BY churn_rate_pct DESC;
