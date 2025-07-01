# High Usage Columns
SELECT p.property_name, COUNT(*) AS total_bookings
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY b.property_id
ORDER BY total_bookings DESC;

SELECT p.property_name, COUNT(*) AS total_bookings
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY b.property_id
ORDER BY total_bookings DESC;

# Analyze
ANALYZE FORMAT=JSON
SELECT p.property_name, COUNT(*) AS total_bookings
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_date >= '2024-01-01'
GROUP BY b.property_id
ORDER BY total_bookings DESC;