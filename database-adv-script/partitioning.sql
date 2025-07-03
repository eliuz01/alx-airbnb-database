--Rename the original bookings table
ALTER TABLE bookings RENAME TO bookings_old;

--Create new parent table with partitioning
CREATE TABLE bookings (
  booking_id CHAR(36),
  property_id CHAR(36) NOT NULL REFERENCES properties(property_id),
  user_id CHAR(36) NOT NULL REFERENCES users(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (booking_id, start_date)  -- FIX: include partition key in PK
) PARTITION BY RANGE (start_date);


--Create child partitions (adjust years as needed)
CREATE TABLE bookings_2024 PARTITION OF bookings
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
--Alter bookings_old to include total_price
ALTER TABLE bookings_old ADD COLUMN total_price DECIMAL(10, 2);

--calculate it based on price and duration
UPDATE bookings_old bo
SET total_price = p.price_per_night * (bo.end_date - bo.start_date)
FROM properties p
WHERE bo.property_id = p.property_id;


--Migrate data from old table to new partitions
INSERT INTO bookings
SELECT
  booking_id,
  property_id,
  user_id,
  start_date,
  end_date,
  total_price::NUMERIC,  -- Cast here
  status,
  created_at
FROM bookings_old;

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Step 5: Drop old table if everything looks good
-- DROP TABLE bookings_old;
