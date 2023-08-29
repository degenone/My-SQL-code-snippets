CREATE TABLE [dbo].[Lokitaulu](
	Taulunnimi varchar(50) NULL,
	Kentannimi varchar(50) NULL,
	Vanhatieto varchar(max) NULL,
	Uusitieto varchar(max) NULL,
	Paivityspvm datetime,
	Paivityskayttaja varchar(100) NULL

) ON [PRIMARY]
GO


ALTER TRIGGER Tr_Update_Henkilot ON Henkilot
FOR UPDATE
AS
	DECLARE @Etunumi varchar(50), @Sukunimi varchar(50), @Osoite varchar(100), @Postinumero varchar(5), @Esimies int;
	DECLARE @Etunimi_old varchar(50), @Sukunimi_old varchar(50), @Osoite_old varchar(100), @Postinumero_old varchar(5), @Esimies_old int;

	SELECT @Etunumi = Etunimi, @Sukunimi = Sukunimi, @Osoite = Osoite, @Postinumero = Postinumero, @Esimies = Esimies FROM inserted
	SELECT @Etunimi_old = Etunimi, @Sukunimi_old = Sukunimi, @Osoite_old = Osoite, @Postinumero_old = Postinumero, @Esimies_old = Esimies FROM deleted

	IF @Etunumi <> @Etunimi_old
	BEGIN
		INSERT Lokitaulu (Taulunnimi, Kentannimi, Vanhatieto, Uusitieto, Paivityspvm) VALUES ('Henkilot', 'Etunimi', @Etunimi_old, @Etunumi, GETDATE())
		PRINT 'Etunimi päivitetty'
	END
	IF @Sukunimi <> @Sukunimi_old
	BEGIN
		INSERT Lokitaulu (Taulunnimi, Kentannimi, Vanhatieto, Uusitieto, Paivityspvm) VALUES ('Henkilot', 'Sukunimi', @Sukunimi_old, @Sukunimi, GETDATE())
		PRINT 'Sukunumi päivitetty'
	END
	IF @Osoite <> @Osoite_old
	BEGIN
		INSERT Lokitaulu (Taulunnimi, Kentannimi, Vanhatieto, Uusitieto, Paivityspvm) VALUES ('Henkilot', 'Osoite', @Osoite_old, @Osoite, GETDATE())
		PRINT 'Osoite päivitetty'
	END
	IF @Postinumero <> @Postinumero_old
	BEGIN
		INSERT Lokitaulu (Taulunnimi, Kentannimi, Vanhatieto, Uusitieto, Paivityspvm) VALUES ('Henkilot', 'Postinumero', @Postinumero_old, @Postinumero, GETDATE())
		PRINT 'Postinumero päivitetty'
	END
	IF @Esimies <> @Esimies_old
	BEGIN
		INSERT Lokitaulu (Taulunnimi, Kentannimi, Vanhatieto, Uusitieto, Paivityspvm) VALUES ('Henkilot', 'Esimies', @Esimies_old, @Esimies, GETDATE())
		PRINT 'Esimies päivitetty'
	END
GO