-- pastikan churned_users <= total_users
SELECT 
    COUNT(*) AS total_users,
    SUM(churned) AS churned_users
FROM dbo.spotify_churn_features
HAVING SUM(churned) > COUNT(*);  -- harus return 0 row
