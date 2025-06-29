Entities and Attributes

User

user_id (Primary Key, UUID, Indexed)

first_name (VARCHAR, NOT NULL)

last_name (VARCHAR, NOT NULL)

email (VARCHAR, UNIQUE, NOT NULL)

password_hash (VARCHAR, NOT NULL)

phone_number (VARCHAR, NULL)

role (ENUM: guest, host, admin, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Property

property_id (Primary Key, UUID, Indexed)

host_id (Foreign Key → User.user_id)

name (VARCHAR, NOT NULL)

description (TEXT, NOT NULL)

location (VARCHAR, NOT NULL)

pricepernight (DECIMAL, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

Booking

booking_id (Primary Key, UUID, Indexed)

property_id (Foreign Key → Property.property_id)

user_id (Foreign Key → User.user_id)

start_date (DATE, NOT NULL)

end_date (DATE, NOT NULL)

total_price (DECIMAL, NOT NULL)

status (ENUM: pending, confirmed, canceled, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Payment

payment_id (Primary Key, UUID, Indexed)

booking_id (Foreign Key → Booking.booking_id)

amount (DECIMAL, NOT NULL)

payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

Review

review_id (Primary Key, UUID, Indexed)

property_id (Foreign Key → Property.property_id)

user_id (Foreign Key → User.user_id)

rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)

comment (TEXT, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Message

message_id (Primary Key, UUID, Indexed)

sender_id (Foreign Key → User.user_id)

recipient_id (Foreign Key → User.user_id)

message_body (TEXT, NOT NULL)

sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Entity Relationships (1 to Many unless noted)

User (host) → Property (host_id)

User (guest) → Booking (user_id)

Property → Booking (property_id)

Booking → Payment (1 to 1)

Property → Review (property_id)

User (guest) → Review (user_id)

User → Message (sender_id)

User → Message (recipient_id)


User
 ├── 1 → M Property   (as host)
 ├── 1 → M Booking    (as guest)
 ├── 1 → M Review     (as reviewer)
 ├── 1 → M Message    (as sender)
 └── 1 → M Message    (as recipient)

Property
 ├── M ← 1 User       (host_id)
 ├── 1 → M Booking
 └── 1 → M Review

Booking
 ├── M ← 1 Property
 ├── M ← 1 User       (guest)
 └── 1 → 1 Payment

Payment
 └── M ← 1 Booking

Review
 ├── M ← 1 Property
 └── M ← 1 User

Message
 ├── M ← 1 User       (sender)
 └── M ← 1 User       (recipient)
Indexing Notes

Primary keys are indexed automatically.

Additional indexes:

User: email

Property: property_id

Booking: property_id, booking_id

Payment: booking_id
