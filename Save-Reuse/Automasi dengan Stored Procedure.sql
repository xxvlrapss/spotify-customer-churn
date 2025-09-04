CREATE PROCEDURE dbo.usp_refresh_churn_summary
AS
BEGIN
    -- truncate table dulu
    TRUNCATE TABLE dbo.churn_summary_table;

    -- insert summary baru
    INSERT INTO dbo.churn_summary_table (segment, users, churned_users, churn_rate_pct)
    SELECT activity_level, COUNT(*), SUM(churned),
           CAST(100.0 * SUM(churned)/COUNT(*) AS DECIMAL(5,2))
    FROM dbo.spotify_churn_features
    GROUP BY activity_level;
END;
GO
