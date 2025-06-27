# alx-airbnb-database

**✅ Normalization Summary (for README or normalization.md)**
*📄 Database Normalization Summary*
To ensure data integrity and reduce redundancy, the Airbnb Clone backend schema was normalized up to Third Normal Form (3NF):

First Normal Form (1NF): All tables store atomic data. There are no repeating groups or nested fields.

Second Normal Form (2NF): All non-key attributes are fully functionally dependent on their table's primary key. Each table uses a single-column UUID primary key.

Third Normal Form (3NF): No transitive dependencies exist. Every non-key attribute depends only on the primary key.

A special note is made for the Booking table, where total_price is a derived field; this is considered acceptable given performance tradeoffs, provided the value is recalculated correctly during the booking operation.

*As a result, the database design ensures:*
Scalability through a clean relational model.
Data consistency by minimizing duplication.
Maintainability for long-term development