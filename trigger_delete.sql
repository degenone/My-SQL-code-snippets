ALTER TRIGGER Tr_Postinro_Poisto ON Postitoimipaikat
INSTEAD OF DELETE
AS
	DECLARE @Postinumero varchar(5), @Rivimaara int
	SELECT @Postinumero = Postinumero FROM deleted
	SELECT @Rivimaara = COUNT(Postinumero) FROM Henkilot WHERE Postinumero = @Postinumero

	if @Rivimaara = 0
	BEGIN
		DELETE FROM Postitoimipaikat WHERE Postinumero = @Postinumero
		PRINT 'DELETE Postitoimipaikka suoritettu'
	END
	if @Rivimaara > 0
	BEGIN
		PRINT 'Postitoimipaikkaa ei voida poistaa, koska se on käytössä'
	END
GO