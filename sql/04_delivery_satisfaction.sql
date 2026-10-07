
-- Section 4 — Delivery & Satisfaction Analysis
-- Q16 — On Time vs Late Deliveries:
Select 
     Case 
     when order_delivered_customer_date <= order_estimated_delivery_date
     then 'On time'
     else 'Late'
end as delivery_status,
count(*) as total_orders,
round(count(*) * 100 / sum(count(*)) over(),2) as review_pct
from olist_orders
where order_status= 'delivered'
AND order_delivered_customer_date is not NULL
AND order_estimated_delivery_date is not null
group by delivery_status;

-- 88644 on time 
-- 91.89
-- Q17 — Average Review Score by State:
Select 
c.customer_state,
c.customer_city,
round(avg(r.review_score),2) as avg_review_score,
count(r.review_id) as total_review
from olist_reviews r
join olist_orders o on r.order_id = o.order_id
join olist_customers c on o.customer_id = c.customer_id
group by c.customer_state,
c.customer_city
order by avg_review_score desc
LIMIT 10;
-- Which state has highest review score?
-- RS
-- Q18 — Does Late Delivery Affect Review Score
Select 
     Case 
     when order_delivered_customer_date <= order_estimated_delivery_date
      THEN 'On Time'
        ELSE 'Late'
    END AS delivery_status,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS total_orders
    from olist_orders o
    join olist_reviews r on o.order_id = r.order_id
    WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
	GROUP BY delivery_status;
     -- On time vs late — review score difference?
    -- Yes 4.29-2.57
    -- Q19 — Average Delivery Days by Month:
    Select 
    Month(order_delivered_customer_date) as month,
    round(AVG(datediff(order_delivered_customer_date, order_purchase_timestamp)),1) as avg_delivery_days,
    count(*) as total_orders
    from olist_orderS o
    where order_status= 'delivered'
    AND order_purchase_timestamp IS NOT NULL
    AND order_delivered_customer_date IS NOT NULL
    GROUP BY month
    ORDER BY month;
-- Which month has slowest delivery?
-- month 1 - 15.0

-- Q20 — Review Score Distribution:
SELECT 
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM olist_reviews
GROUP BY review_score
ORDER BY review_score DESC;
-- What % gave 5 star review
-- 57.78
