--Question #4: 
--Calculate the order item completion rate on two levels of granularity: 
--(1) The completion rate by age group;
--(2) The completion rate by age group and product name.
--Create a table that includes the following columns: age group, order item completion rate by age group, product name, and order item completion rate by age group and product name.
--Only include customers for who the age group is available.

-- Combine order items from both Nike Official and Nike Vintage
WITH nike AS (
	SELECT *
     FROM order_items
    UNION ALL 
    SELECT *
    FROM order_items_vintage
), 
-- Calculate completion rate per age group
completion_per_age as(
	SELECT 
	c.age_group
  , CAST(SUM(CASE WHEN n.delivered_at is NOT NULL and n.returned_at is NULL THEN 1 ELSE 0 END) as decimal)/ CAST(COUNT(*) as decimal) as rate
    FROM customers c
    INNER JOIN nike n 
	ON c.customer_id = n.user_id 
	GROUP BY c.age_group
)
-- Calculate completion rate for each product within each age group
SELECT 
	c.age_group
  , MAX(rate) as completion_per_age
  , p.product_name
  , CAST(SUM(CASE WHEN n.delivered_at is NOT NULL and n.returned_at is NULL THEN 1 ELSE 0 END) as decimal)/ CAST(COUNT(*) as decimal) as completion_per_age_and_product_name
FROM customers c
INNER JOIN nike n 
ON c.customer_id = n.user_id 
INNER JOIN products p 
ON p.product_id = n.product_id
LEFT JOIN  completion_per_age as cpa
ON cpa.age_group = c.age_group
GROUP BY c.age_group, p.product_name
ORDER BY 1, 3;