-- churn rate per bulan (kalau ada date join_date / periode data)
CREATE VIEW dbo.churn_summary_overall AS
SELECT 
    COUNT(*) AS total_users,
    SUM(churned) AS churned_users,
    CAST(100.0 * SUM(churned) / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features;
GO

-- churn rate per activity level
CREATE VIEW dbo.churn_summary_activity AS
SELECT activity_level,
       COUNT(*) AS users,
       SUM(churned) AS churned_users,
       CAST(100.0 * SUM(churned) / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features
GROUP BY activity_level;
GO

-- churn rate per recency bucket
CREATE VIEW dbo.churn_summary_recency AS
SELECT recency_bucket,
       COUNT(*) AS users,
       SUM(churned) AS churned_users,
       CAST(100.0 * SUM(churned) / COUNT(*) AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.spotify_churn_features
GROUP BY recency_bucket;
GO
