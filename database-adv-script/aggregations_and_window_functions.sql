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
-- Count total bookings made by each user
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY user_id;

-- Use RANK() to rank properties by total number of bookings
SELECT 
    property_id,
    name,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS rank
FROM (
    SELECT 
        properties.property_id,
        properties.name,
        COUNT(bookings.booking_id) AS booking_count
    FROM properties
    LEFT JOIN bookings ON properties.property_id = bookings.property_id
    GROUP BY properties.property_id, properties.name
) AS ranked_properties
ORDER BY rank;

-- Use ROW_NUMBER() to assign unique row numbers to properties based on booking count
SELECT 
    property_id,
    name,
    booking_count,
    ROW_NUMBER() OVER (ORDER BY booking_count DESC) AS row_num
FROM (
    SELECT 
        properties.property_id,
        properties.name,
        COUNT(bookings.booking_id) AS booking_count
    FROM properties
    LEFT JOIN bookings ON properties.property_id = bookings.property_id
    GROUP BY properties.property_id, properties.name
) AS numbered_properties
ORDER BY row_num;


