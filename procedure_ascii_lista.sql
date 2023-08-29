ALTER PROCEDURE dbo.uspAscii
AS
	DECLARE @i int, @iStr varchar(50)
	SET @i = 0
	WHILE @i <= 255
	BEGIN
		SET @iStr = CONVERT(varchar, @i)
		PRINT 'Numeroa ' + @iStr + ' vastaa merkki " ' + CHAR(@i) + ' "'
		SET @i = @i + 1
	END
GO

--EXEC dbo.uspAscii