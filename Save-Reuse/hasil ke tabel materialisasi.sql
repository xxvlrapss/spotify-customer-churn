-- contoh: simpan churn user berisiko tinggi
SELECT user_id, churn_risk, engagement_score, churned
INTO dbo.high_risk_users
FROM dbo.spotify_churn_features
WHERE churn_risk = 'high_risk';
