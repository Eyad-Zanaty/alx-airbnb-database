# Database Normalization to 3NF

## Objective

Ensure that the current schema design for the property booking platform adheres to **Third Normal Form (3NF)** by reviewing and resolving any redundancy, transitive dependency, or non-atomic attribute issues.

---

## Step 1: Review of Current Schema

### Entities:

- User
- Property
- Booking
- Payment
- Review
- Message

Each entity appears to have a clear **primary key**, **atomic fields**, and **foreign key relationships**.

---

## Step 2: First Normal Form (1NF)

**Definition:**  
All attributes must be atomic (no repeating groups or arrays).

**Review:**  
All fields in the schema (e.g., `email`, `rating`, `pricepernight`) are atomic.  
Schema is in **1NF**.

---

## Step 3: Second Normal Form (2NF)

**Definition:**  
No partial dependency of any column on a composite primary key (only applies when PK is composite).

**Review:**  
All tables use **single-column primary keys (UUIDs)**. Therefore, no partial dependency exists.  
Schema is in **2NF**.

---

## Step 4: Third Normal Form (3NF)

**Definition:**  
No transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Review of Tables:**

### User Table
- No transitive dependencies.
- Fields like `role`, `email`, etc., depend only on `user_id`.
In 3NF

### Property Table
- `host_id` is a foreign key to `User`.
- All other fields (name, description, location, pricepernight) depend only on `property_id`.
In 3NF

### Booking Table
- Attributes `start_date`, `end_date`, `status`, `total_price` depend only on `booking_id`.
- Foreign keys reference user and property correctly.
In 3NF

### Payment Table
- `amount`, `payment_date`, and `payment_method` depend only on `payment_id`.
- Correctly references `booking_id`.
In 3NF

### Review Table
- `rating`, `comment`, `created_at` depend on `review_id`.
- Foreign keys reference `user_id` and `property_id`.
In 3NF

### Message Table
- `message_body`, `sent_at` depend on `message_id`.
- Self-referencing foreign keys to `User` (sender, recipient).
In 3NF

---

## Final Result

All tables are:
- In **1NF** (atomic attributes)
- In **2NF** (no partial dependencies on composite keys)
- In **3NF** (no transitive dependencies)

**The database schema is fully normalized to 3NF.**

---

## Notes

- The schema avoids derived fields (like storing `number_of_nights` or `user_full_name`) to prevent redundancy.
- ENUMs are used for `role`, `status`, and `payment_method`. If extensibility is a concern, these could be moved into separate lookup tables, though that is not required for 3NF compliance.

---
