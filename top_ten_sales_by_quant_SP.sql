CREATE PROCEDURE dbo.usp_MyydyimmatTuotteet
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.*, m.KplMyyty
	FROM dbo.Products p
	JOIN (
		SELECT TOP 10 ProductID, SUM(Quantity) as KplMyyty
		FROM dbo.[Order Details]
		GROUP BY ProductID
		ORDER BY KplMyyty DESC
	) as m
	ON m.ProductID = p.ProductID
END
GO
