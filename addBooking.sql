DELIMITER //

CREATE PROCEDURE AddBooking(
    IN booking_id INT,
    IN customer_id INT,
    IN table_number INT,
    IN booking_date DATE
)
BEGIN
    INSERT INTO booking (id, customerId, bookingDate, takeNumber)
    VALUES (booking_id, customer_id, booking_date, table_number);

    SELECT 'Booking successfully added' AS Confirmation;
END //

DELIMITER ;