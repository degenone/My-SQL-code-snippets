CREATE FUNCTION dbo.F_ProjektinTilanneTaulu (@Projekti_id int)
RETURNS @tilanneTaulu TABLE
(
	etunimi varchar(50),
	sukunimi varchar(50),
	osoite varchar(50),
	postinumero varchar(5),
	postitoimipaikka varchar(50),
	email varchar(152),
	pvm datetime,
	tunnit int,
	Pnimi varchar(100)
)
AS
	BEGIN
	INSERT @tilanneTaulu
	SELECT H.Etunimi, H.Sukunimi, H.Osoite, H.Postinumero, dbo.F_Ptoimipaikka(H.Postinumero), dbo.F_SahkoPosti(H.Etunimi, H.Sukunimi, 'careeria.fi'), T.Pvm, T.Tunnit, P.Nimi
	FROM Henkilot H JOIN Tunnit T on H.Henkiloid = T.Henkilo_id JOIN Projektit P ON P.Projektiid = T.Projekti_id
	WHERE P.Projektiid = @Projekti_id
	RETURN
END

--select * from dbo.F_ProjektinTilanneTaulu(1002)