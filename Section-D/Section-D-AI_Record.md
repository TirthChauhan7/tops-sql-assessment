# Section D — AI Record

## 1. AI Prompt

Write a MySQL 8 query to find the top 3 delivery agents in each city based on their number of completed orders. Show the city, agent name, completed order count, average delivery time, and rank. Include only agents with more than 5 completed orders in that city. Sort the results by city alphabetically and rank in ascending order. Use window functions and CTEs.

## 2. Original AI-Generated Query

```sql
USE food_delivery_analytics;

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
        RANK() OVER (
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
```

## 3. Corrected Query

```sql
USE food_delivery_analytics;

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
        ROW_NUMBER() OVER (
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
```

## 4. Bug Identified and Fix

The original query uses `RANK()`, which can assign the same rank to multiple agents when their completed order counts are tied. As a result, filtering for ranks up to three can return more than three agents per city. I replaced `RANK()` with `ROW_NUMBER()` and added average delivery time and agent ID as tie-breakers. This guarantees a maximum of three eligible agents per city.

## 5. Testing and Validation

- Executed the query using MySQL 8 and the `food_delivery_analytics` database.
- Verified the completed-order counts and average delivery times.
- Checked that only agents with more than five completed orders were eligible.
- Confirmed that the corrected query returns no more than three agents per city.