SELECT
    SUM(CASE WHEN subscription_type IS NULL THEN 1 ELSE 0 END) AS null_subscription,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS null_country,
    SUM(CASE WHEN avg_daily_minutes IS NULL THEN 1 ELSE 0 END) AS null_avg_minutes,
    SUM(CASE WHEN number_of_playlists IS NULL THEN 1 ELSE 0 END) AS null_playlists,
    SUM(CASE WHEN top_genre IS NULL THEN 1 ELSE 0 END) AS null_genre,
    SUM(CASE WHEN skips_per_day IS NULL THEN 1 ELSE 0 END) AS null_skips,
    SUM(CASE WHEN support_tickets IS NULL THEN 1 ELSE 0 END) AS null_tickets,
    SUM(CASE WHEN days_since_last_login IS NULL THEN 1 ELSE 0 END) AS null_last_login,
    SUM(CASE WHEN churned IS NULL THEN 1 ELSE 0 END) AS null_churned
FROM spotify_churn;
