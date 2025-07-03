## Performance Monitoring and Refinement
I monitored the performance of a frequently used query involving bookings, users, and properties using `EXPLAIN ANALYZE`. Initially, the query relied on sequential scans, leading to slower execution, especially on large datasets.

**To optimize performance:**
- We created indexes on `start_date`, `status`, `user_id`, and `property_id` in the `bookings` table.
- Ensured queries filtered by partition key (`start_date`) to benefit from partition pruning.

After applying these improvements, we observed:
- Switch from `Seq Scan` to `Index Scan` in the query plan
- Significantly lower total execution time from 0.185 ms to 0.156 ms
- More efficient use of system resources

These refinements ensure the system remains responsive and scalable as data grows.
