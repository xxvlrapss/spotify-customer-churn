SELECT
    recency_bucket,
    CASE recency_bucket
        WHEN '0-3d'   THEN 1
        WHEN '4-7d'   THEN 2
        WHEN '8-14d'  THEN 3
        WHEN '15-30d' THEN 4
        WHEN '30d+'   THEN 5
    END AS recency_order,
    users,
    churned_users,
    CAST(churned_users * 1.0 / NULLIF(users,0) * 100 AS DECIMAL(5,2)) AS churn_rate_pct
FROM dbo.churn_summary_recency
ORDER BY recency_order;
