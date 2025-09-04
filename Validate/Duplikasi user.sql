SELECT user_id, COUNT(*) AS cnt
FROM dbo.spotify_churn_features
GROUP BY user_id
HAVING COUNT(*) > 1;
