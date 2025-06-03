WITH CustomerAge AS (
    SELECT
        c.customer_id,
        CASE
            WHEN CAST(STRFTIME('%Y', 'now') - STRFTIME('%Y', c.customer_birth_date) - 
                      (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', c.customer_birth_date)) AS INTEGER) BETWEEN 18 AND 24 THEN '18-24'
            WHEN CAST(STRFTIME('%Y', 'now') - STRFTIME('%Y', c.customer_birth_date) - 
                      (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', c.customer_birth_date)) AS INTEGER) BETWEEN 25 AND 34 THEN '25-34'
            WHEN CAST(STRFTIME('%Y', 'now') - STRFTIME('%Y', c.customer_birth_date) - 
                      (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', c.customer_birth_date)) AS INTEGER) BETWEEN 35 AND 44 THEN '35-44'
            WHEN CAST(STRFTIME('%Y', 'now') - STRFTIME('%Y', c.customer_birth_date) - 
                      (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', c.customer_birth_date)) AS INTEGER) BETWEEN 45 AND 54 THEN '45-54'
            WHEN CAST(STRFTIME('%Y', 'now') - STRFTIME('%Y', c.customer_birth_date) - 
                      (STRFTIME('%m-%d', 'now') < STRFTIME('%m-%d', c.customer_birth_date)) AS INTEGER) >= 55 THEN '55+'
            ELSE 'Menor de 18'
        END AS age_group
    FROM customers c
),
OrdersWithAge AS (
    SELECT
        ca.age_group,
        o.customer_id,
        o.order_id,
        o.order_value
    FROM orders o
    JOIN CustomerAge ca ON ca.customer_id = o.customer_id
),
ProductPurchases AS (
    SELECT
        ca.age_group,
        p.product_name,
        COUNT(*) AS purchase_count
    FROM CustomerAge ca
    JOIN orders o ON ca.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY ca.age_group, p.product_name
),
RankedProducts AS (
    SELECT
        age_group,
        product_name,
        purchase_count,
        ROW_NUMBER() OVER (PARTITION BY age_group ORDER BY purchase_count DESC) AS rank
    FROM ProductPurchases
),
AvgSpentPerAgeGroup AS (
    SELECT
        ca.age_group,
        ROUND(AVG(o.order_value), 2) AS avg_total_spent
    FROM CustomerAge ca
    JOIN orders o ON ca.customer_id = o.customer_id
    GROUP BY ca.age_group
)
SELECT
    r.age_group,
    r.product_name AS most_purchased_product,
    a.avg_total_spent
FROM RankedProducts r
JOIN AvgSpentPerAgeGroup a ON r.age_group = a.age_group
WHERE r.rank = 1
ORDER BY r.age_group;
