select o.OrderID, c.CompanyName as [Customer], CONCAT(e.FirstName, ' ', e.LastName) as [Employee],
o.OrderDate, o.RequiredDate, o.ShippedDate, s.CompanyName as Shipper, o.Freight, o.ShipName, o.ShipAddress,
o.ShipRegion, o.ShipPostalCode, o.ShipCountry
from OrdersTemp1 o
inner join Employees e on o.EmployeeID = e.EmployeeID
inner join Customers c on o.CustomerID = c.CustomerID
inner join Shippers s on o.ShipVia = s.ShipperID
where o.OrderID = FLOOR(rand() * (416998 - 1000 + 1)) + 1000;
go
select OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
from OrdersTemp1
where CustomerID = 'ALFKI';
go
select OrderID, OrderDate, RequiredDate, ShippedDate
from OrdersTemp1
where EmployeeID = FLOOR(rand() * 14) + 1;
go
select EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
from OrdersTemp1
where OrderDate > '1998'
order by OrderDate;
go
select EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
from OrdersTemp1
where RequiredDate < '1998'
order by RequiredDate desc;
go
select OrderID, CustomerID, EmployeeID, RequiredDate, ShippedDate, ShipVia, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
from OrdersTemp1
where ShippedDate is null;
go
select o.ShippedDate, s.CompanyName as Shipper, o.Freight, o.ShipName, o.ShipAddress, o.ShipRegion, o.ShipPostalCode, o.ShipCountry
from OrdersTemp1 o
inner join Shippers s on o.ShipVia = s.ShipperID
where o.ShipName = 'Ernst Handel';
go
select ShipAddress, ShipCity, ShipRegion, ShipPostalCode
from OrdersTemp1
where ShipCountry = 'Finland';
go
select OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipAddress, ShipPostalCode
from OrdersTemp1
where ShipCity = 'Helsinki';
go
update OrdersTemp1 set Freight = round(rand() * 100, 2) where Freight < 100.01;
go
update OrdersTemp1 set ShipRegion = 'UNKNOWN' where ShipRegion is null;
go
update OrdersTemp1 set ShipRegion = null where ShipRegion = 'UNKNOWN';
go
select od.OrderID, p.ProductName, p.QuantityPerUnit, c.CategoryName, od.UnitPrice, od.Quantity, od.Discount 
from [Order DetailsTemp1] od
inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
where OrderID = FLOOR(rand() * (416998 - 1000 + 1)) + 1000;
go
select od.OrderID, p.ProductName, p.QuantityPerUnit, c.CategoryName, od.UnitPrice, od.Quantity, od.Discount 
from [Order DetailsTemp1] od
inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
where od.ProductID = FLOOR(rand() * 79) + 1;
go
select od.OrderID, p.ProductName, p.QuantityPerUnit, c.CategoryName, od.UnitPrice, od.Quantity, od.Discount 
from [Order DetailsTemp1] od
inner join Products p on od.ProductID = p.ProductID
inner join Categories c on p.CategoryID = c.CategoryID
where od.OrderID = 14118 and od.ProductID = 31;
go
select OrderID, ProductID, UnitPrice, Quantity, Discount
from [Order DetailsTemp1]
where Discount > ROUND(rand() / 4, 2);
go
select OrderID, ProductID, UnitPrice, Quantity, Discount
from [Order DetailsTemp1]
where Quantity > FLOOR(rand() * 120) + 1
order by Quantity desc;
go
select OrderID, ProductID, UnitPrice, Quantity, Discount
from [Order DetailsTemp1]
where UnitPrice between FLOOR(rand() * (13 - 10 + 1)) + 10 and FLOOR(rand() * (18 - 15 + 1)) + 15;
go
begin transaction
update [Order DetailsTemp1] set Discount = ROUND(rand() / 4, 2) where Discount > 0;
rollback
go
declare @newOrder int, @now DateTime
set @now = GETDATE()
insert into OrdersTemp1 (CustomerID, EmployeeID, OrderDate, RequiredDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) 
values ('ALFKI', 9, @now, @now + 7, 3, 16.99, 'Rattlesnake Canyon Grocery', 'Berliner Platz 43', 'Seattle', 'WA', '69004', 'Austria');
set @newOrder = @@IDENTITY
insert into [Order DetailsTemp1] (OrderID, ProductID, UnitPrice, Quantity, Discount)
values (@newOrder, 20, 42.42, 42, 0.42);
delete from [Order DetailsTemp1] where OrderID = @newOrder and ProductID = 20;
delete from OrdersTemp1 where OrderID = @newOrder;
go
