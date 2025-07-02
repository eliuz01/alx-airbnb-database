SELECT bookings.booking_id, bookings.property_id, bookings.start_date, bookings.end_date, bookings.status, users.user_id, users.first_name, users.last_name, users.phone_number, users.email 
FROM  bookings
INNER JOIN users ON bookings.user_id = users.user_id;

SELECT properties.property_id, properties.name AS property_name, properties.description, properties.location, properties.price_per_night, reviews.review_id, reviews.user_id AS reviewer_id, reviews.rating, reviews.comment, reviews.created_at AS review_date
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;

SELECT users.user_id, users.first_name, users.last_name, bookings.booking_id, bookings.property_id, bookings.start_date, bookings.end_date, bookings.status
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
