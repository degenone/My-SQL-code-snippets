select OrderDate, RequiredDate, ShippedDate, ShipCity, ShipRegion, ShipPostalCode, ShipCountry
from OrdersTemp1
where MONTH(OrderDate) = FLOOR(RAND()*12 + 1) and YEAR(OrderDate) = FLOOR(RAND() * (1998 - 1996 + 1)) + 1996
order by OrderDate desc;
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
select p.ProductName, od.UnitPrice * od.Quantity * (1 - od.Discount) as Total
from [Order DetailsTemp1] od
inner join Products p on od.ProductID = p.ProductID
where od.UnitPrice between FLOOR(rand() * (13 - 10 + 1)) + 10 and FLOOR(rand() * (18 - 15 + 1)) + 15;
go