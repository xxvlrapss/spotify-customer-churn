# 🎵 Spotify Customer Churn Analysis  

## 📖 Business Context  
Spotify ingin memahami faktor-faktor yang memengaruhi **customer churn** (berhentinya pelanggan) agar dapat merancang strategi retensi yang lebih efektif.  

Dataset ini berisi informasi perilaku user seperti:  
- waktu mendengarkan musik (avg daily minutes),  
- jumlah playlist,  
- jumlah skip,  
- tiket support,  
- jenis subscription,  
- genre, dan  
- aktivitas login.  

**Tujuan analisis ini:**  
- Mengidentifikasi faktor perilaku yang berhubungan dengan churn  
- Memberikan insight bisnis yang relevan  
- Menyusun rekomendasi strategis untuk mengurangi churn  

---

## 📂 Dataset Overview  
- **Source:** Synthetic dataset from Kaggle  
- **Size:** ~5,000 records  
- **Unit of Analysis:** Setiap baris = satu user Spotify  
- **Target Variable:** `Churn` (Yes = churn, No = aktif)  

**Main Columns**  
- `user_id` → Unique identifier (tidak dipakai dalam modeling)  
- `gender`, `age`, `country` → Demografi user  
- `subscription_type` → Free / Premium / Family / Student  
- `contract_type` → Month-to-month / One year  
- `tenure` → Lama berlangganan (bulan)  
- `payment_method` → Credit card, PayPal, Electronic check  
- `avg_daily_minutes` → Waktu mendengarkan musik per hari  
- `playlists_created` → Jumlah playlist  
- `skips` → Rata-rata skip per hari  
- `support_tickets` → Jumlah tiket komplain  
- `days_since_last_login` → Hari sejak login terakhir  
- `Churn` → Target (Yes/No)  

---

## 🔍 Key Insights  

1. **Engagement (Avg Daily Minutes)**  
   - User churn memiliki waktu dengar musik harian lebih rendah.  
   - Engagement rendah → risiko churn lebih tinggi.  

2. **Playlist Behavior**  
   - User churn cenderung hanya punya 0–1 playlist.  
   - Semakin banyak playlist dibuat → semakin kecil kemungkinan churn.  

3. **Skips per Day**  
   - User churn memiliki skip rate lebih tinggi.  
   - Sering skip → indikasi ketidakpuasan rekomendasi musik.  

4. **Support Tickets**  
   - Banyak tiket support berhubungan dengan churn tinggi.  
   - Menunjukkan pengalaman buruk atau masalah aplikasi.  

5. **Days Since Last Login**  
   - Non-churn: login rutin (≤5 hari).  
   - Churn: lama tidak login (20–50 hari).  

6. **Subscription Type**  
   - Free users lebih rentan churn dibanding premium.  
   - Jenis langganan memengaruhi loyalitas.  

---

## ✅ Business Recommendations  

1. **Tingkatkan Engagement**  
   - Rekomendasikan lagu sesuai preferensi user.  
   - Tambahkan fitur *Daily Mix* atau *For You Playlist* untuk user dengan engagement rendah.  

2. **Dorong Pembuatan Playlist**  
   - Auto-playlist & rekomendasi lagu baru.  
   - Kampanye/gamifikasi: “Buat playlist populer, dapatkan reward”.  

3. **Kurangi Skip Rate**  
   - Perbaiki algoritma rekomendasi.  
   - Tambahkan *feedback button* pada skip untuk mempelajari preferensi user.  

4. **Perbaiki Customer Support**  
   - Sistem respon cepat untuk tiket komplain.  
   - Analisis pola tiket support untuk identifikasi masalah umum.  

5. **Retensi User Tidak Aktif**  
   - Notifikasi/email promo untuk user tidak login >14 hari.  
   - Berikan voucher premium trial untuk menarik kembali user lama.  

6. **Fokus pada Free Plan**  
   - Edukasi benefit premium plan.  
   - Promo konversi free → premium untuk mengurangi churn.  

---

## 📊 Power BI Dashboard & Visualisasi  

Visualisasi churn Spotify tersedia dalam format PDF:  

<p>
  <a href="https://github.com/xxvlrapss/spotify-customer-churn/blob/main/PowerBI/visualisasi-spotify-churn.pdf" target="_blank">
    <img src="https://img.shields.io/badge/VIEW-visualisasi--spotify--churn.pdf-00bfa6?style=for-the-badge&logo=readthedocs&logoColor=white" alt="View PDF" />
  </a>
</p>

- **visualisasi-spotify-churn.pdf** — Versi statis dari dashboard (bisa langsung dibuka di GitHub).  

---

## 📎 References  
- Kaggle Notebook: [Analisis Spotify Customer Churn](https://www.kaggle.com/code/dimasprayoga/analisis-spotify-customer-churn)  
- Jupyter Notebook: [analisis-spotify-customer-churn.ipynb](https://github.com/xxvlrapss/Data-Analyst-Portofolio/blob/main/analisis-spotify-customer-churn.ipynb)  
