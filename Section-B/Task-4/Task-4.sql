USE m4a1_section_b;

-- Task 4: Delivery Agent Performance Ranking
-- ============================================================

CREATE TABLE IF NOT EXISTS deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(80) NOT NULL,
    restaurant_name VARCHAR(100) NOT NULL,
    delivery_time_mins INT NOT NULL,
    order_date DATE NOT NULL
);

INSERT INTO deliveries
    (delivery_id, agent_name, restaurant_name, delivery_time_mins, order_date)
VALUES
    (401, 'Rohan', 'Spice Route', 24, '2026-10-01'),
    (402, 'Rohan', 'Green Bowl', 28, '2026-10-02'),
    (403, 'Rohan', 'Pasta House', 26, '2026-10-03'),
    (404, 'Sana', 'Burger Bay', 35, '2026-10-01'),
    (405, 'Sana', 'Spice Route', 32, '2026-10-04'),
    (406, 'Sana', 'Green Bowl', 38, '2026-10-05'),
    (407, 'Dev', 'Pasta House', 20, '2026-10-02'),
    (408, 'Dev', 'Burger Bay', 23, '2026-10-06'),
    (409, 'Dev', 'Spice Route', 22, '2026-10-07'),
    (410, 'Mira', 'Green Bowl', 30, '2026-10-03'),
    (411, 'Mira', 'Pasta House', 27, '2026-10-08'),
    (412, 'Mira', 'Burger Bay', 33, '2026-10-09');
    
-- Calculate average delivery time, rank agents, and classify them.
WITH agent_stats AS (
    SELECT agent_name,
           AVG(delivery_time_mins) AS avg_delivery_time
    FROM deliveries
    GROUP BY agent_name
),
ranked_agents AS (
    SELECT agent_name,
           avg_delivery_time,
           RANK() OVER (ORDER BY avg_delivery_time ASC) AS speed_rank
    FROM agent_stats
)
SELECT agent_name,
       ROUND(avg_delivery_time, 2) AS avg_delivery_time,
       speed_rank,
       ROUND((SELECT AVG(delivery_time_mins) FROM deliveries), 2) AS platform_avg_time,
       CASE
           WHEN avg_delivery_time <= (SELECT AVG(delivery_time_mins) FROM deliveries)
               THEN 'On Track'
           ELSE 'Needs Improvement'
       END AS performance_status
FROM ranked_agents
ORDER BY speed_rank, agent_name;