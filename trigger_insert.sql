ALTER TRIGGER Tr_Uusiprojekti ON Projektit
INSTEAD OF INSERT
AS
	DECLARE @Nimi varchar(100), @Aiemmat int;

	SELECT @Nimi = Nimi FROM inserted
	SELECT @Aiemmat = COUNT(Nimi) FROM Projektit WHERE Nimi LIKE CONCAT(@Nimi, '%')

	IF @Aiemmat = 0
	BEGIN
		INSERT Projektit (Nimi) VALUES (@Nimi)
		PRINT 'Projekti lisätty'
	END
	IF @Aiemmat > 0
	BEGIN
		INSERT Projektit (Nimi) VALUES (CONCAT(@Nimi, @Aiemmat + 1))
		PRINT 'Projekti lisätty liitteellä'
	END
GO