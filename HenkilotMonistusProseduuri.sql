/* Create a procedure to multiply rows in Henkilot -table
Author: J.Sonck
Date: 10.11.2015
Purpose: This function multiplies table row count as many times, that parameter defines
INSERT Henkilot (Etunimi, Sukunimi, Osoite, Esimies) 
VALUES ('Matthias','Erkinheimo','Haikkoontie 14 B 12',9)
*/
--DROP tABLE Henkilot_bak
--ENSIKSI SUORITA T�M� KOKO SKRIPTI, JOTTA SAAT PROSEDUURIN ITSELLESI
--TOISEKSI: select * into Henkilot_bak from Henkilot --Ensin otetaan oikeasta taulusta kopio, jota k�sitell��n t�ss� proseduurissa
--KOLMANNEKSI: select * from Henkilot_bak --tarkistetaan, ett� kopoi on kunnossa
--LOPULTA T�M�: usp_HenkiloLisays 2000 --T�ss� proseduurin kutsumalli: parametrina kuinka monta kertaa taulu monistetaan 
--TARKISTA V�LILL� MONTAKO RIVI� ON SYNTYNYT: select COUNT(*) from Henkilot_bak
--DROP PROCEDURE usp_HenkiloLisays
CREATE PROCEDURE usp_HenkiloLisays
    @LKM int 
    AS 
    --SET NOCOUNT ON
	--muuttujam��ritykset
	DECLARE @Sukunimi nvarchar(50), @Etunimi nvarchar(50), @Osoite nvarchar(100), @Esimies int
	--luupataan proseduurin toimintoa parametrin osoittama lukum��r�
	WHILE @LKM > 0 
	BEGIN
			--luodaan kursori luuppik�sittely� varten
			DECLARE henkilo_cursor CURSOR
			FOR SELECT 
				--[Henkilo_id] ei haeta t�ss�, koska t�m�n tietokanta lis�� itse automaattisesti
				Sukunimi, Etunimi, Osoite, Esimies
			FROM [Henkilot]
			--avataan edell� luotu kursori
			OPEN henkilo_cursor
			PRINT('kursorit avattu, LKM='+CONVERT(nvarchar,@LKM))
			--haetaan ensimm�inen rivi kursorista
			FETCH NEXT FROM  henkilo_cursor
			INTO @Sukunimi, @Etunimi, @Osoite, @Esimies
			PRINT('nyt lis�ttiin EKA KOHTA: ' + @Sukunimi)

			WHILE @@FETCH_STATUS = 0 --luupataan tulosjoukkoa niin kauan kuin rivej� riitt��
			BEGIN 
				INSERT INTO Henkilot_bak (Sukunimi,Etunimi, Osoite, Esimies)
				VALUES (@Sukunimi+'|',@Etunimi+'|',@Osoite, @Esimies)
				PRINT('nyt lis�ttiin LUUPISSA: ' + @Sukunimi)
				--haetaan seuraava rivi kursorista
				FETCH NEXT FROM  henkilo_cursor 
				INTO @Sukunimi,@Etunimi,@Osoite, @Esimies
				--vied��n rivit tauluun

			END
			--suljetaan ja vapautetaan taulun luuppaava kursori
			SET @LKM = @LKM-1
			CLOSE henkilo_cursor
			DEALLOCATE henkilo_cursor
			PRINT('kursorit tuhottu, LKM='+CONVERT(nvarchar,@LKM))

	
	--Lopuksi p�ivitet��n taulun etu- ja sukunimet yksil�llisiksi lis��m�ll� niihin Henkilo_id -tieto
	UPDATE Henkilot_bak SET Sukunimi = LEFT(LEFT(Sukunimi,charindex('|',Sukunimi,1)-1) + '|' + CONVERT(nvarchar,Henkil�_id),50), Etunimi = LEFT(LEFT(etunimi,charindex('|',etunimi,1)-1) + '|' + CONVERT(nvarchar,Henkil�_id),50)
	WHERE charindex('|',etunimi,1) > 0


	END