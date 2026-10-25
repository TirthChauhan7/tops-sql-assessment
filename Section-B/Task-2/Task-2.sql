USE m4a1_section_b;

-- Task 2: Restaurant Revenue Summary
-- ============================================================

CREATE TABLE IF NOT EXISTS delivery_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(60) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    order_date DATE NOT NULL
);

INSERT INTO delivery_orders
    (order_id, restaurant_name, city, total_amount, order_status, order_date)
VALUES
    (201, 'Spice Route', 'Mumbai', 1850.00, 'Completed', '2026-10-01'),
    (202, 'Spice Route', 'Mumbai', 2450.00, 'Completed', '2026-10-02'),
    (203, 'Spice Route', 'Mumbai', 1325.00, 'Completed', '2026-10-03'),
    (204, 'Spice Route', 'Mumbai', 980.00,  'Completed', '2026-10-04'),
    (205, 'Green Bowl', 'Pune', 2100.00, 'Completed', '2026-10-01'),
    (206, 'Green Bowl', 'Pune', 1750.00, 'Completed', '2026-10-02'),
    (207, 'Green Bowl', 'Pune', 2600.00, 'Completed', '2026-10-05'),
    (208, 'Pasta House', 'Surat', 3200.00, 'Completed', '2026-10-01'),
    (209, 'Pasta House', 'Surat', 2850.00, 'Completed', '2026-10-03'),
    (210, 'Pasta House', 'Surat', 4100.00, 'Completed', '2026-10-06'),
    (211, 'Burger Bay', 'Mumbai', 1450.00, 'Completed', '2026-10-02'),
    (212, 'Burger Bay', 'Mumbai', 1750.00, 'Completed', '2026-10-07');
    
-- Revenue, number of orders, and average order value for each restaurant.
SELECT restaurant_name,
       SUM(total_amount) AS total_revenue,
       COUNT(*) AS total_orders,
       ROUND(AVG(total_amount), 2) AS average_order_value
FROM delivery_orders
GROUP BY restaurant_name
ORDER BY total_revenue DESC;

-- Keep only restaurants with revenue above Rs 5,000.
SELECT restaurant_name,
       SUM(total_amount) AS total_revenue,
       COUNT(*) AS total_orders,
       ROUND(AVG(total_amount), 2) AS average_order_value
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000
ORDER BY total_revenue DESC;

-- Add the requested revenue label to each qualifying restaurant.
SELECT restaurant_name,
       SUM(total_amount) AS total_revenue,
       COUNT(*) AS total_orders,
       ROUND(AVG(total_amount), 2) AS average_order_value,
       CASE
           WHEN SUM(total_amount) > 10000 THEN 'High Revenue'
           ELSE 'Moderate Revenue'
       END AS revenue_category
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000
ORDER BY total_revenue DESC;
