INSERT INTO User (user_id, full_name, email, password, phone)
VALUES 
(1, 'Eyad Zanaty', 'eyad@example.com', 'hashed_password1', '0123456789'),
(2, 'Sara Ali', 'sara@example.com', 'hashed_password2', '0101234567'),
(3, 'Ahmed Hossam', 'ahmed@example.com', 'hashed_password3', '0112345678');

INSERT INTO Property (property_id, user_id, title, location, price_per_night, description)
VALUES 
(1, 1, 'Modern Apartment in Cairo', 'Cairo, Egypt', 750.00, 'A beautiful and modern apartment in downtown Cairo.'),
(2, 2, 'Beach House in Alexandria', 'Alexandria, Egypt', 1200.00, 'A cozy beach house with sea view.'),
(3, 3, 'Studio near University', 'Giza, Egypt', 500.00, 'Ideal for students, close to public transportation.');

INSERT INTO Booking (booking_id, user_id, property_id, check_in_date, check_out_date, total_price)
VALUES 
(1, 2, 1, '2025-07-10', '2025-07-15', 3750.00),
(2, 1, 2, '2025-08-01', '2025-08-05', 4800.00),
(3, 3, 3, '2025-07-20', '2025-07-22', 1000.00);

INSERT INTO Payment (payment_id, booking_id, payment_date, amount, payment_method, status)
VALUES 
(1, 1, '2025-07-01', 3750.00, 'Credit Card', 'Completed'),
(2, 2, '2025-07-20', 4800.00, 'PayPal', 'Pending'),
(3, 3, '2025-07-15', 1000.00, 'Debit Card', 'Completed');
