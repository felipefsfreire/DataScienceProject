-- Desafio: "Qual foi a primeira compra registrada de cada cliente em 2024?"
-- Requisitos:
-- Para cada cliente, encontre a primeira compra registrada no ano.
-- A consulta deve retornar:
-- customer_id (ID do cliente)
-- customer (nome do cliente)
-- sales_date (data da primeira compra)
-- product (produto comprado)
-- sales_quantity (quantidade comprada)
-- total_price (valor total da compra)
-- Se um cliente tiver mais de uma compra na mesma data, selecione a de menor valor (total_price).
----------------------------------------------------------------------------------------------------

WITH customerFirstSaleYear AS(
    SELECT
        c.customer_id,
        c.customer_name AS customer,
        o.order_date,
        p.product_name AS product,
        oi.order_quantity,
        o.order_value,
        ROW_NUMBER() OVER (PARTITION BY c.customer_name ORDER BY o.order_value) AS rank -- Atribui um número de linha para cada compra do cliente, ordenando por data e valor total da compra.
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    ORDER BY o.order_value
)

SELECT
    customer_id,
    customer,
    order_date AS sales_date,
    product,
    order_quantity AS sales_quantity,
    order_value AS total_price
FROM customerFirstSaleYear
WHERE 
    STRFTIME('%Y', order_date) = '2024' -- Filtra as vendas para incluir apenas aquelas que ocorreram no ano de 2024.
    AND rank = 1 -- Seleciona apenas a primeira compra de cada cliente.
ORDER BY
    order_date,-- E pela data da venda.
    customer; -- Ordena os resultados pelo ID do cliente.