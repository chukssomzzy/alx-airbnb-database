CREATE TABLE booking_partition (
  booking_id PRIMARY KEY UUID, 
  property_id REFERENCES property(property_id),
  user_id REFERENCES user(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
) PARTITION BY RANGE (start_date);


CREATE TABLE booking_partition_2023 PARTITION OF booking_partition
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_partition_2024 PARTITION OF booking_partition
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');


EXPLAIN ANALYZE SELECT *  FROM booking_partition WHERE start_date BETWEEN '2023-02-01' AND '2023-06-01'; 
