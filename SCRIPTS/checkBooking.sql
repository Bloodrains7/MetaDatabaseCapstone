DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE table_status VARCHAR(20);

    SELECT
        CASE WHEN COUNT(*) > 0 THEN 'Booked'
             ELSE 'Available'
        END INTO table_status
    FROM booking b
    WHERE b.bookingDate = booking_date
      AND b.takeNumber = table_number;

    SELECT table_status AS BookingStatus;
END //

DELIMITER ;