CREATE VIEW OrdersView AS
    SELECT o.id AS 'OrderId', o.quantity AS 'Quantity', o.totalCost AS 'Cost' FROM `order` o WHERE quantity > 2;