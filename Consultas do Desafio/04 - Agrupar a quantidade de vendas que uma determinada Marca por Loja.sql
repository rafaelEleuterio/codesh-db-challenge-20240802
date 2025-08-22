SELECT brands.brand_id, brands.brand_name, stores.store_id, stores.store_name, COUNT(*) AS nVendas FROM products
INNER JOIN brands ON brands.brand_id = products.brand_id
INNER JOIN order_items ON order_items.product_id = products.product_id
INNER JOIN orders ON orders.order_id = order_items.order_id
INNER JOIN stores ON stores.store_id = orders.store_id
GROUP BY order_items.product_id, orders.store_id, brands.brand_id, brands.brand_name, stores.store_id, stores.store_name;