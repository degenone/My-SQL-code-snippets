--Proseduurin mallikutsu 
--EXEC uspGeneroiHenkiloita @maara=11, @Etunimi='Kullervo', @Sukunimi='Miikkulainen', @osoite='Pellonpolku 11'
--SELECT * FROM HENKILOT
CREATE PROCEDURE [dbo].[uspGeneroiHenkiloita] (@maara int, @Etunimi varchar(50), 
@Sukunimi varchar(50), @osoite varchar(100))
AS
	SET NOCOUNT ON;
	DECLARE @i int = 1;
	DECLARE @Stri varchar(10);
	WHILE @i <= @maara
	BEGIN
		SET @Stri = CONVERT(varchar,@i)
		INSERT INTO Henkilot (Etunimi, Sukunimi, Osoite, Esimies) 
		VALUES (@Etunimi+@Stri,@Sukunimi+@Stri,@osoite+@Stri,1000)
		SET @i = @i+1;
	END
	PRINT 'Vietiin ' + @Stri + ' riviä!' 
GO
