--Ensin poistetaan vanha ilmentymä, jos on olemassa!
IF OBJECT_ID ('TR_Sahkopostinlahettaja','TR') IS NOT NULL
    DROP TRIGGER TR_Sahkopostinlahettaja;
GO

--Sitten luodaan uusi Triggeri
USE Projekti
CREATE TRIGGER TR_Sahkopostinlahettaja
ON Projektit
AFTER INSERT, UPDATE, DELETE 
AS
   EXEC msdb.dbo.sp_send_dbmail
        @profile_name = 'Projektit Administrator Profile',
        @recipients = 'tero.kilpelainen@student.careeria.fi',
        @body = 'Muista tarkistaa data!',
        @subject = 'Triggerin viesti';
GO

INSERT Projektit (Nimi) VALUES ('Ohjelmiston päivitys')