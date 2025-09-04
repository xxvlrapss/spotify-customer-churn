SELECT subscription_type, churned, COUNT(*) AS n
FROM spotify_churn
GROUP BY subscription_type, churned
ORDER BY subscription_type, churned;
