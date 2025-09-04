# 🎵 Spotify Customer Churn Prediction  

## 📖 Context  
Customer churn (attrition) is a major challenge in subscription-based platforms like Spotify.  
Churn occurs when users cancel or do not renew their subscriptions, impacting both revenue and long-term user growth.  

This project analyzes **Spotify user behavior, subscription details, and demographics** to:  
- Identify **factors that drive churn**  
- Build a **predictive model** for early churn detection  
- Provide **business recommendations** to improve retention  

---

## 📂 Dataset  

- **Source:** Kaggle – Spotify Customer Churn Dataset  
- **Size:** ~5,000 users  
- **Unit of Analysis:** Each row = one Spotify user  
- **Target Variable:** `Churn` (Yes = customer left, No = retained)  

**Key Features**  

🔹 **User Demographics**  
- `user_id`: Unique identifier (drop for modeling)  
- `gender`: Male / Female  
- `age`: Age of user  
- `country`: Country of residence  

🔹 **Subscription & Billing**  
- `subscription_plan`: Free / Premium / Family / Student  
- `tenure`: Number of months subscribed  
- `payment_method`: Credit card / PayPal / Electronic check / Others  
- `contract_type`: Month-to-month / One year  

🔹 **Usage & Engagement**  
- `songs_listened`: Number of songs played  
- `hours_streamed`: Total hours of music streamed  
- `playlists_created`: Number of playlists created  
- `skips`: Number of skipped tracks  

🔹 **Target Variable**  
- `Churn`: Whether the user churned (Yes/No)  

---

## 🔍 Insights from EDA  

- **Contract Type**:  
  Month-to-month users churned **3x more often** than yearly subscribers.  

- **Tenure**:  
  Users with tenure < 6 months showed the highest churn rate, while those with tenure > 24 months rarely churned.  

- **Payment Method**:  
  Electronic check had the **highest churn rate (≈40%)**, while credit card & PayPal users were more stable.  

- **Engagement**:  
  Users with **low streaming activity (<50 songs/month)** or few playlists created were far more likely to churn.  

- **Demographics**:  
  Younger users (18–25) churned the most, likely due to trial use or switching to competitors.  

---

## 🤖 Modeling  

- **Preprocessing Steps**  
  - Dropped `user_id`  
  - Encoded categorical variables (Label Encoding, One-Hot Encoding)  
  - Scaled numerical features (StandardScaler)  

- **Baseline Models**  
  - Logistic Regression → Accuracy ~0.47, ROC-AUC ~0.46 (weak performance)  
  - Random Forest → Accuracy ~0.48, ROC-AUC ~0.48 (slightly better, still poor)  

- **Challenges**  
  - Dataset imbalance (more retained users than churned ones)  
  - Several categorical features with many levels (e.g., country, payment method)  

- **Next Steps**  
  - Apply **SMOTE / class weights**  
  - Tune hyperparameters for Random Forest / try XGBoost  
  - Evaluate with **Precision, Recall, F1-score, ROC-AUC**  

---

## ✅ Recommendations  

### For Business  
- 💳 Encourage churn-prone users (month-to-month, electronic check) to switch to **annual plans** or more stable payment methods.  
- 🎧 Boost engagement by sending **personalized playlists** to users with low activity.  
- 🧑‍🎓 Focus marketing on **young users (18–25)** with student discounts or influencer campaigns.  
- 🎁 Offer loyalty rewards for **long-tenure customers** to reinforce retention.  

### For Modeling  
- Apply **imbalanced data handling** (SMOTE, undersampling).  
- Use **tree-based ensemble methods** (Random Forest, XGBoost).  
- Deploy model to a **dashboard** for churn risk monitoring.  

---

## 📊 Visualization  

Interactive dashboards & visual analysis can include:  
- Churn rate by contract type & payment method  
- Churn vs. tenure distribution  
- Engagement levels (songs, hours streamed) vs. churn  
- Age demographics and churn rate  

---

## 📎 References  
- Dataset: [Kaggle – Spotify Customer Churn](https://www.kaggle.com/)  
- Notebook: [Spotify Churn Prediction](https://github.com/xxvlrapss/spotify-customer-churn/blob/main/spotify_customer_churn.ipynb)  
