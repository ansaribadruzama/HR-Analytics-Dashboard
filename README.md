# HR Analytics Dashboard

## Project Overview
This project analyzes IBM HR Employee Attrition data to identify key factors driving employee turnover. The analysis covers attrition rates by department, age group, job role, salary, overtime, job satisfaction, and work-life balance.

## Live Dashboard
🔗 [View on Tableau Public](https://public.tableau.com/app/profile/mohd.badruzama.ansari/viz/HR-Analytics-Dashboard_17804982697270/HRAnalyticsDashboard)

## Tools Used
- **Python** (Google Colab) — Data cleaning & EDA
- **MySQL** — Data analysis & querying
- **Tableau Public** — Interactive dashboard

## Dataset
- **Source:** IBM HR Analytics Employee Attrition Dataset (Kaggle)
- **Link:** https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset
- **Size:** 1,470 employees, 34 columns

## Key Business Insights
- Overall attrition rate: **16.12%** (1 in 6 employees leaving)
- **Sales department** has highest attrition at 20.63%
- **Sales Representatives** have highest role-based attrition at 39.76%
- Employees aged **18-25** have highest attrition at 34.78%
- Employees working **overtime** have 3x higher attrition (30.53% vs 10.44%)
- Low job satisfaction (score 1) drives **22.84%** attrition
- Poor work-life balance (score 1) drives **31.25%** attrition
- Employees who left earned **~$2,000 less** per month on average

## Project Structure

HR-Analytics-Dashboard/
├── dataset/
│   ├── WA_Fn-UseC_-HR-Employee-Attrition.csv
│   └── hr_analytics_cleaned.csv
├── python/
│   └── HR_Analytics_EDA.ipynb
├── sql/
│   └── hr_analytics_queries.sql
├── tableau/
│   └── HR_Analytics_Dashboard_Screenshot.jpg
└── README.md


## Dashboard Preview
![HR Analytics Dashboard](tableau/HR_Analytics_Dashboard_Screenshot.jpg)

## Author
**Mohd Badruzama Ansari**
- GitHub: [ansaribadruzama](https://github.com/ansaribadruzama)
- Location: Panvel, Maharashtra
- Education: MCA from Chhatrapati Shivaji Maharaj University
