-- Analyze the cumulative revenue generated over time.

SELECT 
order_date,
ROUND(daily_revenue, 2) AS daily_revenue,
ROUND(
    SUM(daily_revenue) OVER (ORDER BY order_date), 
2) AS cumulative_revenue
FROM (
    SELECT 
    orders.order_date,
    SUM(order_details.quantity * pizzas.price) AS daily_revenue
    FROM orders
    JOIN order_details 
    ON orders.order_id = order_details.order_id
    JOIN pizzas 
    ON order_details.pizza_id = pizzas.pizza_id
    GROUP BY orders.order_date
) AS t;