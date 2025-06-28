# 🧩 Database Schema Design – Airbnb Clone Backend

This document outlines the SQL-based database schema design for the Airbnb Clone backend. The schema includes all required entities, their relationships, and associated constraints as defined in the system's specifications. The design follows relational database best practices and has been normalized up to **Third Normal Form (3NF)** to eliminate redundancy and ensure data integrity.

## 🏛️ Overview of Tables

The schema consists of six core tables:

1. **User**
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

Each table is defined using appropriate data types, primary keys (UUIDs), foreign keys, and constraints such as `NOT NULL`, `UNIQUE`, and `ENUM`.

---

## 📘 Table Descriptions

### 1. `User`

- Stores information about all users (guests, hosts, admins).
- Uses `role` as an ENUM to distinguish user types.
- `email` is enforced as a unique login identifier.

### 2. `Property`

- Represents listings created by users with `role = host`.
- Each property is linked to a host via the `host_id` foreign key.
- Price per night is stored as a `DECIMAL` value.
- `created_at` and `updated_at` fields track changes.

### 3. `Booking`

- Links users (guests) with specific properties.
- Tracks booking duration, total price, and status (`pending`, `confirmed`, or `canceled`).
- Foreign keys ensure that bookings are tied to existing users and properties.

### 4. `Payment`

- Records transactions associated with bookings.
- Includes the payment method and timestamp.
- Linked to bookings via `booking_id`.

### 5. `Review`

- Allows guests to leave feedback for properties.
- Ratings are constrained between 1 and 5.
- Tied to both the user and the property being reviewed.

### 6. `Message`

- Facilitates internal messaging between users (guests ↔ hosts).
- Each message records sender and recipient, content, and timestamp.

---

## 🧠 Design Principles

- **Normalization**: All tables are in **Third Normal Form (3NF)**. Composite attributes and transitive dependencies were avoided.
- **Data Types**: `CHAR(36)` is used to store UUIDs for consistent uniqueness and indexing.
- **Constraints**:
  - `NOT NULL` constraints on mandatory fields.
  - `UNIQUE` constraints on user emails.
  - `CHECK` constraints (e.g., for review ratings).
- **Relationships**:
  - One-to-many: Users → Properties, Users → Bookings, Property → Bookings.
  - One-to-one (by logic): Bookings → Payments.
  - Many-to-one: Reviews (User, Property), Messages (Sender → Recipient).

---

## ⚙️ Indexing

To optimize query performance, indexes have been added to:

- `email` in `User`
- `host_id` in `Property`
- `property_id`, `user_id` in `Booking`
- `booking_id` in `Payment`
- `user_id`, `property_id` in `Review`
- `sender_id`, `recipient_id` in `Message`

These indexes support efficient lookups and JOIN operations.

---

## 📄 SQL Files

You can find the SQL `CREATE TABLE` statements in the `schema.sql` file in this repository, ready to be imported into any standard MySQL-compatible database system.

---

## 📌 Note

This schema serves as the foundation for building secure, scalable, and efficient backend logic for the Airbnb Clone platform. It’s designed to support future enhancements like availability calendars, saved listings, and administrative moderation tools.

