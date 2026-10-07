-- Section 2 — Product Analysis
-- Q6 — Top 10 Categories by Revenue:
Select 
pc.product_category_name as category,
round(sum(p.payment_value),2) as total_revenue,
count(distinct o.order_id) as total_orders
from olist_orders o
join olist_payments p on o.order_id = p.order_id
join olist_order_items oi on p.order_id = oi.order_id
join olist_products pr on oi.product_id = pr.product_id
join product_category pc on pr.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
group by category 
order by total_revenue desc
limit 10;

-- Top revenue category?
-- cama_mesa_banho
-- Q7 — Top 10 Products by Orders:
use e_commerce;
SELECT 
    pc.product_category_name_english AS category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(AVG(p.payment_value), 2) AS avg_order_value
FROM olist_orders o
JOIN olist_payments p ON o.order_id = p.order_id
JOIN olist_order_items oi ON o.order_id = oi.order_id
JOIN olist_products pr ON oi.product_id = pr.product_id
JOIN product_category pc ON pr.product_category_name = pc.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY total_orders DESC
LIMIT 10;

-- Most ordered category?

-- Q8 — Average Product Price by Category:
use e_commerce;
SELECT 
    pc.product_category_name_english AS category,
    ROUND(AVG(oi.price), 2) AS avg_price,
    ROUND(MIN(oi.price), 2) AS min_price,
    ROUND(MAX(oi.price), 2) AS max_price,
    COUNT(DISTINCT oi.order_id) AS total_orders
FROM olist_order_items oi
JOIN olist_products pr ON oi.product_id = pr.product_id
JOIN product_category pc ON pr.product_category_name = pc.product_category_name
GROUP BY category
ORDER BY avg_price DESC
LIMIT 10;

-- Most expensive category?
 -- computers

-- Q9 — Freight Cost Analysis
SELECT 
    pt.product_category_name_english AS category,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight,
    ROUND(AVG(oi.price), 2) AS avg_price,
    ROUND((AVG(oi.freight_value) / AVG(oi.price)) * 100, 2) AS freight_pct_of_price
FROM olist_order_items oi
JOIN olist_products pr ON oi.product_id = pr.product_id
JOIN product_category pt ON pr.product_category_name = pt.product_category_name
GROUP BY category
ORDER BY freight_pct_of_price DESC
LIMIT 10;

-- Highest freight cost category?
-- home_comfort_2

-- Q10 — Most Reviewed Categories:
Select
      pc.product_category_name_english AS category,
      round(avg(r.review_score),2)as avg_review_score,
      count(r.review_id) as total_reviews
From olist_reviews r
JOIN olist_order_items oi ON r.order_id = oi.order_id
JOIN olist_products p ON oi.product_id = p.product_id
JOIN product_category pc ON p.product_category_name = pc.product_category_name
GROUP BY category
order by total_reviews desc;

 -- Which category has most reviews?
 -- bed_bath_table
