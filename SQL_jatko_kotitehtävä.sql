--Tero Kilpeläinen 24.1.2020 SQL jatkokurssi
--EXEC dbo.uspKotitehtava '2020-01-23', '2020-01-25', 3
--SELECT * FROM Tunnit
CREATE PROCEDURE dbo.uspKotitehtava (@alkuPvm datetime, @loppuPvm datetime, @tunnit int)
AS
	DECLARE @pvm datetime = @alkuPvm, @henkilo_id int, @projekti_id int
	DECLARE Henkilocursor CURSOR
	FOR SELECT Henkiloid FROM Henkilot
	DECLARE Projcursor CURSOR
	FOR SELECT Projektiid FROM Projektit
	
	WHILE @pvm <= @loppuPvm
		BEGIN
			OPEN Henkilocursor
			FETCH NEXT FROM Henkilocursor INTO @henkilo_id
			WHILE @@FETCH_STATUS = 0
				BEGIN
					OPEN Projcursor
					FETCH NEXT FROM Projcursor INTO @projekti_id
					WHILE @@FETCH_STATUS = 0
						BEGIN
							INSERT Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit) 
							VALUES (@projekti_id, @henkilo_id, @pvm, @tunnit)
							FETCH NEXT FROM Projcursor INTO @projekti_id
						END
					FETCH NEXT FROM Henkilocursor INTO @henkilo_id
				CLOSE Projcursor
				END
			SET @pvm = @pvm + 1
		CLOSE Henkilocursor
		END
	DEALLOCATE Henkilocursor
	DEALLOCATE Projcursor
	
GO