SELECT
   MIN(avg_daily_minutes) AS min_minutes,
   MAX(avg_daily_minutes) AS max_minutes,
   MIN(days_since_last_login) AS min_last_login,
   MAX(days_since_last_login) AS max_last_login,
   MIN(engagement_score) AS min_score,
   MAX(engagement_score) AS max_score
FROM dbo.spotify_churn_features;
