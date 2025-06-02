WITH SequencedOrders AS (
    SELECT
        customer_id,
        order_date,
        LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date
    FROM orders
),
PurchaseIntervals AS (
    SELECT
        customer_id,
        CAST((JULIANDAY(order_date) - JULIANDAY(previous_order_date)) AS INTEGER) AS days_between
    FROM SequencedOrders
    WHERE previous_order_date IS NOT NULL
)
SELECT
    customer_id,
    ROUND(AVG(days_between), 1) AS avg_days_between_orders
FROM PurchaseIntervals
GROUP BY customer_id
HAVING COUNT(days_between) > 0
ORDER BY avg_days_between_orders DESC;