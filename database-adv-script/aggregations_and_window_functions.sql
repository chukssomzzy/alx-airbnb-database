SELECT count(b.id) 
  FROM 
    bookings b 
  INNER JOIN 
    users s 
  ON 
    b.user_id = s.id 
  GROUP BY 
    s.id;

SELECT 
    p.*, 
    COUNT(b.property_id) as booking_count, 
    RANK() OVER (ORDER BY COUNT(b.property_id)) as booking_rank 
  FROM 
    properties p 
  INNER JOIN 
    bookings b 
  ON 
    properties.id = bookings.property_id 
  GROUP BY 
    p.id
  ORDER BY 
    booking_rank ASC; 
