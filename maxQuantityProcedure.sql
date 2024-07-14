-- Step 1: Create the Stored Procedure
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(quantity) AS MaxQuantity
    FROM `order`;
END //

DELIMITER ;

-- Step 2: Call the Stored Procedure
CALL GetMaxQuantity();