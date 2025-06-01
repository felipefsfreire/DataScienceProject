SELECT
    --customer_name,
    --address,
    TRIM(SUBSTR(address, INSTR(address, ' /') + 2)) AS state
FROM customers
--WHERE state = 'RJ'
--AND address LIKE '%Chácara%';
LIMIT 10