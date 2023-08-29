-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tero
-- Create date: 4.5.2020
-- Description:	Kuukautinen myynti ProductID:n perusteella
-- =============================================
ALTER PROCEDURE dbo.usp_TuotteenMyyntiKuukusittain
	@productId int,
	@year int = 1997
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @MontlySales TABLE (
		January DECIMAL(11, 2), 
		February DECIMAL(11, 2), 
		March DECIMAL(11, 2), 
		April DECIMAL(11, 2), 
		May DECIMAL(11, 2), 
		June DECIMAL(11, 2), 
		July DECIMAL(11, 2), 
		August DECIMAL(11, 2), 
		September DECIMAL(11, 2), 
		October DECIMAL(11, 2), 
		November DECIMAL(11, 2), 
		December DECIMAL(11, 2)
	);
	DECLARE @January DECIMAL(11,2);
	DECLARE @February DECIMAL(11, 2);
	DECLARE @March DECIMAL(11, 2);
	DECLARE @April DECIMAL(11, 2);
	DECLARE @May DECIMAL(11, 2);
	DECLARE @June DECIMAL(11, 2); 
	DECLARE @July DECIMAL(11, 2);
	DECLARE @August DECIMAL(11, 2); 
	DECLARE @September DECIMAL(11, 2); 
	DECLARE @October DECIMAL(11, 2);
	DECLARE @November DECIMAL(11, 2); 
	DECLARE @December DECIMAL(11, 2);

	SELECT @January = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-01-01') AND CONCAT(CONVERT(CHAR(4), @year), '-02-01')
	AND od.ProductID = @productId

	SELECT @February = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-02-01') AND CONCAT(CONVERT(CHAR(4), @year), '-03-01')
	AND od.ProductID = @productId

	SELECT @March = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-03-01') AND CONCAT(CONVERT(CHAR(4), @year), '-04-01')
	AND od.ProductID = @productId

	SELECT @April = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-04-01') AND CONCAT(CONVERT(CHAR(4), @year), '-05-01')
	AND od.ProductID = @productId

	SELECT @May = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-05-01') AND CONCAT(CONVERT(CHAR(4), @year), '-06-01')
	AND od.ProductID = @productId

	SELECT @June = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-06-01') AND CONCAT(CONVERT(CHAR(4), @year), '-07-01')
	AND od.ProductID = @productId

	SELECT @July = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-07-01') AND CONCAT(CONVERT(CHAR(4), @year), '-08-01')
	AND od.ProductID = @productId

	SELECT @August = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-08-01') AND CONCAT(CONVERT(CHAR(4), @year), '-09-01')
	AND od.ProductID = @productId

	SELECT @September = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-09-01') AND CONCAT(CONVERT(CHAR(4), @year), '-10-01')
	AND od.ProductID = @productId

	SELECT @October = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-10-01') AND CONCAT(CONVERT(CHAR(4), @year), '-11-01')
	AND od.ProductID = @productId

	SELECT @November = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-11-01') AND CONCAT(CONVERT(CHAR(4), @year), '-12-01')
	AND od.ProductID = @productId

	SELECT @December = SUM(od.UnitPrice * od.Quantity *(1 - od.Discount))
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
	WHERE o.OrderDate BETWEEN CONCAT(CONVERT(CHAR(4), @year), '-12-01') AND CONCAT(CONVERT(CHAR(4), @year + 1), '-01-01')
	AND od.ProductID = @productId

	INSERT INTO @MontlySales (January, February, March, April, May, June, July, August, September, October, November, December)
	VALUES (
		ISNULL(@January, 0),
		ISNULL(@February, 0),
		ISNULL(@March, 0),
		ISNULL(@April, 0),
		ISNULL(@May, 0),
		ISNULL(@June, 0),
		ISNULL(@July, 0),
		ISNULL(@August, 0),
		ISNULL(@September, 0),
		ISNULL(@October, 0),
		ISNULL(@November, 0),
		ISNULL(@December, 0)
	)

	SELECT * FROM @MontlySales;
END
GO
--exec usp_TuotteenMyyntiKuukusittain 1