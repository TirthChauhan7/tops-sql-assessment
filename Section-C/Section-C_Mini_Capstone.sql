CREATE DATABASE IF NOT EXISTS m4a1_section_c;
USE m4a1_section_c;

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

CREATE TABLE IF NOT EXISTS delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(80) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    agent_id INT NOT NULL,
    order_amount DECIMAL(10, 2) NOT NULL,
    order_date DATETIME NOT NULL,
    delivery_time_mins INT NOT NULL,
    
    CONSTRAINT fk_capstone_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
        
    CONSTRAINT fk_capstone_orders_restaurant
        FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
        
    CONSTRAINT fk_capstone_orders_agent
        FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);

INSERT INTO customers (customer_id, name, city, phone) VALUES
    (1, 'Aarav Shah', 'Mumbai', '9100000001'),
    (2, 'Meera Patel', 'Mumbai', '9100000002'),
    (3, 'Kabir Mehta', 'Mumbai', '9100000003'),
    (4, 'Isha Rao', 'Mumbai', '9100000004'),
    (5, 'Vivaan Desai', 'Pune', '9100000005'),
    (6, 'Anaya Kulkarni', 'Pune', '9100000006'),
    (7, 'Reyansh Joshi', 'Pune', '9100000007'),
    (8, 'Sara Shah', 'Pune', '9100000008'),
    (9, 'Arjun Mehta', 'Surat', '9100000009'),
    (10, 'Diya Patel', 'Surat', '9100000010'),
    (11, 'Ishaan Desai', 'Surat', '9100000011'),
    (12, 'Tara Rao', 'Surat', '9100000012');

INSERT INTO restaurants (restaurant_id, name, cuisine_type, city) VALUES
    (101, 'Spice Route', 'Indian', 'Mumbai'),
    (102, 'Mumbai Tiffin', 'Indian', 'Mumbai'),
    (103, 'Green Bowl', 'Healthy', 'Mumbai'),
    (104, 'Pasta House', 'Italian', 'Mumbai'),
    (105, 'Pune Pantry', 'Indian', 'Pune'),
    (106, 'Deccan Delight', 'Indian', 'Pune'),
    (107, 'Green Spoon', 'Healthy', 'Pune'),
    (108, 'Tapi Tastes', 'Indian', 'Surat'),
    (109, 'Surat Spice', 'Indian', 'Surat'),
    (110, 'Riverfront Bites', 'Multi-cuisine', 'Surat');
    
INSERT INTO delivery_agents (agent_id, agent_name, phone) VALUES
    (201, 'Rohan', '9200000001'),
    (202, 'Sana', '9200000002'),
    (203, 'Dev', '9200000003'),
    (204, 'Mira', '9200000004'),
    (205, 'Neel', '9200000005'),
    (206, 'Tara', '9200000006'),
    (207, 'Karan', '9200000007'),
    (208, 'Priya', '9200000008'),
    (209, 'Arjun', '9200000009'),
    (210, 'Zoya', '9200000010');
    
INSERT INTO orders
    (order_id, customer_id, restaurant_id, agent_id, order_amount, order_date, delivery_time_mins)
VALUES
    (301, 1, 101, 201, 2000.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), 24),
    (302, 1, 102, 202, 1800.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), 28),
    (303, 1, 103, 203, 1500.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), 26),
    (304, 2, 101, 204, 1400.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), 35),
    (305, 2, 102, 205, 1300.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), 32),
    (306, 2, 104, 206, 1200.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), 38),
    (307, 3, 101, 207, 500.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), 20),
    (308, 3, 102, 208, 600.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY), 23),
    (309, 3, 103, 209, 700.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), 22),
    (310, 4, 101, 210, 900.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), 30),
    (311, 4, 102, 201, 850.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY), 27),
    (312, 4, 104, 202, 800.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), 33),
    
	(313, 5, 105, 203, 2200.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), 25),
    (314, 5, 106, 204, 1900.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), 29),
    (315, 5, 107, 205, 1500.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), 31),
    (316, 6, 105, 206, 500.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), 40),
    (317, 6, 106, 207, 600.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), 36),
    (318, 6, 107, 208, 700.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), 34),
    (319, 7, 105, 209, 1200.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), 26),
    (320, 7, 106, 210, 1300.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY), 28),
    (321, 7, 107, 201, 1400.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), 30),
    (322, 8, 105, 202, 800.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), 32),
    (323, 8, 106, 203, 900.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY), 35),
    (324, 8, 107, 204, 1000.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), 37),
    
    (325, 9, 108, 205, 2100.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), 23),
    (326, 9, 109, 206, 1800.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), 27),
    (327, 9, 110, 207, 1500.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 3 DAY), 29),
    (328, 10, 108, 208, 1300.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 4 DAY), 33),
    (329, 10, 109, 209, 1200.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY), 31),
    (330, 10, 110, 210, 1100.00, DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 8 DAY), 34),
    (331, 11, 108, 201, 500.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY), 38),
    (332, 11, 109, 202, 600.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 6 DAY), 36),
    (333, 11, 110, 203, 700.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 9 DAY), 40),
    (334, 12, 108, 204, 900.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 DAY), 25),
    (335, 12, 109, 205, 850.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 7 DAY), 30),
    (336, 12, 110, 206, 800.00,  DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY), 32);
    
-- ============================================================
-- 3. Revenue report: more than 3 orders per restaurant
SELECT r.restaurant_id,
       r.name AS restaurant_name,
       r.city,
       COUNT(o.order_id) AS total_orders,
       SUM(o.order_amount) AS total_revenue,
       ROUND(AVG(o.order_amount), 2) AS average_order_value
FROM restaurants AS r
INNER JOIN orders AS o ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.name, r.city
HAVING COUNT(o.order_id) > 3
ORDER BY total_revenue DESC;

-- 4. Customer segments by total spend
WITH customer_spend AS (
    SELECT c.customer_id,
           c.name AS customer_name,
           c.city,
           COALESCE(SUM(o.order_amount), 0) AS total_spend
    FROM customers AS c
    LEFT JOIN orders AS o ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.name, c.city
)
SELECT customer_id,
       customer_name,
       city,
       total_spend,
       CASE
           WHEN total_spend > 5000 THEN 'Platinum'
           WHEN total_spend >= 2000 THEN 'Gold'
           ELSE 'Standard'
       END AS customer_segment
FROM customer_spend
ORDER BY total_spend DESC, customer_id;


-- 5. Top 3 restaurants by revenue within each city
WITH restaurant_revenue AS (
    SELECT r.restaurant_id,
           r.name AS restaurant_name,
           r.city,
           COALESCE(SUM(o.order_amount), 0) AS total_revenue
    FROM restaurants AS r
    LEFT JOIN orders AS o ON o.restaurant_id = r.restaurant_id
    GROUP BY r.restaurant_id, r.name, r.city
),
ranked_restaurants AS (
    SELECT restaurant_id,
           restaurant_name,
           city,
           total_revenue,
           DENSE_RANK() OVER (
               PARTITION BY city
               ORDER BY total_revenue DESC
           ) AS revenue_rank
    FROM restaurant_revenue
)
SELECT city, restaurant_name, total_revenue, revenue_rank
FROM ranked_restaurants
WHERE revenue_rank <= 3
ORDER BY city, revenue_rank, restaurant_name;


-- 6. Most recent order for every customer (one row per customer)
WITH ranked_customer_orders AS (
    SELECT o.order_id,
           o.customer_id,
           o.restaurant_id,
           o.agent_id,
           o.order_amount,
           o.order_date,
           ROW_NUMBER() OVER (
               PARTITION BY o.customer_id
               ORDER BY o.order_date DESC, o.order_id DESC
           ) AS order_recency
    FROM orders AS o
)
SELECT c.customer_id,
       c.name AS customer_name,
       r.name AS restaurant_name,
       a.agent_name,
       ro.order_id,
       ro.order_amount,
       ro.order_date
FROM ranked_customer_orders AS ro
INNER JOIN customers AS c ON c.customer_id = ro.customer_id
INNER JOIN restaurants AS r ON r.restaurant_id = ro.restaurant_id
INNER JOIN delivery_agents AS a ON a.agent_id = ro.agent_id
WHERE ro.order_recency = 1
ORDER BY c.customer_id;

-- 7. Daily order summary view and last-seven-days query
CREATE OR REPLACE VIEW vw_daily_order_summary AS
SELECT DATE(o.order_date) AS order_date,
       c.name AS customer_name,
       r.name AS restaurant_name,
       a.agent_name,
       o.order_amount,
       o.delivery_time_mins
FROM orders AS o
INNER JOIN customers AS c ON c.customer_id = o.customer_id
INNER JOIN restaurants AS r ON r.restaurant_id = o.restaurant_id
INNER JOIN delivery_agents AS a ON a.agent_id = o.agent_id;

SELECT order_date,
       customer_name,
       restaurant_name,
       agent_name,
       order_amount,
       delivery_time_mins
FROM vw_daily_order_summary
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
ORDER BY order_date DESC, customer_name;
