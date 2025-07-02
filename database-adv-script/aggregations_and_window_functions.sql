--aggregation Query to find the total number of bookings made by each user
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id, users.first_name, users.last_name
ORDER BY total_bookings DESC;

--Window Function Query to Rank properties based on total number of bookings
SELECT 
    properties.property_id,
    properties.name,
    COUNT(bookings.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(bookings.booking_id) DESC) AS rank
FROM properties
LEFT JOIN bookings ON properties.property_id = bookings.property_id
GROUP BY properties.property_id, properties.name
ORDER BY rank;
