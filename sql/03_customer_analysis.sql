-- Section 3 — Customer Analysis 
-- Q11 — Top 10 Cities by Orders:
SELECT 
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM olist_customers c
JOIN olist_orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_city, c.customer_state
ORDER BY total_orders DESC
LIMIT 10;

-- Top city by orders?
-- sao paulo
-- rio de janeiro
-- belo horizonte
-- brasilia
-- curitiba
-- campinas
-- porto alegre
-- salvador
-- guarulhos
-- sao bernardo do campo

-- Q12 — Customer Retention (Repeat vs New):
Use e_commerce;
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One Time Customer'
        WHEN order_count = 2 THEN 'Returning Customer'
        ELSE 'Loyal Customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM olist_orders
    GROUP BY customer_id
) AS customer_orders
GROUP BY customer_type
ORDER BY total_customers DESC;

-- Q13 — Top State by Revenue:
SELECT 
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    round(sum(p.payment_value),2) as total_revenue
FROM olist_customers c
JOIN olist_orders o ON c.customer_id = o.customer_id
JOIN olist_payments p on o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_city, c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;
-- Top State by revenue
-- SP

-- Q14 — Slowest Delivery State:
SELECT 
    c.customer_state,
    ROUND(AVG(DATEDIFF(
        o.order_delivered_customer_date,
        o.order_purchase_timestamp
    )), 1) AS avg_delivery_days
FROM olist_orders o
JOIN olist_customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 5;
-- Which State has slowest delivery date
-- RR
-- Q15 — Customer Lifetime Value:
SELECT 
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    ROUND(SUM(p.payment_value) / 
    COUNT(DISTINCT o.customer_id), 2) AS customer_lifetime_value
FROM olist_orders o
JOIN olist_payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered';

-- CLV(Customer lifetime Value) Means "On average, 
-- how much money does ONE customer spend in their entire time with the business?
-- Simple formula
-- CLV = Total Revenue ÷ Total Customers
-- 159.86
