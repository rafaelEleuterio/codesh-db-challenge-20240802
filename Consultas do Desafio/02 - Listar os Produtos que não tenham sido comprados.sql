SELECT products.product_id, product_name FROM products
LEFT JOIN order_items ON order_items.product_id = products.product_id
WHERE order_id IS NULL;