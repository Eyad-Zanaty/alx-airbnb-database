SELECT p.property_name, stats.total_bookings
FROM (
    SELECT property_id, COUNT(*) AS total_bookings
    FROM bookings
    WHERE booking_date >= '2024-01-01'
    GROUP BY property_id
) AS stats
JOIN properties p ON stats.property_id = p.property_id
ORDER BY stats.total_bookings DESC;
