USE KouluKanta
SELECT * FROM Henkilot WHERE Sähköposti IS NULL

INSERT Henkilot (Etunimi, Sukunimi, Osoite, Postinumero) VALUES ('Miika', 'Poskiparta', 'Keinutie 11 B 30', '00150')

SELECT * INTO Henkilot_tmp FROM Henkilot
SELECT * FROM Henkilot_tmp
--DELETE FROM Henkilot_tmp WHERE Puhelin IS NULL
--DROP TABLE Henkilot_tmp
ALTER TABLE Henkikot
ADD Henkilö_id INT IDENTITY(1000, 1) PRIMARY KEY

UPDATE Henkilot SET Postinumero='59100' WHERE Henkilö_id='1003' -- kumpikin käy, jos asetettu tyyppi sallii
UPDATE Henkilot SET Postinumero=59100 WHERE Henkilö_id=1003

UPDATE Henkilot SET Sähköposti = LOWER(Etunimi) + '.' + LOWER(Sukunimi) + '@yritys.com' WHERE Sähköposti IS NULL
UPDATE Henkilot SET Sähköposti = LOWER(Sähköposti)

--BEGIN TRANSACTION
--ROLLBACK
--COMMIT

SELECT * FROM Henkilot
SELECT * FROM Postitoimipaikat

ALTER TABLE Postitoimipaikat
ADD id INT IDENTITY(1000, 1) PRIMARY KEY

SELECT H.Henkilö_id, H.Etunimi, H.Sukunimi, H.Osoite, H.Postinumero, H.Sähköposti, P.Postinumero, P.Postitoimipaikka FROM Henkilot as H LEFT JOIN Postitoimipaikat AS P ON H.Postinumero=P.Postinumero
SELECT H.Henkilö_id, H.Etunimi + ' ' + H.Sukunimi as Nimi, H.Osoite, H.Postinumero, H.Sähköposti, P.Postinumero, P.Postitoimipaikka FROM Henkilot as H, Postitoimipaikat AS P WHERE H.Postinumero=P.Postinumero
SELECT H.Henkilö_id, H.Etunimi + ' ' + H.Sukunimi as Nimi, H.Osoite, H.Postinumero, H.Sähköposti, P.Postinumero, P.Postitoimipaikka FROM Henkilot as H JOIN Postitoimipaikat AS P ON H.Postinumero=P.Postinumero

INSERT Postitoimipaikat VALUES ('00169', 'Helsinki'), ('00150', 'Helsinki')

--DELETE FROM Henkilot WHERE Henkilö_id IN ('1009', '1008') 