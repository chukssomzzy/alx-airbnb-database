--- Query to retrieve all boooking along with user details, property details, and booking status 

SELECT b.*, u.*, p.* FROM users u INNER JOIN booking b ON u.id = b.user_id INNER JOIN properties p ON b.property_id = p.id;

EXPLAIN ANALYZE SELECT b.*, u.*, p.* FROM users u INNER JOIN booking b ON u.id = b.user_id INNER JOIN properties p ON b.property_id = p.id;

CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_users_id ON users(id);          -- often primary key
CREATE INDEX idx_properties_id ON properties(id); 

SELECT 
  b.id AS booking_id, b.status, b.created_at, 
  u.id AS user_id, u.name, u.email, 
  p.id AS property_id, p.name AS property_name
FROM booking b
INNER JOIN users u ON u.id = b.user_id
INNER JOIN properties p ON p.id = b.property_id;
