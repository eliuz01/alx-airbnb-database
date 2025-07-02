This section provides an overview of SQL JOIN queries implemented to demonstrate relational data retrieval between key entities in the Airbnb Clone database. Each query uses a different type of join (INNER JOIN, LEFT JOIN, FULL OUTER JOIN) to solve specific data access scenarios.

1. INNER JOIN: Bookings with User Details
This query retrieves all bookings along with the corresponding user information (the guest who made the booking).
An INNER JOIN ensures only bookings that are linked to an existing user are returned.
It combines data from the bookings and users tables based on a matching user_id.

2. LEFT JOIN: Properties with Reviews
This query lists all properties and their associated reviews, if any.
A LEFT JOIN is used to include all properties even if no reviews exist.
The result provides both property details and review content where available.
An ORDER BY clause is used to sort the results by property_id for readability.

3. FULL OUTER JOIN: All Users and Bookings
This query returns a comprehensive list of all users and all bookings.

A FULL OUTER JOIN ensures that every user and every booking is included in the results.

It returns:

Users with or without bookings.

Bookings even if not currently associated with a user (e.g., data integrity issues or temporary states).