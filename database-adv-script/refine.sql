--Frequently user query 
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  u.first_name,
  u.last_name,
  p.name AS property_name
FROM
  bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE
  b.start_date >= '2025-07-01'
  AND b.status = 'confirmed'
ORDER BY b.start_date DESC;

--Explan, analyze 
EXPLAIN ANALYZE
SELECT
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  u.first_name,
  u.last_name,
  p.name AS property_name
FROM
  bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
WHERE
  b.start_date >= '2025-07-01'
  AND b.status = 'confirmed'
ORDER BY b.start_date DESC;

--Create targeted indexes
-- For WHERE clause filtering
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- For JOINs
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
