DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE existing_booking_id INT;

    START TRANSACTION;

    SELECT b.id INTO existing_booking_id
    FROM booking b
    WHERE b.bookingDate = booking_date
      AND b.takeNumber = table_number
    LIMIT 1;

    IF existing_booking_id IS NOT NULL THEN
        ROLLBACK;
        SELECT 'Table already booked for the given date' AS status;
    ELSE
        INSERT INTO booking (bookingDate, takeNumber)
        VALUES (booking_date, table_number);

        COMMIT;
        SELECT 'Booking successfully added' AS status;
    END IF;
END //

DELIMITER ;