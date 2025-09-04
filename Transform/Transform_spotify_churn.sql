/* =========================================================
   VIEW: spotify_churn_features
   - Tidak mengubah tabel asli
   - Termasuk normalisasi kategori, imputasi ringan,
     dan fitur turunan siap-analisis
   ========================================================= */
IF OBJECT_ID('dbo.spotify_churn_features', 'V') IS NOT NULL
    DROP VIEW dbo.spotify_churn_features;
GO

CREATE VIEW dbo.spotify_churn_features AS
WITH base AS (
    SELECT
        user_id,
        LOWER(LTRIM(RTRIM(subscription_type)))              AS subscription_type_norm,
        LTRIM(RTRIM(country))                                AS country,
        COALESCE(avg_daily_minutes, 0)                       AS avg_daily_minutes,
        COALESCE(number_of_playlists, 0)                     AS number_of_playlists,
        COALESCE(skips_per_day, 0)                           AS skips_per_day,
        COALESCE(support_tickets, 0)                         AS support_tickets,
        COALESCE(days_since_last_login, 0)                   AS days_since_last_login,
        COALESCE(NULLIF(LTRIM(RTRIM(top_genre)), ''), 'Unknown') AS top_genre,
        CASE WHEN churned IN (0,1) THEN churned ELSE 0 END   AS churned
    FROM dbo.spotify_churn
),
feat AS (
    SELECT
        b.*,

        /* 1) activity_level dari minutes */
        CASE
            WHEN b.avg_daily_minutes >= 180 THEN 'heavy_user'
            WHEN b.avg_daily_minutes >=  60 THEN 'moderate_user'
            ELSE 'light_user'
        END AS activity_level,

        /* 2) churn_risk dari recency & skips */
        CASE
            WHEN b.days_since_last_login > 30 THEN 'high_risk'
            WHEN b.days_since_last_login BETWEEN 8 AND 30 OR b.skips_per_day > 10 THEN 'medium_risk'
            ELSE 'low_risk'
        END AS churn_risk,

        /* 3) is_premium biner */
        CASE WHEN b.subscription_type_norm = 'premium' THEN 1 ELSE 0 END AS is_premium,

        /* 4) recency bucket */
        CASE
            WHEN b.days_since_last_login <= 3  THEN '0-3d'
            WHEN b.days_since_last_login <= 7  THEN '4-7d'
            WHEN b.days_since_last_login <= 14 THEN '8-14d'
            WHEN b.days_since_last_login <= 30 THEN '15-30d'
            ELSE '30d+'
        END AS recency_bucket,

        /* 5) playlists bucket */
        CASE
            WHEN b.number_of_playlists >= 20 THEN '20+'
            WHEN b.number_of_playlists >= 10 THEN '10-19'
            WHEN b.number_of_playlists >=  5 THEN '5-9'
            WHEN b.number_of_playlists >=  1 THEN '1-4'
            ELSE '0'
        END AS playlists_bucket,

        /* 6) engagement_score (0..100 kira-kira), tanpa LEAST */
        CAST(
              (CASE WHEN b.avg_daily_minutes      < 240 THEN b.avg_daily_minutes      ELSE 240 END) / 240.0 * 60
            + (CASE WHEN b.number_of_playlists    <  20 THEN b.number_of_playlists    ELSE  20 END) /  20.0 * 25
            - (CASE WHEN b.skips_per_day          <  30 THEN b.skips_per_day          ELSE  30 END) /  30.0 * 10
            - (CASE WHEN b.days_since_last_login  <  30 THEN b.days_since_last_login  ELSE  30 END) /  30.0 * 15
            AS DECIMAL(5,2)
        ) AS engagement_score,

        /* 7) indikator keluhan */
        CASE WHEN b.support_tickets >= 1 THEN 1 ELSE 0 END AS has_support_ticket
    FROM base b
)
SELECT * FROM feat;
GO

/* =========================================================
   VIEW tambahan (opsional) untuk ringkasan siap pakai
   ========================================================= */
IF OBJECT_ID('dbo.churn_by_activity', 'V') IS NOT NULL DROP VIEW dbo.churn_by_activity;
GO
CREATE VIEW dbo.churn_by_activity AS
SELECT
    activity_level,
    COUNT(*)                                         AS users,
    SUM(churned)                                     AS churned_users,
    CAST(100.0 * SUM(churned) / NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features
GROUP BY activity_level;
GO

IF OBJECT_ID('dbo.churn_by_recency_premium', 'V') IS NOT NULL DROP VIEW dbo.churn_by_recency_premium;
GO
CREATE VIEW dbo.churn_by_recency_premium AS
SELECT
    recency_bucket,
    is_premium,
    COUNT(*)                                         AS users,
    SUM(churned)                                     AS churned_users,
    CAST(100.0 * SUM(churned) / NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features
GROUP BY recency_bucket, is_premium;
GO

IF OBJECT_ID('dbo.churn_by_country', 'V') IS NOT NULL DROP VIEW dbo.churn_by_country;
GO
CREATE VIEW dbo.churn_by_country AS
SELECT
    country,
    COUNT(*)                                         AS users,
    SUM(churned)                                     AS churned_users,
    CAST(100.0 * SUM(churned) / NULLIF(COUNT(*),0) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features
GROUP BY country;
GO
