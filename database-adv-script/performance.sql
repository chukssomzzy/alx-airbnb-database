--- Query to retrieve all boooking along with user details, property details, and booking status 

SELECT 
  b.*, 
  u.*, 
  p.*, 
  pay.*
FROM booking b
INNER JOIN users u ON u.id = b.user_id
INNER JOIN properties p ON p.id = b.property_id
INNER JOIN payments pay ON pay.booking_id = b.id;


EXPLAIN ANALYZE
SELECT 
  b.*, 
  u.*, 
  p.*, 
  pay.*
FROM booking b
INNER JOIN users u ON u.id = b.user_id
INNER JOIN properties p ON p.id = b.property_id
INNER JOIN payments pay ON pay.booking_id = b.id
WHERE b.status = 'confirmed' AND u.email LIKE '@example.com%';

CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_users_id ON users(id);          -- often primary key
CREATE INDEX idx_properties_id ON properties(id); 

SELECT 
  b.id AS booking_id, b.status, b.created_at, 
  u.id AS user_id, u.name, u.email, 
  p.id AS property_id, p.name AS property_name, p.location, 
  pay.id AS payment_id, pay.amount, pay.status AS payment_status
FROM booking b
INNER JOIN users u ON u.id = b.user_id
INNER JOIN properties p ON p.id = b.property_id
INNER JOIN payments pay ON pay.booking_id = b.id;
