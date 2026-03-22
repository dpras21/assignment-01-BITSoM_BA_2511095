Q1 — List all customers + total number of orders

SELECT
c.customer_id,
c.name,
COUNT(o.order_id) AS total_orders
FROM read_csv_auto('customers.csv') c
LEFT JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


Q2 — Top 3 customers by total order value

SELECT
c.customer_id,
c.name,
SUM(o.total_amount) AS total_value
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_value DESC
LIMIT 3;


Q3 — Products purchased by customers from Bangalore
SELECT
c.name,
p.product_name
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') p
ON o.product_id = p.product_id
WHERE c.city = 'Bangalore';


Q4 — Join all three → customer name, order date, product name, amount

SELECT
c.name,
o.order_date,
p.product_name,
o.total_amount
FROM read_csv_auto('customers.csv') c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') p
ON o.product_id = p.product_id;



