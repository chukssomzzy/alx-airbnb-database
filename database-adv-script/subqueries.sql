SELECT * FROM  properties
  WHERE properties.id = LATERAL (SELECT reviews.property_id 
    FROM reviews GROUP BY 
    reviews.property_id 
    HAVING reviews.property_id = properties.id 
    and avg(reviews.property_id) > 4.0);


SELECT * FROM users 
  WHERE users.id = LATERAL 
  (SELECT bookings.user_id 
    FROM bookings 
    GROUP BY bookings.user_id 
    HAVING sum(bookings.user_id) > 3);
