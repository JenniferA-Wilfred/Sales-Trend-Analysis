-- Step 1: Create the table
CREATE TABLE orders (
    order_id INTEGER,
    order_date DATE,
    amount REAL,
    product_id INTEGER
);

-- Step 2: Insert sample data
INSERT INTO orders VALUES
(101, '2024-01-10', 250.00, 1),
(102, '2024-01-20', 300.00, 2),
(103, '2024-02-05', 150.00, 3),
(104, '2024-02-15', 200.00, 4),
(105, '2024-03-01', 180.00, 1),
(106, '2024-03-18', 170.00, 2),
(107, '2024-03-25', 150.00, 2);

-- Step 3: Monthly sales trend
SELECT 
  STRFTIME('%Y', order_date) AS year,
  STRFTIME('%m', order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;
