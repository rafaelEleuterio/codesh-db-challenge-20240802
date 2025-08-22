--Supondo que todos os produtos estejam registrados no estoque, mesmo que com quantidade 0
SELECT products.product_id, product_name FROM products
LEFT JOIN stocks ON stocks.product_id = products.product_id
GROUP BY products.product_id
HAVING SUM(stocks.quantity) > 0;