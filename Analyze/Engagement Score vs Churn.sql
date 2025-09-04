SELECT churned,
       AVG(engagement_score) AS avg_score,
       MIN(engagement_score) AS min_score,
       MAX(engagement_score) AS max_score
FROM dbo.spotify_churn_features
GROUP BY churned;
