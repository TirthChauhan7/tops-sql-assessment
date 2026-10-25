USE m4a1_section_b;

-- Task 3: Customer-Order-Restaurant Joined Report
-- ============================================================

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    city VARCHAR(60) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(60) NOT NULL,
    city VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO customers (customer_id, name, city, phone) VALUES
    (1, 'Aarav Shah', 'Mumbai', '9000000001'),
    (2, 'Meera Patel', 'Pune', '9000000002'),
    (3, 'Kabir Mehta', 'Surat', '9000000003'),
    (4, 'Isha Rao', 'Mumbai', '9000000004'),
    (5, 'Vivaan Desai', 'Pune', '9000000005'),
    (6, 'Anaya Shah', 'Surat', '9000000006');

INSERT INTO restaurants (restaurant_id, name, cuisine_type, city) VALUES
    (11, 'Spice Route', 'Indian', 'Mumbai'),
    (12, 'Green Bowl', 'Healthy', 'Pune'),
    (13, 'Pasta House', 'Italian', 'Surat'),
    (14, 'Burger Bay', 'American', 'Mumbai'),
    (15, 'Curry Corner', 'Indian', 'Pune'),
    (16, 'Wok Express', 'Chinese', 'Surat');

-- Customers 5 and 6 have no orders.
INSERT INTO orders (order_id, customer_id, restaurant_id, amount, order_date) VALUES
    (301, 1, 11, 850.00, '2026-10-01'),
    (302, 2, 12, 620.00, '2026-10-02'),
    (303, 3, 13, 940.00, '2026-10-03'),
    (304, 4, 14, 510.00, '2026-10-04'),
    (305, 1, 14, 760.00, '2026-10-06'),
    (306, 2, 15, 430.00, '2026-10-07');
    
-- INNER JOIN: show each order with its customer and restaurant.
SELECT o.order_id, c.name AS customer_name, r.name AS restaurant_name,
       o.amount, o.order_date
FROM orders AS o
INNER JOIN customers AS c ON c.customer_id = o.customer_id
INNER JOIN restaurants AS r ON r.restaurant_id = o.restaurant_id
ORDER BY o.order_id;

-- LEFT JOIN: keep every customer, including customers with no orders.
SELECT c.customer_id, c.name AS customer_name, c.city AS customer_city,
       o.order_id, o.amount, o.order_date
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_date;

-- Show only orders where the customer and restaurant are in the same city.
SELECT o.order_id, c.name AS customer_name, c.city AS customer_city,
       r.name AS restaurant_name, r.city AS restaurant_city, o.amount, o.order_date
FROM orders AS o
INNER JOIN customers AS c ON c.customer_id = o.customer_id
INNER JOIN restaurants AS r ON r.restaurant_id = o.restaurant_id
WHERE c.city = r.city
ORDER BY o.order_id;

