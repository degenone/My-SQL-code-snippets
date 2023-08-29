CREATE PROCEDURE dbo.uspSnapShot
AS
	SET NOCOUNT ON
	DECLARE @etu varchar(50), @suku varchar(50), @osoite varchar(50), @postinro varchar(5), @postitmp varchar(50), @email varchar(152), @pvm datetime, @tunnit int, @pnimi varchar(100)

	IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tblSnapShot')
	BEGIN
		DROP TABLE tblSnapShot
	END

	CREATE TABLE tblSnapShot (etu varchar(50), suku varchar(50), osoite varchar(50), postinro varchar(5), postitmp varchar(50), email varchar(152), pvm datetime, tunnit int, pnimi varchar(100))

	DECLARE hakucursor CURSOR
	FOR SELECT H.Etunimi, H.Sukunimi, H.Osoite, H.Postinumero, dbo.F_Ptoimipaikka(H.Postinumero), dbo.F_SahkoPosti(H.Etunimi, H.Sukunimi, 'careeria.fi'), T.Pvm, T.Tunnit, P.Nimi
	FROM Henkilot H JOIN Tunnit T on H.Henkiloid = T.Henkilo_id JOIN Projektit P ON P.Projektiid = T.Projekti_id

	OPEN hakucursor
	FETCH NEXT FROM hakucursor INTO @etu, @suku, @osoite, @postinro, @postitmp, @email, @pvm, @tunnit, @pnimi
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT tblSnapShot (etu, suku, osoite, postinro, postitmp, email, pvm, tunnit, pnimi)
		VALUES (@etu, @suku, @osoite, @postinro, @postitmp, @email, @pvm, @tunnit, @pnimi)
		FETCH NEXT FROM hakucursor INTO @etu, @suku, @osoite, @postinro, @postitmp, @email, @pvm, @tunnit, @pnimi
	END
	CLOSE hakucursor
	DEALLOCATE hakucursor
GO

--EXEC dbo.uspSnapShot