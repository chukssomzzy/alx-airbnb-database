SELECT * FROM  properties
  WHERE properties.id = LATERAL (SELECT reviews.property_id 
    FROM reviews GROUP BY 
    reviews.property_id 
    HAVING reviews.property_id = properties.id 
    AND AVG(reviews.property_id) > 4.0);


SELECT * FROM users 
  WHERE users.id = LATERAL 
  (SELECT bookings.user_id 
    FROM bookings 
    GROUP BY bookings.user_id 
    HAVING COUNT(bookings.user_id) > 3);
