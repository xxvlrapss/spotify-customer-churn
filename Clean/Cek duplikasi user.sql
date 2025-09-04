-- user_id seharusnya unik
SELECT user_id, COUNT(*) AS cnt
FROM spotify_churn
GROUP BY user_id
HAVING COUNT(*) > 1;
