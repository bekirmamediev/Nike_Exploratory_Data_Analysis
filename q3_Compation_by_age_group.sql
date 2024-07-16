--What the order item completion rate (number of completed order items divided by total number of order items) by age group?
WITH nike AS (
	SELECT *
    FROM order_items
    UNION ALL 
    SELECT *
    FROM order_items_vintage
)
SELECT 
	c.age_group
  , COUNT(*) as total
  , SUM (CASE WHEN n.delivered_at is NOT NULL and n.returned_at is NULL THEN 1 ELSE 0 END) as completed
  , CAST(SUM(CASE WHEN n.delivered_at is NOT NULL and n.returned_at is NULL THEN 1 ELSE 0 END) as decimal)/ CAST(COUNT(*) as decimal) as rate
FROM customers c
INNER JOIN nike n 
ON c.customer_id = n.user_id 
GROUP BY c.age_group
ORDER BY 4 DESC;