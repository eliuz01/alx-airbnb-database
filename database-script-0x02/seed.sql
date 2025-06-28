INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  ('uuid-1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '0712345678', 'guest', NOW()),
  ('uuid-2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0723456789', 'host', NOW()),
  ('uuid-3', 'Carol', 'Lee', 'carol@example.com', 'hashed_pw_3', '0734567890', 'admin', NOW());

-- Seeding Property Table
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at)
VALUES
  ('prop-1', 'uuid-2', 'Cozy Cottage', 'A lovely 2-bedroom cottage in the countryside.', 'Nairobi', 5000.00, NOW()),
  ('prop-2', 'uuid-2', 'Modern Apartment', 'A stylish apartment in the city center.', 'Mombasa', 7500.00, NOW());

-- Seeding Booking Table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  ('book-1', 'prop-1', 'uuid-1', '2025-07-10', '2025-07-15', 25000.00, 'confirmed', NOW()),
  ('book-2', 'prop-2', 'uuid-1', '2025-08-01', '2025-08-03', 15000.00, 'pending', NOW());


-- Seeding Payment Table
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  ('pay-1', 'book-1', 25000.00, NOW(), 'credit_card'),
  ('pay-2', 'book-2', 15000.00, NOW(), 'paypal');

INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  ('rev-1', 'prop-1', 'uuid-1', 5, 'Amazing place, very clean and quiet.', NOW()),
  ('rev-2', 'prop-2', 'uuid-1', 4, 'Nice apartment but a bit noisy at night.', NOW());


-- Seeding Message Table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  ('msg-1', 'uuid-1', 'uuid-2', 'Hi, is the cottage available in early July?', NOW()),
  ('msg-2', 'uuid-2', 'uuid-1', 'Yes, it is available from July 10 onwards.', NOW());