SELECT churned,
       AVG(avg_daily_minutes) AS avg_minutes,
       AVG(number_of_playlists) AS avg_playlists,
       AVG(skips_per_day) AS avg_skips,
       AVG(support_tickets) AS avg_tickets,
       AVG(days_since_last_login) AS avg_last_login
FROM dbo.spotify_churn_features
GROUP BY churned;
