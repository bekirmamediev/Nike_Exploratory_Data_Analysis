--What is the order item completion rate
--(number of completed order items divided by total number of order items) 
--for each of the products (across Nike Official and Nike Vintage) by product name? 
--To confirm which product deliveries have been completed (delivered and not returned), 
--you can filter for the delivered date to be NOT NULL and the returned date to be NULL.
--Show the products only where the product name is available 
--and show the products with highest completion rate first in the table.

-- Combine order items from both Nike Official and Nike Vintage
WITH nike AS (
	SELECT *
  FROM order_items
  UNION ALL 
  SELECT *
  FROM order_items_vintage
)
-- Calculate the completion rate for each product
SELECT 
	p.product_name
  , CAST(SUM(CASE WHEN n.delivered_at is NOT NULL and n.returned_at is NULL THEN 1 ELSE 0 END) as decimal)/ CAST(COUNT(*) as decimal) as rate
FROM products p
INNER JOIN nike n 
ON p.product_id = n.product_id 
GROUP BY p.product_name
ORDER BY 2 DESC;
