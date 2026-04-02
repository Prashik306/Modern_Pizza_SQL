-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(daily_total), 0) AS avg_pizzas_per_day
FROM
    (SELECT 
        orders.order_date,
            SUM(order_details.quantity) AS daily_total
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS daily_data;