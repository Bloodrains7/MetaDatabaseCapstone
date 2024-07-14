CREATE VIEW MenuQuantityMoreThanTwo AS
SELECT m.note AS 'MenuName' FROM menu m
WHERE m.id = ANY (SELECT o.id FROM `order` o WHERE o.quantity > 2);