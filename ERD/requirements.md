**The Entity-Relationship Diagram (ERD) for the Airbnb Clone backend** 

It illustrates the core data entities and their interconnections within the system. The main entities include User, Property, Booking, Payment, Review, and Message. Each entity is designed with relevant attributes such as user_id in the User table or property_id in the Property table, most of which are uniquely identified using UUIDs. Relationships are clearly mapped: a User can have multiple Properties (as a host), make multiple Bookings (as a guest), and send or receive Messages. Bookings link guests to properties and may generate Payments; while technically modeled as a one-to-many relationship, the application logic typically enforces a one-to-one association. Similarly, Reviews connect Users and Properties, enforcing integrity by tying reviews to specific hosts or guests. The ERD provides a clear, structured view of how data flows and relates within the backend system, ensuring consistency and scalability in database operations

**Database Specification - AirBnB**
**Entities and Attributes**
**User**
user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Property**
property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

**Booking**
booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
total_price: DECIMAL, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Payment**
payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL

**Review**
review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Message**
message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

**Constraints**
User Table
Unique constraint on email.
Non-null constraints on required fields.

**Property Table**
Foreign key constraint on host_id.
Non-null constraints on essential attributes.

**Booking Table**
Foreign key constraints on property_id and user_id.
status must be one of pending, confirmed, or canceled.

**Payment Table**
Foreign key constraint on booking_id, ensuring payment is linked to valid bookings.

**Review Table**
Constraints on rating values (1-5).
Foreign key constraints on property_id and user_id.

**Message Table**
Foreign key constraints on sender_id and recipient_id.

**Indexing**
Primary Keys: Indexed automatically.

**Additional Indexes**
email in the User table.
property_id in the Property and Booking tables.
booking_id in the Booking and Payment tables.