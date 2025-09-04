-- jumlah baris & kolom
SELECT COUNT(*) AS n_rows
FROM spotify_churn;

-- daftar kolom
EXEC sp_columns 'spotify_churn';
