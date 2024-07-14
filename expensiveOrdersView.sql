CREATE VIEW ExpensiveOrders AS
SELECT c.id AS 'CustomerId', c.fullName AS 'FullName', o.id AS 'OrderId', o.totalCost AS 'Cost', m.note AS 'MenuName', i.name AS 'CourseName' FROM customer c
    JOIN booking b ON c.id = b.customerId JOIN  `order` o ON b.id = o.bookingId JOIN littlelemondb.menu m on o.id = m.orderId
    JOIN menuitem mi ON m.id = mi.menuId JOIN item i ON mi.itemId = i.id
    WHERE i.ItemCategory_id = (SELECT id from itemcategory ic where ic.name = 'STARTER') AND o.totalCost > 150
    ORDER BY o.totalCost;