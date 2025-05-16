SELECT * FROM users INNER JOIN bookings ON users.id = bookings.users_id;
SELECT * FROM properties LEFT JOIN reviews ON properties.id = reviews.property_id ORDER BY properties.id; 
SELECT * FROM users FULL OUTER JOIN bookings ON users.id = bookings.id
