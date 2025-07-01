-- Step 1: Enable profiling
SET profiling = 1;

-- Step 2: Run the original (slow) query
SELECT p.property_name, COUNT(*) AS total_bookings
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY b.property_id
ORDER BY total_bookings DESC;

-- Step 3: Show query profiles
SHOW PROFILES;
SHOW PROFILE FOR QUERY 1;

-- Step 4: Analyze execution plan
EXPLAIN ANALYZE
SELECT p.property_name, COUNT(*) AS total_bookings
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY b.property_id
ORDER BY total_bookings DESC;

-- Step 5: Create indexes to improve performance
CREATE INDEX idx_bookings_property_date ON bookings(property_id, booking_date);
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Step 6: Use optimized version of the query
SELECT p.property_name, stats.total_bookings
FROM (
    SELECT property_id, COUNT(*) AS total_bookings
    FROM bookings
    WHERE booking_date >= '2024-01-01'
    GROUP BY property_id
) AS stats
JOIN properties p ON stats.property_id = p.property_id
ORDER BY stats.total_bookings DESC;

-- Step 7: Recheck profile and execution plan after optimization
SHOW PROFILES;
SHOW PROFILE FOR QUERY 2;

EXPLAIN ANALYZE
SELECT p.property_name, stats.total_bookings
FROM (
    SELECT property_id, COUNT(*) AS total_bookings
    FROM bookings
    WHERE booking_date >= '2024-01-01'
    GROUP BY property_id
) AS stats
JOIN properties p ON stats.property_id = p.property_id
ORDER BY stats.total_bookings DESC;
