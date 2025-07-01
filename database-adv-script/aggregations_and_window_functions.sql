SELECT users , count(price) as user_count FROM airbnb_table group by price;

SELECT 
    airbnb_table.property_name,
    airbnb_table.total_bookings,
    RANK() OVER (ORDER BY airbnb_table.total_bookings DESC) AS ranking
FROM (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY property_id
) AS booking_counts
JOIN properties p ON airbnb_table.property_id = booking_counts.property_id;


SELECT users , count(price) as user_count FROM airbnb_table group by price;

SELECT 
    airbnb_table.property_name,
    airbnb_table.total_bookings,
    ROW_NUMBER() OVER (ORDER BY airbnb_table.total_bookings DESC) AS ranking
FROM (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY property_id
) AS booking_counts
JOIN properties p ON airbnb_table.property_id = booking_counts.property_id;
