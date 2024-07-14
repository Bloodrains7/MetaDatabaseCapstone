DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM booking
    WHERE id = booking_id;

    SELECT 'Booking successfully cancelled' AS status;
END //

DELIMITER ;