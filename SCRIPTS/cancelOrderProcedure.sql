-- Step 1: Create the Stored Procedure
DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderID INT)
BEGIN
    DELETE FROM `order` o
    WHERE o.id = orderID;

    SELECT CONCAT('Order ', orderID, ' is cancelled.') AS Confirmation;
END //

DELIMITER ;

-- Step 2: Invoke the Stored Procedure
CALL CancelOrder(5);