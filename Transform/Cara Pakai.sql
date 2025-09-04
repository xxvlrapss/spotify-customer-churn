-- Segmentasi churn per activity level
SELECT * FROM dbo.churn_by_activity ORDER BY churn_rate_pct DESC;

-- Segmentasi churn per recency & premium
SELECT * FROM dbo.churn_by_recency_premium ORDER BY recency_bucket, is_premium;

-- Negara dengan churn tertinggi (top 10 by rate, lalu size)
SELECT TOP 10 * FROM dbo.churn_by_country ORDER BY churn_rate_pct DESC, users DESC;

-- Daftar user berisiko tinggi untuk aksi
SELECT user_id, subscription_type_norm, days_since_last_login, skips_per_day,
       engagement_score, churn_risk, churned
FROM dbo.spotify_churn_features
WHERE churn_risk = 'high_risk'
ORDER BY engagement_score ASC, days_since_last_login DESC;
