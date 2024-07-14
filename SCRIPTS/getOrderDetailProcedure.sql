-- Step 1: Create the Prepared Statement
PREPARE GetOrderDetail FROM
'SELECT o.id AS `OrderId`, o.quantity AS `Quantity`, o.totalCost AS `Cost`
 FROM `order` o
JOIN booking b ON o.bookingId = b.id
JOIN customer c ON c.id = b.customerId
 WHERE c.id = ?';

-- Step 2: Set the Variable
SET @id = 1;

-- Step 3: Execute the Prepared Statement
EXECUTE GetOrderDetail USING @id;