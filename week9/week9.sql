use company;
DELIMITER $$
CREATE PROCEDURE SelectCustomerByCountry(IN c VARCHAR(45))
BEGIN
	SELECT * FROM Customers
    WHERE Country = c;
END $$
DELIMITER ;

SET @country = "France";
SELECT @country;
CALL SelectCustomerByCountry(@country);

DELIMITER $$
CREATE PROCEDURE GetOrderByCountry(IN shipper VARCHAR(45), OUT count INT)
BEGIN
	SELECT COUNT(OrderID) INTO count
    FROM Orders
    JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
    WHERE ShipperName = shipper;
END $$
DELIMITER ;

SELECT ShipperName from shippername;
set @order_cnt = 0;
SELECT @order_cnt;
CALL GetOrderByCountry("United Package", @order_cnt);
SELECT @order_cnt;


DELIMITER $$
CREATE PROCEDURE GetCustomerSalesOut(
	IN inCustomerID INT,
    OUT outName VARCHAR(255),
    OUT outsales Float)
BEGIN
	SELECT CustomerName into outName
	FROM Customers
    WHERE CustomerID = inCustomerID;
    
    SELECT IFNULL(SUM(p.Price * od.Quantity), 0) INTO outSales
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON p.ProductID = od.ProductID
    WHERE o.CustomerID = inCustomerID;
END $$
DELIMITER ;

CALL GetCustomerSalesOut(5, @name, @sales);
SELECT @name, @sales;
