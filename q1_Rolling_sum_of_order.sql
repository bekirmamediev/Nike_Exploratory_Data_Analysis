--Create a rolling sum that rolls up the number of order items for each product name 
--for the Nike Official business ordered by product name.
--Include the order items where the product name is available.

-- Calculate the total order items per product name
WITH total AS(
  SELECT 
	  pr.product_name 
    , COUNT(oi.order_item_id) as total_order
  FROM products pr
  INNER JOIN order_items oi ON pr.product_id = oi.product_id
  GROUP BY pr.product_name
)
-- Calculate the rolling sum of order items
SELECT 
	product_name 
  , SUM(total_order)OVER(ORDER BY product_name)
FROM total; 
