-- Desafio: Crie uma consulta SQL que responda à seguinte pergunta:
-- "Qual foi a categoria com a maior receita total em cada mês de 2023?"
-- Requisitos:
-- Calcule a receita total para cada categoria, agrupando por mês.
-- Para cada mês, selecione apenas a categoria com a maior receita.
-- A consulta deve retornar os seguintes campos:
-- month (mês da venda)
-- category (categoria do produto)
-- total_revenue (receita total da categoria no mês)
---------------------------------------------------------------------------------
WITH MonthlyRevenue AS (
    SELECT
    STRFTIME('%m-%Y', order_date) AS month,
    ROUND(SUM(order_value),2) AS total_revenue,
    oi.order_id,
    oi.product_id,
    ROW_NUMBER() OVER (PARTITION BY STRFTIME('%m-%Y', order_date) ORDER BY SUM(order_value) DESC) AS rank
    FROM orders o
    INNER JOIN
    order_items oi
    ON o.order_id = oi.order_id
    GROUP BY
    month,
    o.order_id,
    oi.product_id
)
SELECT
    mr.month,
    c.category_name,
    mr.total_revenue
FROM
    MonthlyRevenue mr
INNER JOIN
    products p
    ON p.product_id = mr.product_id
INNER JOIN
    categories c
    ON c.category_id = p.category_id
WHERE mr.rank = 1
--and month like '01-%'
and month like '%-2023'
