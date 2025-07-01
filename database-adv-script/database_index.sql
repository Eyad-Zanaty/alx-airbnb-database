CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_username ON User(username);

EXPLAIN ANALYZE
SELECT * FROM INDEX idx_user_username ;

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_booking_date ON Booking(booking_date);
CREATE INDEX idx_booking_status ON Booking(status);

CREATE INDEX idx_property_owner_id ON Property(owner_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);
CREATE INDEX idx_property_availability ON Property(availability_status);
