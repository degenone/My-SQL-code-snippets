USE northwind

SELECT * FROM Employees

SELECT * FROM Employees ORDER BY LastName ASC

SELECT FirstName, LastName, [Address] FROM Employees WHERE City='Seattle'

SELECT * FROM Products ORDER BY UnitPrice DESC

SELECT ProductName FROM Products WHERE UnitPrice > 40

SELECT P.ProductName, C.CategoryName FROM Products P JOIN Categories C ON P.CategoryID=C.CategoryID WHERE P.UnitPrice BETWEEN 30 AND 40

SELECT UnitPrice, UnitsInStock FROM Products WHERE ProductName='Chocolade'

SELECT P.ProductName AS Tuote, E.FirstName + ' ' + E.LastName AS Nimi FROM Orders O JOIN emp_apu E ON O.EmployeeID=E.EmployeeID JOIN [Order Details] OD ON O.OrderID=OD.OrderID JOIN Products P ON OD.ProductID=P.ProductID WHERE p.ProductName='Maxilaku' AND E.FirstName='Nancy' AND E.LastName='Davolio'

SELECT COUNT(UnitPrice) AS Lukum‰‰r‰ FROM Products WHERE CategoryID='3'
SELECT COUNT(P.UnitPrice) AS Lukum‰‰r‰ FROM Products P JOIN Categories C ON P.CategoryID=C.CategoryID WHERE C.CategoryName='Confections'

SELECT SUM(UnitPrice) AS Summa FROM Products WHERE CategoryID='8'
SELECT SUM(P.UnitPrice) AS Summa FROM Products P JOIN Categories C ON P.CategoryID=C.CategoryID WHERE C.CategoryName='Seafood'

SELECT P.ProductName, S.CompanyName FROM Products P, Suppliers S WHERE P.ProductID=S.SupplierID

SELECT ContactName FROM Customers WHERE ContactName LIKE '%ee%'
SELECT CompanyName FROM Customers WHERE CompanyName LIKE '%ee%'

SELECT COUNT(DISTINCT City) AS M‰‰r‰ FROM Customers

SELECT COUNT(*) AS M‰‰r‰ FROM Products WHERE ProductName LIKE '__x%'

SELECT DISTINCT C.ContactName FROM [Order Details] OD JOIN Orders O ON OD.OrderID=O.OrderID JOIN Customers C ON O.CustomerID=C.CustomerID JOIN Products P ON OD.ProductID=P.ProductID WHERE P.ProductName IN ('Maxilaku', 'Lakkalikˆˆri')
SELECT DISTINCT C.CompanyName FROM [Order Details] OD JOIN Orders O ON OD.OrderID=O.OrderID JOIN Customers C ON O.CustomerID=C.CustomerID JOIN Products P ON OD.ProductID=P.ProductID WHERE P.ProductName IN ('Maxilaku', 'Lakkalikˆˆri')

SELECT COUNT(*) AS M‰‰r‰ FROM Suppliers WHERE ContactTitle LIKE '%sales%'

SELECT SUM(O.Freight) AS Rahtimaksu FROM Orders O JOIN Shippers S ON O.ShipVia=S.ShipperID WHERE S.CompanyName='United Package Ltdi'

SELECT COUNT(*) AS [Tilausten m‰‰r‰] FROM Orders WHERE OrderDate BETWEEN CONVERT(DateTime,'1.1.1997', 104) AND CONVERT(DateTime,'30.6.1997', 104)

SELECT DATEDIFF(DAY, OrderDate, ShippedDate) AS [Toimitus aika p‰iviss‰] FROM Orders WHERE OrderDate=(SELECT MAX(OrderDate) FROM Orders WHERE ShippedDate IS NOT NULL) AND ShippedDate IS NOT NULL

SELECT AVG(DATEDIFF(DAY, OrderDate, ShippedDate)) AS [Keskim‰‰r‰inen toimitusaika p‰iviss‰] FROM Orders WHERE ShippedDate IS NOT NULL

INSERT INTO Shippers VALUES ('Porvoon Salama Oy', '044-123 4567', 3)

--BEGIN TRANSACTION
--ROLLBACK
--COMMIT
SELECT * FROM Shippers

UPDATE Shippers SET Phone='045-123 4567' WHERE ShipperID='8'

UPDATE Shippers SET CompanyName=CONCAT(CompanyName, 'j') WHERE ShipperID='8'

DELETE FROM Shippers WHERE ShipperID='9'

SELECT * FROM Products
UPDATE Products SET UnitsInStock=UnitsInStock+100 WHERE ProductID='76'

UPDATE Products SET UnitsInStock=UnitsInStock*0.9 WHERE ProductID='76'

SELECT ProductID, UnitPrice * UnitsInStock AS [Summa]
FROM Products
GO
CREATE VIEW V_Tuotesummat AS SELECT ProductID AS [ProductID], UnitPrice * UnitsInStock AS [Summa] FROM Products

--select * from V_Tuotesummat
GO
SELECT OrderID AS [OrderID],
UnitPrice * Quantity AS [Summa]
FROM [Order Details]
GO
CREATE VIEW V_Tilaussummat AS SELECT OrderID AS [OrderID], UnitPrice * Quantity * (1 - Discount) AS [Summa] FROM [Order Details]

--select * from V_Tilaussummat