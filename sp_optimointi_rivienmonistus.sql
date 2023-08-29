-- select count(*) from OrdersTemp1
-- select count(*) from [Order DetailsTemp1]
-- exec dbo.uspRivienMonistus 10
USE northwind;
GO
CREATE PROCEDURE dbo.uspRivienMonistus
	@lkm int
AS
	SET NOCOUNT ON
	DECLARE @NewOrderID int,
			@CustomerID nchar(5),
			@EmployeeID int,
			@OrderDate DateTime,
			@RequiredDate DateTime,
			@ShippedDate DateTime,
			@ShipVia int,
			@Freight money,
			@ShipName nvarchar(40),
			@ShipAddress nvarchar(60),
			@ShipCity nvarchar(15),
			@ShipRegion nvarchar(15),
			@ShipPostalCode nvarchar(10),
			@ShipCountry nvarchar(15),
			@ProductID int,
			@UnitPrice money,
			@Quantity smallint,
			@Discount real,
			@OrderIdOrders int,
			@OrderIdOrdersDetails int,
			@OrdersTempRowCount int,
			@OrderDetailsTempRowCount int

	IF EXISTS (SELECT name FROM sys.tables WHERE name = 'OrdersTemp1')
	BEGIN
	DROP TABLE OrdersTemp1
	END
	IF EXISTS (SELECT name FROM sys.tables WHERE name = 'Order DetailsTemp1')
	BEGIN
	DROP TABLE [Order DetailsTemp1]
	END

	CREATE TABLE OrdersTemp1
	(
		OrderID int IDENTITY(1000, 1),
		CustomerID nchar(5),
		EmployeeID int,
		OrderDate DateTime,
		RequiredDate DateTime,
		ShippedDate DateTime,
		ShipVia int,
		Freight money,
		ShipName nvarchar(40),
		ShipAddress nvarchar(60),
		ShipCity nvarchar(15),
		ShipRegion nvarchar(15),
		ShipPostalCode nvarchar(10),
		ShipCountry nvarchar(15)
	)

	CREATE TABLE [Order DetailsTemp1]
	(
		OrderID int,
		ProductID int,
		UnitPrice money,
		Quantity smallint,
		Discount real
	)
	SET @OrdersTempRowCount = 0
	SET @OrderDetailsTempRowCount = 0

	WHILE @lkm > 0
	BEGIN
		DECLARE ordersKursori CURSOR
		FOR SELECT
			OrderID,
			CustomerID,
			EmployeeID,
			OrderDate,
			RequiredDate,
			ShippedDate,
			ShipVia,
			Freight,
			ShipName,
			ShipAddress,
			ShipCity,
			ShipRegion,
			ShipPostalCode,
			ShipCountry
		FROM Orders
		OPEN ordersKursori

		FETCH NEXT FROM 
			ordersKursori
		INTO 
			@OrderIdOrders,
			@CustomerID,
			@EmployeeID,
			@OrderDate,
			@RequiredDate,
			@ShippedDate,
			@ShipVia,
			@Freight,
			@ShipName,
			@ShipAddress,
			@ShipCity,
			@ShipRegion,
			@ShipPostalCode,
			@ShipCountry

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @OrdersTempRowCount = @OrdersTempRowCount + 1

			INSERT OrdersTemp1 (
				CustomerID,
				EmployeeID,
				OrderDate,
				RequiredDate,
				ShippedDate,
				ShipVia,
				Freight,
				ShipName,
				ShipAddress,
				ShipCity,
				ShipRegion,
				ShipPostalCode,
				ShipCountry
			) VALUES (
				@CustomerID,
				@EmployeeID,
				@OrderDate,
				@RequiredDate,
				@ShippedDate,
				@ShipVia,
				@Freight,
				@ShipName,
				@ShipAddress,
				@ShipCity,
				@ShipRegion,
				@ShipPostalCode,
				@ShipCountry
			)
			SET @NewOrderID = SCOPE_IDENTITY()

			DECLARE orderDetailsKursori CURSOR
			FOR SELECT
				OrderID,
				ProductID,
				UnitPrice,
				Quantity,
				Discount
			FROM [Order Details] WHERE OrderID = @OrderIdOrders
			OPEN orderDetailsKursori

			FETCH NEXT FROM
				orderDetailsKursori
			INTO
				@OrderIdOrdersDetails,
				@ProductID,
				@UnitPrice,
				@Quantity,
				@Discount

			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @OrderDetailsTempRowCount = @OrderDetailsTempRowCount + 1

				INSERT [Order DetailsTemp1] (
					OrderID,
					ProductID,
					UnitPrice,
					Quantity,
					Discount
				) VALUES (
					@NewOrderID,
					@ProductID,
					@UnitPrice,
					@Quantity,
					@Discount
				)

				FETCH NEXT FROM
					orderDetailsKursori
				INTO
					@OrderIdOrdersDetails,
					@ProductID,
					@UnitPrice,
					@Quantity,
					@Discount
			END

			FETCH NEXT FROM 
				ordersKursori
			INTO 
				@OrderIdOrders,
				@CustomerID,
				@EmployeeID,
				@OrderDate,
				@RequiredDate,
				@ShippedDate,
				@ShipVia,
				@Freight,
				@ShipName,
				@ShipAddress,
				@ShipCity,
				@ShipRegion,
				@ShipPostalCode,
				@ShipCountry

			CLOSE orderDetailsKursori
			DEALLOCATE orderDetailsKursori
		END

		SET @lkm = @lkm - 1

		CLOSE ordersKursori
		DEALLOCATE ordersKursori
	END
	
	SET @OrdersTempRowCount = (SELECT COUNT(*) FROM OrdersTemp1)
	SET @OrderDetailsTempRowCount = (SELECT COUNT(*) FROM [Order DetailsTemp1])
	PRINT 'Lisätty ' + CONVERT(varchar, @OrdersTempRowCount) + ' tilausriviä'
	PRINT 'Lisätty ' + CONVERT(varchar, @OrderDetailsTempRowCount) + ' tilaus yksityiskohtariviä'
GO