SELECT 
    c.category_name, 
    COUNT(DISTINCT p.product_name) AS count
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY c.category_name