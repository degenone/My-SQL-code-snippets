	SELECT datepart("YEAR",o.OrderDate) as vuosi,
	datepart("MONTH",o.OrderDate) as kuukausi, 
	isnull(SUM(od.UnitPrice * od.Quantity *(1 - od.Discount)),0) as myynti	
	FROM dbo.Orders o INNER JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID	
	WHERE od.ProductID = 1 and datepart("YEAR",o.OrderDate) = 1997
	GROUP BY datepart("YEAR",o.OrderDate) , datepart("MONTH",o.OrderDate) , od.ProductID
