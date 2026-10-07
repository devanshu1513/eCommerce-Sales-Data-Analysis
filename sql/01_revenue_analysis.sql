-- Section 1 — Revenue Analysis
-- Q1 — Total Revenue
Use e_commerce;
Select 
     round(sum(payment_value),2) as total_revenue,
     count(distinct order_id) as total_orders,
     round(avg(payment_value),2) as avg_order_value
     from olist_payments;
     
-- Q2 — Monthly Revenue Trend  
Use e_commerce;   
SELECT 
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,
    ROUND(SUM(p.payment_value), 2) AS monthly_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM olist_orders o
JOIN olist_payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY year, month
ORDER BY monthly_revenue desc;

-- Q3 — Revenue by Payment Type
Select 
payment_type,
count(*) as total_transaction,
round(sum(payment_value),2) as total_revenue,
round(avg(payment_value),2) as avg_transaction_value
from olist_payments
group by payment_type
order by total_revenue desc;

-- Which payment type is most popular?
-- credit_card
-- Q4 — Top 10 Revenue Days:
Select 
Date(order_purchase_timestamp) as order_date,
round(sum(p.payment_value),2) as total_revenue,
count(distinct o.order_id) as total_orders
from olist_orders o
join olist_payments p on o.order_id = p.order_id
where order_status = 'delivered'
group by order_date
order by total_revenue desc
limit 10 ;

-- What date was the single biggest day?
-- 2017-11-24
-- Q5 — Order Status:
Select o.order_status,
count(distinct o.order_id) as total_orders,
round(sum(p.payment_value),2)as total_revenue
from olist_orders o
join olist_payments p on o.order_id = p.order_id
group by o.order_status
order by total_orders desc;

-- How many orders were delivered vs cancelled?
-- 96477 vs 625
