CREATE DATABASE IF NOT EXISTS food_delivery_analytics;
USE food_delivery_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(50),
    city VARCHAR(50) NOT NULL
);

CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    agent_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    delivery_time_mins INT,
    order_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);

-- USE food_delivery_analytics;

INSERT INTO customers (customer_id, name, city, phone) VALUES
(1, 'Aarav Patel', 'Anand', '9876500001'),
(2, 'Diya Shah', 'Ahmedabad', '9876500002'),
(3, 'Krish Mehta', 'Surat', '9876500003'),
(4, 'Anaya Desai', 'Vadodara', '9876500004'),
(5, 'Rohan Joshi', 'Anand', '9876500005'),
(6, 'Mira Trivedi', 'Ahmedabad', '9876500006'),
(7, 'Dev Shah', 'Surat', '9876500007'),
(8, 'Kiara Patel', 'Vadodara', '9876500008'),
(9, 'Yash Parmar', 'Anand', '9876500009'),
(10, 'Isha Dave', 'Ahmedabad', '9876500010');

INSERT INTO restaurants (restaurant_id, name, cuisine_type, city) VALUES
(1, 'Spice Garden', 'Indian', 'Anand'),
(2, 'Urban Bites', 'Fast Food', 'Anand'),
(3, 'Royal Thali', 'Indian', 'Anand'),
(4, 'Food Junction', 'Chinese', 'Anand'),
(5, 'Green Bowl', 'Healthy', 'Ahmedabad'),
(6, 'Tandoori Tales', 'Indian', 'Ahmedabad'),
(7, 'Pizza Corner', 'Italian', 'Ahmedabad'),
(8, 'Surat Street Food', 'Street Food', 'Surat'),
(9, 'Coastal Kitchen', 'Seafood', 'Surat'),
(10, 'Vadodara Cafe', 'Cafe', 'Vadodara');

INSERT INTO delivery_agents (agent_id, agent_name, city) VALUES
(1, 'Aarav', 'Anand'),
(2, 'Riya', 'Anand'),
(3, 'Dev', 'Anand'),
(4, 'Neha', 'Ahmedabad'),
(5, 'Karan', 'Ahmedabad'),
(6, 'Pooja', 'Ahmedabad'),
(7, 'Jay', 'Surat'),
(8, 'Mihir', 'Surat'),
(9, 'Sana', 'Vadodara'),
(10, 'Rahul', 'Vadodara');

INSERT INTO orders
(order_id, customer_id, restaurant_id, agent_id, amount,
 order_date, delivery_time_mins, order_status)
VALUES
(1, 1, 1, 1, 1200, '2026-10-01', 20, 'Completed'),
(2, 2, 5, 4, 2500, '2026-10-02', 25, 'Completed'),
(3, 3, 8, 7, 1800, '2026-10-03', 30, 'Completed'),
(4, 4, 10, 9, 900, '2026-10-04', 22, 'Completed'),
(5, 5, 2, 2, 2200, '2026-10-05', 28, 'Completed'),
(6, 6, 6, 5, 3200, '2026-10-06', 24, 'Completed'),
(7, 7, 9, 8, 4500, '2026-10-07', 35, 'Completed'),
(8, 8, 10, 10, 1500, '2026-10-08', 26, 'Completed'),
(9, 9, 3, 3, 2800, '2026-10-09', 21, 'Completed'),
(10, 10, 7, 6, 2100, '2026-10-10', 27, 'Completed'),
(11, 1, 1, 1, 1600, '2026-10-11', 19, 'Completed'),
(12, 2, 5, 4, 1800, '2026-10-12', 23, 'Completed'),
(13, 3, 8, 7, 2300, '2026-10-13', 32, 'Completed'),
(14, 5, 2, 2, 1400, '2026-10-14', 29, 'Completed'),
(15, 6, 6, 5, 2700, '2026-10-15', 26, 'Completed'),
(16, 7, 9, 8, 3500, '2026-10-16', 34, 'Completed'),
(17, 9, 3, 3, 1900, '2026-10-17', 20, 'Completed'),
(18, 10, 7, 6, 2400, '2026-10-18', 25, 'Completed'),
(19, 1, 4, 1, 1300, '2026-10-19', 24, 'Completed'),
(20, 2, 5, 4, 2100, '2026-10-20', 22, 'Completed'),
(21, 3, 8, 7, 1600, '2026-10-21', 31, 'Completed'),
(22, 4, 10, 9, 1100, '2026-10-22', 23, 'Completed'),
(23, 5, 2, 2, 2600, '2026-10-23', 27, 'Completed'),
(24, 6, 6, 5, 1900, '2026-10-24', 25, 'Completed');

INSERT INTO orders
(order_id, customer_id, restaurant_id, agent_id, amount,
 order_date, delivery_time_mins, order_status)
VALUES
-- Anand:
(25, 1, 1, 1, 1200, '2026-10-18', 20, 'Completed'),
(26, 5, 2, 1, 1500, '2026-10-19', 22, 'Completed'),
(27, 9, 3, 1, 1800, '2026-10-20', 21, 'Completed'),
(28, 1, 4, 1, 1300, '2026-10-21', 24, 'Completed'),
(29, 5, 1, 1, 1600, '2026-10-22', 19, 'Completed'),
(30, 9, 2, 1, 1700, '2026-10-23', 23, 'Completed'),
(31, 1, 3, 1, 1400, '2026-10-24', 20, 'Completed'),

-- Anand:
(32, 5, 1, 2, 1100, '2026-10-18', 28, 'Completed'),
(33, 9, 2, 2, 1400, '2026-10-19', 27, 'Completed'),
(34, 1, 3, 2, 1300, '2026-10-20', 29, 'Completed'),
(35, 5, 4, 2, 1600, '2026-10-21', 26, 'Completed'),
(36, 9, 1, 2, 1500, '2026-10-22', 25, 'Completed'),
(37, 1, 2, 2, 1200, '2026-10-23', 27, 'Completed'),

-- Ahmedabad:
(38, 2, 5, 4, 1800, '2026-10-18', 24, 'Completed'),
(39, 6, 6, 4, 2100, '2026-10-19', 23, 'Completed'),
(40, 10, 7, 4, 1900, '2026-10-20', 25, 'Completed'),
(41, 2, 5, 4, 1700, '2026-10-21', 22, 'Completed'),
(42, 6, 6, 4, 2200, '2026-10-22', 24, 'Completed'),
(43, 10, 7, 4, 2000, '2026-10-23', 21, 'Completed'),

-- Ahmedabad:
(44, 2, 6, 5, 1600, '2026-10-18', 26, 'Completed'),
(45, 6, 7, 5, 1900, '2026-10-19', 25, 'Completed'),
(46, 10, 5, 5, 1800, '2026-10-20', 27, 'Completed'),
(47, 2, 6, 5, 1700, '2026-10-21', 24, 'Completed'),
(48, 6, 7, 5, 2000, '2026-10-22', 26, 'Completed'),
(49, 10, 5, 5, 1500, '2026-10-23', 23, 'Completed');

-- AI-generated query.

WITH city_agent_stats AS (
    SELECT
        r.city,
        da.agent_id,
        da.agent_name,
        COUNT(*) AS completed_orders,
        AVG(o.delivery_time_mins) AS avg_delivery_time
    FROM orders o
    JOIN restaurants r
        ON o.restaurant_id = r.restaurant_id
    JOIN delivery_agents da
        ON o.agent_id = da.agent_id
    WHERE o.order_status = 'Completed'
    GROUP BY r.city, da.agent_id, da.agent_name
),
ranked_agents AS (
    SELECT
        city,
        agent_id,
        agent_name,
        completed_orders,
        avg_delivery_time,
        RANK() OVER (			-- AI USE RANK()
            PARTITION BY city
            ORDER BY completed_orders DESC
        ) AS agent_rank
    FROM city_agent_stats
)
SELECT
    city,
    agent_name,
    completed_orders,
    ROUND(avg_delivery_time, 2) AS avg_delivery_time,
    agent_rank
FROM ranked_agents
WHERE completed_orders > 5
  AND agent_rank <= 3
ORDER BY city ASC, agent_rank ASC;

-- Corrected query.

WITH city_agent_stats AS (
    SELECT
        r.city,
        da.agent_id,
        da.agent_name,
        COUNT(*) AS completed_orders,
        AVG(o.delivery_time_mins) AS avg_delivery_time
    FROM orders o
    JOIN restaurants r
        ON o.restaurant_id = r.restaurant_id
    JOIN delivery_agents da
        ON o.agent_id = da.agent_id
    WHERE o.order_status = 'Completed'
    GROUP BY r.city, da.agent_id, da.agent_name
),
eligible_agents AS (
    SELECT *
    FROM city_agent_stats
    WHERE completed_orders > 5
),
ranked_agents AS (
    SELECT
        city,
        agent_id,
        agent_name,
        completed_orders,
        avg_delivery_time,
        ROW_NUMBER() OVER (        -- Use ROW_NUMBER()
            PARTITION BY city
            ORDER BY completed_orders DESC,
                     avg_delivery_time ASC,
                     agent_id ASC
        ) AS agent_rank
    FROM eligible_agents
)
SELECT
    city,
    agent_name,
    completed_orders,
    ROUND(avg_delivery_time, 2) AS avg_delivery_time,
    agent_rank
FROM ranked_agents
WHERE agent_rank <= 3
ORDER BY city ASC, agent_rank ASC;