-- ringkasan statistik numeric
SELECT 
  MIN(avg_daily_minutes) AS min_daily,
  MAX(avg_daily_minutes) AS max_daily,
  AVG(avg_daily_minutes) AS avg_daily,
  MIN(days_since_last_login) AS min_last_login,
  MAX(days_since_last_login) AS max_last_login,
  AVG(days_since_last_login) AS avg_last_login
FROM spotify_churn;
