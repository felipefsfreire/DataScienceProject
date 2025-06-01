SELECT
    c.customer_id,
    sum(o.order_value) AS total
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 10
