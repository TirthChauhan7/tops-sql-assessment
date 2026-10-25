CREATE DATABASE IF NOT EXISTS m4a1_section_b;
USE m4a1_section_b;

-- Task 1: Menu & Order Explorer
-- ============================================================

CREATE TABLE IF NOT EXISTS food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(80) NOT NULL,
    restaurant_name VARCHAR(100) NOT NULL,
    item_ordered VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price_per_item DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL,
    city VARCHAR(60) NOT NULL
);

INSERT INTO food_orders
    (order_id, customer_name, restaurant_name, item_ordered, quantity, price_per_item, order_date, city)
VALUES
    (101, 'Aarav Shah', 'Spice Route', 'Paneer Tikka', 2, 320.00, '2026-10-02', 'Mumbai'),
    (102, 'Meera Patel', 'Green Bowl', 'Quinoa Bowl', 1, 480.00, '2026-10-03', 'Mumbai'),
    (103, 'Kabir Mehta', 'Pasta House', 'Truffle Pasta', 2, 650.00, '2026-10-04', 'Pune'),
    (104, 'Isha Rao', 'Spice Route', 'Biryani Combo', 3, 275.00, '2026-10-05', 'Mumbai'),
    (105, 'Vivaan Desai', 'Burger Bay', 'Double Burger', 2, 410.00, '2026-10-06', 'Surat'),
    (106, 'Anaya Shah', 'Green Bowl', 'Avocado Salad', 1, 525.00, '2026-10-07', 'Pune'),
    (107, 'Reyansh Kulkarni', 'Pasta House', 'Family Lasagna', 2, 720.00, '2026-10-08', 'Mumbai'),
    (108, 'Sara Khan', 'Burger Bay', 'Classic Burger', 1, 350.00, '2026-10-09', 'Surat');
    
-- Retrieve Mumbai orders, with the highest price per item.
SELECT *
FROM food_orders
WHERE city = 'Mumbai'
ORDER BY price_per_item DESC;

-- List each restaurant that has received at least one order.
SELECT DISTINCT restaurant_name
FROM food_orders
ORDER BY restaurant_name;

-- Show top 5 most expensive individual orders using ORDER BY and LIMIT.
SELECT order_id, customer_name, restaurant_name, item_ordered,
       quantity, price_per_item,
       quantity * price_per_item AS order_total
FROM food_orders
ORDER BY order_total DESC
LIMIT 5;

