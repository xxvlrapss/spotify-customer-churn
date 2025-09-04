SELECT churned, COUNT(*) AS n
FROM dbo.spotify_churn_features
GROUP BY churned;
