-- nilai yang tidak masuk akal
SELECT *
FROM spotify_churn
WHERE avg_daily_minutes < 0 OR avg_daily_minutes > 1440
   OR skips_per_day < 0
   OR number_of_playlists < 0
   OR support_tickets < 0
   OR days_since_last_login < 0;
