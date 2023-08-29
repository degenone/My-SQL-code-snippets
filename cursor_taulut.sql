--select name, GETDATE() from sys.tables
--EXEC dbo.uspTauluLuuppi
--drop PROCEDURE uspTauluLuuppi
ALTER PROCEDURE [dbo].[uspTauluLuuppi]
AS
BEGIN
	DECLARE
		@nimi varchar(50),
		@pvm datetime

	DECLARE Taulukursori CURSOR
	FOR SELECT
			name,
			GETDATE()
		FROM
			sys.tables

	OPEN Taulukursori

	FETCH NEXT FROM Taulukursori INTO
		@nimi,
		@pvm

	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT @nimi + ' - ' + CAST(@pvm AS varchar)
			BEGIN
				EXECUTE('SELECT * FROM [' + @nimi + ']')
			END
			FETCH NEXT FROM Taulukursori INTO
				@nimi,
				@pvm
		END

	CLOSE Taulukursori

	DEALLOCATE Taulukursori
END
GO