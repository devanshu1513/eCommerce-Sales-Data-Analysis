-- Section 5 — Advanced Analytics 
-- Q21 — Monthly Revenue Growth Rate:
WITH monthly_revenue AS (
    SELECT 
        YEAR(o.order_purchase_timestamp) AS year,
        MONTH(o.order_purchase_timestamp) AS month,
        ROUND(SUM(p.payment_value), 2) AS revenue
    FROM olist_orders o
    JOIN olist_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY year, month
),
with_growth AS (
    SELECT *,
        LAG(revenue) OVER (ORDER BY year, month) AS prev_revenue
    FROM monthly_revenue
)
SELECT 
    year, month, revenue, prev_revenue,
    ROUND(((revenue - prev_revenue) / prev_revenue) * 100, 2) AS growth_pct
FROM with_growth
WHERE prev_revenue IS NOT NULL
ORDER BY year, month;
-- Best growth month?
YEAR -2017 Month 1
-- Q22 — Top 10 Sellers by Revenue:
Select 
s.seller_id, 
s.seller_city,
s.seller_state,
round(sum(oi.price),2) as total_revenue,
count(distinct oi.order_id) as total_order
from olist_order_items oi
join olist_sellers s on oi.seller_id = s.seller_id
group by s.seller_id, 
s.seller_city,
s.seller_state
order by total_revenue desc
LIMIT 10;
-- Top seller city
-- guariba

-- Q23 — Seller Performance Ranking
SELECT 
    seller_id,
    seller_city,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
    RANK() OVER (ORDER BY total_orders DESC) AS orders_rank
FROM (
    SELECT 
        s.seller_id,
        s.seller_city,
        ROUND(SUM(oi.price), 2) AS total_revenue,
        COUNT(DISTINCT oi.order_id) AS total_orders
    FROM olist_sellers s
    JOIN olist_order_items oi ON s.seller_id = oi.seller_id
    GROUP BY s.seller_id, s.seller_city
) seller_stats
ORDER BY revenue_rank 
LIMIT 10;
-- guariba
-- Q24 — Cumulative Revenue Over Time:
WITH monthly AS (
    SELECT 
        YEAR(o.order_purchase_timestamp) AS year,
        MONTH(o.order_purchase_timestamp) AS month,
        ROUND(SUM(p.payment_value), 2) AS monthly_revenue
    FROM olist_orders o
    JOIN olist_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY year, month
)
SELECT 
    year, month, monthly_revenue,
    ROUND(SUM(monthly_revenue) OVER (
        ORDER BY year, month
    ), 2) AS cumulative_revenue
FROM monthly
ORDER BY year, month;

-- What is cumulative revenue at end?
-- 15422461.77
-- Q25 — High Value Customer Identification:
WITH customer_stats AS (
    SELECT 
        o.customer_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        ROUND(SUM(p.payment_value), 2) AS total_spent,
        ROUND(AVG(p.payment_value), 2) AS avg_order_value,
        MAX(o.order_purchase_timestamp) AS last_order_date
    FROM olist_orders o
    JOIN olist_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY o.customer_id
)
SELECT 
    customer_id,
    total_orders,
    total_spent,
    avg_order_value,
    last_order_date,
    RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM customer_stats
ORDER BY total_spent DESC
LIMIT 20;
 -- How much did top customer spend?
 -- 13664.08
