# eCommerce Sales Data Analysis

# E-commerce Sales Data Analysis

## SQL + Python + Power BI

An end-to-end e-commerce data analysis project using SQL, Python, and Power BI to analyze sales performance, customer behavior, product categories, payment methods, and delivery satisfaction.

## Project Objectives

- Analyze overall revenue and sales trends
- Identify high-performing product categories
- Understand customer purchasing behavior
- Analyze payment methods and order patterns
- Evaluate delivery performance and customer satisfaction
- Identify growth trends and business opportunities

## Tools & Technologies

- **MySQL** — SQL analysis, joins, aggregations, CTEs and window functions
- **Python** — Pandas, NumPy, Matplotlib and Seaborn
- **Power BI** — Interactive dashboard and business reporting
- **Jupyter Notebook** — Exploratory data analysis

## Dataset

The analysis uses the **Brazilian E-Commerce Public Dataset by Olist**, available through Kaggle.

- Orders: 99,440
- Period: 2016–2018
- Dataset: Olist Brazilian E-Commerce Dataset

## SQL Analysis

The SQL analysis is organized into five sections:

1. **Revenue Analysis**
   - Monthly revenue trends
   - Revenue growth
   - Cumulative revenue
   - Sales performance

2. **Product Analysis**
   - Category-level revenue
   - Top-performing categories
   - Product performance

3. **Customer Analysis**
   - Customer distribution
   - Customer type analysis
   - State-wise customer analysis
   - Customer purchasing behavior

4. **Delivery & Satisfaction**
   - Delivery performance
   - Delivery status
   - Review scores
   - Relationship between delivery and customer satisfaction

5. **Advanced Analytics**
   - CTE-based analysis
   - Window functions
   - Ranking
   - Growth and comparative analysis

## Python EDA

Python was used to clean, explore and visualize the analytical results using Pandas, Matplotlib and Seaborn.

Key analyses include:

- Monthly revenue
- Category revenue
- Payment methods
- Review scores
- Delivery performance

## Power BI Dashboard

The Power BI dashboard contains five analytical sections:

### 1. Revenue Overview

Overall sales and revenue performance.

### 2. Product Analysis

Category-level and product-level performance.

### 3. Customer Insights

Customer distribution and purchasing behavior.

### 4. Delivery & Satisfaction

Delivery performance and customer review analysis.

### 5. Growth Trends

Revenue growth and time-based performance analysis.

## Key Business Insights

- Bed & Bath was among the highest-revenue product categories.
- November 2017 recorded a significant revenue peak.
- Credit cards represented the dominant payment method.
- São Paulo had the largest customer base among Brazilian states.
- Delivery performance and customer reviews provide useful indicators of customer satisfaction.

## Project Structure

```text
E-commerce-Sales-Data-Analysis/
│
├── 01_revenue_analysis.sql
├── 02_product_analysis.sql
├── 03_customer_analysis.sql
├── 04_delivery_satisfaction.sql
├── 05_advanced_analytics.sql
│
├── olist_eda.ipynb
│
├── category_revenue.csv
├── cumulative_revenue.csv
├── customer_by_state.csv
├── customer_type.csv
├── delivery_status.csv
├── monthly_revenue.csv
├── payment_types.csv
├── review_scores.csv
└── top_sellers.csv

## Author
Devanshu Kumar

B.Tech — Chemical Science and Technology, IIT Patna

- GitHub: github.com/devanshu1513
```
