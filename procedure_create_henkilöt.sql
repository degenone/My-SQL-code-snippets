ALTER PROCEDURE dbo.uspGeneroiHenkilot @maara int, @etu varchar(50), @suku varchar(50), @osoite varchar(100), @postinro varchar(5), @esimies int
AS
	SET NOCOUNT ON
	DECLARE @i int =1
	DECLARE @Stri varchar(10)
	WHILE @i <= @maara
	BEGIN
		SET @Stri = CONVERT(varchar, @i)
		INSERT INTO Henkilot (Etunimi, Sukunimi, Osoite, Postinumero, Esimies)
		VALUES (@etu + @Stri, @suku + @Stri, @osoite + @Stri, @postinro,  @esimies)
		SET @i = @i + 1
	END
	PRINT 'Luotiin ' + @Stri + ' riviä'
GO

EXEC dbo.uspGeneroiHenkilot 50, 'Maija', 'Mallila', 'Mallimaa ', '59100', 1002
select * from dbo.Henkilot