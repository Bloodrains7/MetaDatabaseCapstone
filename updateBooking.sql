DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN booking_date DATE
)
BEGIN
    UPDATE booking
    SET bookingDate = booking_date
    WHERE id = booking_id;

    SELECT 'Booking successfully updated' AS status;
END //

DELIMITER ;