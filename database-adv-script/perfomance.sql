SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.username,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE b.id > 0 AND u.username > ' ';

EXPLAIN
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.username,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE b.id > 0 AND u.username > ' ';
