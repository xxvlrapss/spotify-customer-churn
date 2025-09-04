-- contoh handling genre kosong
UPDATE spotify_churn
SET top_genre = 'Unknown'
WHERE top_genre IS NULL;

-- contoh handling numeric NULL
UPDATE spotify_churn
SET support_tickets = 0
WHERE support_tickets IS NULL;
