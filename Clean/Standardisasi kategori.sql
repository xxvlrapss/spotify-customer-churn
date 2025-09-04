-- normalisasi subscription_type
UPDATE spotify_churn
SET subscription_type = LOWER(subscription_type);

-- cek country
SELECT DISTINCT country FROM spotify_churn ORDER BY country;

-- cek genre
SELECT DISTINCT top_genre FROM spotify_churn ORDER BY top_genre;
