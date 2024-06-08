-- 1. Join the two tables to show all columns and records
SELECT
    O.ID         AS OWNER_ID,
    O.FIRST_NAME,
    O.LAST_NAME,
    V.ID         AS VEHICLE_ID,
    V.MAKE,
    V.MODEL,
    V.YEAR,
    V.PRICE,
    V.OWNER_ID
FROM
    OWNERS   O
    LEFT JOIN VEHICLES V
    ON O.ID = V.OWNER_ID;

-- 2. Count the number of cars for each owner
SELECT
    O.FIRST_NAME,
    O.LAST_NAME,
    COUNT(V.ID)  AS VEHICLE_COUNT
FROM
    OWNERS   O
    LEFT JOIN VEHICLES V
    ON O.ID = V.OWNER_ID
GROUP BY
    O.ID
ORDER BY
    O.FIRST_NAME ASC;

-- 3. Count the number of cars for each owner and display the average price
SELECT
    O.FIRST_NAME,
    O.LAST_NAME,
    AVG(V.PRICE)::INTEGER AS AVERAGE_PRICE,
    COUNT(V.ID) AS VEHICLE_COUNT
FROM
    OWNERS O
    LEFT JOIN VEHICLES V
    ON O.ID = V.OWNER_ID
GROUP BY
    O.ID
HAVING
    COUNT(V.ID) > 1
    AND AVG(V.PRICE) > 10000
ORDER BY
    O.FIRST_NAME DESC;