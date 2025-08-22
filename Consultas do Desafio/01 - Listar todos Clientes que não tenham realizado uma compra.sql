SELECT customers.customer_id, first_name, last_name FRO Mcustomers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL;