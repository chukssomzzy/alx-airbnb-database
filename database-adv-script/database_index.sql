-- This SQL script creates indexes for the 'users' table to optimize query performance.
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'alx-bnb@alx.com';
CREATE INDEX IF NOT EXISTS idx_user_email ON users (email); 

EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'alx-bnb@alx.com' AND password = HASH('password123');
CREATE INDEX IF NOT EXISTS idx_user_password ON users USING HASH (email, password);

EXPLAIN ANALYZE SELECT * FROM users WHERE created_at > '2023-01-01';
CREATE INDEX IF NOT EXISTS idx_user_created_at ON users (created_at); 

EXPLAIN ANALYZE SELECT * FROM properties WHERE description ILIKE 'poolside%'; 
CREATE INDEX IF NOT EXISTS idx_property_description ON properties (description);

EXPLAIN ANALYZE SELECT * FROM properties WHERE name ILIKE 'luxury%';
CREATE INDEX IF NOT EXISTS idx_property_name ON properties (name);

EXPLAIN ANALYZE SELECT * FROM properties WHERE price_per_night > 100;
CREATE INDEX IF NOT EXISTS idx_property_price_per_night ON properties (price_per_night);

EXPLAIN ANALYZE SELECT * FROM properties WHERE created_at > '2023-01-01';
CREATE INDEX IF NOT EXISTS idx_property_created_at ON properties (created_at);

EXPLAIN ANALYZE SELECT * FROM booking WHERE status = 'confirmed';
CREATE INDEX IF NOT EXISTS idx_booking_status ON booking (status) USING HASH;

EXPLAIN ANALYZE SELECT * FROM booking WHERE start_date > '2023-01-01' AND end_date < '2023-12-31';
CREATE INDEX IF NOT EXISTS idx_booking_start_date_status ON booking (start_date, status);

EXPLAIN ANALYZE SELECT * FROM booking WHERE end_date < '2023-12-31' AND status = 'confirmed';
CREATE INDEX IF NOT EXISTS idx_booking_end_date_status ON booking (end_date, status);

EXPLAIN ANALYZE SELECT * FROM booking WHERE start_date < '2023-01-01' AND end_date > '2023-12-31' AND status = 'confirmed';
CREATE INDEX IF NOT EXISTS idx_booking_start_date_end_date_status ON booking (start_date, end_date, status);
