CREATE PROCEDURE dbo.uspLoopTest(@maara int)
AS
	SET NOCOUNT ON
	DECLARE @i int =1
	DECLARE @Stri varchar(10)
	WHILE @i <= @maara
	BEGIN
		SET @Stri = CONVERT(varchar, @i)
		PRINT 'Rivinumero = ' + @Stri
		SET @i = @i + 1
	END
GO

EXEC uspLoopTest 10