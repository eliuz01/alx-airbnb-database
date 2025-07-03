**Step 1: Identify High-Usage Columns**
Based on the queries we've written so far, the frequently used columns are:

Table	Column(s) Used in WHERE / JOIN / ORDER BY
users	email, user_id
bookings	user_id, property_id, booking_id
properties	property_id, host_id, location
reviews	property_id, user_id