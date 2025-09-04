# 🎵 Spotify Customer Churn Analysis  

## 📖 Context  
Customer churn is one of the biggest challenges for subscription-based businesses like Spotify.  
Churn occurs when users stop using the service or cancel their subscription, which directly impacts revenue and long-term growth.  

The goal of this project is to:  
- Identify **key factors driving customer churn**  
- Build a **data-driven churn profile**  
- Provide **recommendations** for improving customer retention  

---

## 📂 Dataset  
- **Source:** Synthetic dataset from Kaggle  
- **Unit of Analysis:** Each row = one Spotify user  
- **Size:** ~5,000 records  

**Main Columns:**  
- `user_id` → Unique identifier (not used for modeling)  
- `gender`, `age`, `country` → User demographics  
- `subscription_plan` → Free / Premium / Family / Student  
- `contract_type` → Month-to-month, One year  
- `tenure` → Months subscribed  
- `payment_method` → Credit card, PayPal, Electronic check  
- `songs_listened`, `hours_streamed`, `playlists_created` → Engagement metrics  
- `Churn` → Target variable (Yes/No)  

---

## 🔍 Insights  

### 1. Subscription & Contract  
- **Month-to-month subscribers** churn significantly more often than yearly subscribers.  
- **Family & Student plans** show slightly better retention compared to Premium (single users).  

### 2. Tenure & Loyalty  
- Users with **short tenure (<6 months)** are highly prone to churn.  
- Churn probability decreases steadily after 24+ months.  

### 3. Payment Methods  
- **Electronic check** has the highest churn rate (≈40%).  
- Credit card & PayPal are more stable payment options.  

### 4. Engagement Metrics  
- Users who listen to **fewer than 50 songs per month** or have low streaming hours are far more likely to churn.  
- Customers with **more playlists created** show higher retention (engagement effect).  

### 5. Demographics  
- Younger users (18–25) churn more often → possibly due to trial use, price sensitivity, or switching to competitors.  

---

## ✅ Recommendations  

### Business Actions  
- 💳 **Payment Method**: Encourage users paying via electronic check to switch to credit card/PayPal.  
- 🎧 **Engagement**: Boost low-activity users with personalized playlists, notifications, or reward points.  
- 📆 **Contracts**: Offer loyalty discounts for month-to-month subscribers to switch to yearly plans.  
- 👩‍🎤 **Youth Retention**: Target the 18–25 segment with student pricing, exclusive playlists, or influencer partnerships.  

### Analytics & Modeling  
- Apply **class imbalance handling** (SMOTE / class weights).  
- Test **tree-based models** (Random Forest, XGBoost) for churn prediction.  
- Use **feature importance analysis** to identify the strongest churn predictors.  
- Deploy results in a **dashboard** for continuous monitoring.  

---

## 📊 Power BI Dashboard & Visualisasi  

Ringkasan visualisasi churn Spotify dalam format PDF:  

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
