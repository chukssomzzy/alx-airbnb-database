-- This SQL script creates indexes for the 'users' table to optimize query performance.
CREATE INDEX IF NOT EXISTS idx_user_email ON users (email); 
CREATE INDEX IF NOT EXISTS idx_user_password ON users (password) USING HASH;
CREATE INDEX IF NOT EXISTS idx_user_created_at ON users (created_at); 

CREATE INDEX IF NOT EXISTS idx_property_description ON properties (description);
CREATE INDEX IF NOT EXISTS idx_property_name ON properties (name);
CREATE INDEX IF NOT EXISTS idx_property_price_per_night ON properties (price_per_night);
CREATE INDEX IF NOT EXISTS idx_property_created_at ON properties (created_at);

CREATE INDEX IF NOT EXISTS idx_booking_status ON booking (status) USING HASH;
CREATE INDEX IF NOT EXISTS idx_booking_start_date_status ON booking (start_date, status);
CREATE INDEX IF NOT EXISTS idx_booking_end_date_status ON booking (end_date, status);
CREATE INDEX IF NOT EXISTS idx_booking_start_date_end_date_status ON booking (start_date, end_date, status);
