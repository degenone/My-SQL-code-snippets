ALTER PROCEDURE dbo.uspTauluMuotoilulla
AS
BEGIN
	DECLARE @nimi varchar(255), @pvm datetime, @domain varchar(255) = 'student.careeria.fi'
	DECLARE Taulucursor CURSOR
	FOR SELECT name, GETDATE() FROM sys.tables
	
	OPEN Taulucursor
	FETCH NEXT FROM Taulucursor INTO @nimi, @pvm

	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF ((@nimi = 'Henkilot') OR (@nimi = 'Tunnit') OR (@nimi = 'Postitoimipaikat'))
			BEGIN
				PRINT 'K‰sitell‰‰n taulua: ' + @nimi
				IF (@nimi = 'Henkilot')
				BEGIN
					UPDATE Henkilot SET Sahkoposti = dbo.F_SahkoPosti(etunimi, Sukunimi, @domain) WHERE Sahkoposti IS NULL
				END

				IF (@nimi = 'Postitoimipaikat')
				BEGIN
					INSERT Postitoimipaikat SELECT DISTINCT Postinumero, 'Postmp puuttuu' 
					FROM Henkilot WHERE Postinumero NOT IN (SELECT Postinumero FROM Postitoimipaikat)
				END

				IF (@nimi = 'Tunnit')
				BEGIN
					DELETE FROM Tunnit WHERE Pvm < GETDATE() - 50
				END

				EXECUTE('SELECT * FROM [' + @nimi + ']')
			END
			FETCH NEXT FROM Taulucursor INTO @nimi, @pvm
		END
	CLOSE Taulucursor
	DEALLOCATE Taulucursor
	RETURN
END
GO
--EXEC dbo.uspTauluMuotoilulla