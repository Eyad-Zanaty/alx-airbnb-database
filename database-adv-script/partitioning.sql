DROP TABLE IF EXISTS booking CASCADE;

CREATE TABLE booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

CREATE TABLE booking_2023 PARTITION OF booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE INDEX idx_booking_2023_start_date ON booking_2023(start_date);
CREATE INDEX idx_booking_2024_start_date ON booking_2024(start_date);
CREATE INDEX idx_booking_2025_start_date ON booking_2025(start_date);

EXPLAIN ANALYZE
SELECT * FROM booking
WHERE start_date > '2024-01-01';
