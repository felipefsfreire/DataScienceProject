-- Desafio: Quais foram os 3 produtos mais vendidos (em quantidade) para cada estado?"
-- Requisitos:
-- Para cada estado, encontre os três produtos com maior quantidade total vendida.
-- A consulta deve retornar:
-- state (estado)
-- product (produto)
-- total_quantity (quantidade total vendida do produto na estado)
-- Se houver empate na quantidade vendida, desempate pelo produto em ordem alfabética.
---------------------------------------------------------------------------------------


WITH extractingState AS (
    SELECT
        TRIM(SUBSTR(address, INSTR(address, ' /') + 2)) AS state,
        customer_id
    FROM customers
),

topStateProductQuantity AS (
    SELECT
        es.state,
        p.product_name AS product,
        SUM(oi.order_quantity) AS total_quantity,
        rank() OVER (PARTITION BY es.state ORDER BY SUM(oi.order_quantity) DESC, p.product_name ASC) AS rank
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN extractingState es ON o.customer_id = es.customer_id
    GROUP BY es.state, p.product_name
)

SELECT
    state,
    product,
    total_quantity,
    rank
FROM topStateProductQuantity
WHERE rank <= 3