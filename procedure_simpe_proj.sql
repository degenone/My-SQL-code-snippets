CREATE PROCEDURE dbo.uspGenProj (@maara int, @nimi varchar(50))
AS
	DECLARE @i int = 1, @Stri varchar(10)
	WHILE @i <= @maara
	BEGIN
		INSERT Projektit (Nimi) VALUES (@nimi)
		SET @i = @i + 1
	END
	SET @Stri = CONVERT(varchar, @i)
	PRINT 'Lisätty ' + @Stri + ' riviä!'
GO

--select * from Projektit
--EXEC dbo.uspGenProj 10, 'Careeria ohjemiston suunnittelu'