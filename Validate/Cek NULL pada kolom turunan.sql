SELECT
  SUM(CASE WHEN activity_level IS NULL THEN 1 ELSE 0 END) AS null_activity,
  SUM(CASE WHEN churn_risk IS NULL THEN 1 ELSE 0 END) AS null_risk,
  SUM(CASE WHEN recency_bucket IS NULL THEN 1 ELSE 0 END) AS null_recency,
  SUM(CASE WHEN engagement_score IS NULL THEN 1 ELSE 0 END) AS null_engagement
FROM dbo.spotify_churn_features;
