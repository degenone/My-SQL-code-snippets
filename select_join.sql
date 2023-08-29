USE KouluKanta
SELECT * FROM Henkilot WHERE S�hk�posti IS NULL

INSERT Henkilot (Etunimi, Sukunimi, Osoite, Postinumero) VALUES ('Miika', 'Poskiparta', 'Keinutie 11 B 30', '00150')

SELECT * INTO Henkilot_tmp FROM Henkilot
SELECT * FROM Henkilot_tmp
--DELETE FROM Henkilot_tmp WHERE Puhelin IS NULL
--DROP TABLE Henkilot_tmp
ALTER TABLE Henkikot
ADD Henkil�_id INT IDENTITY(1000, 1) PRIMARY KEY

UPDATE Henkilot SET Postinumero='59100' WHERE Henkil�_id='1003' -- kumpikin k�y, jos asetettu tyyppi sallii
UPDATE Henkilot SET Postinumero=59100 WHERE Henkil�_id=1003

UPDATE Henkilot SET S�hk�posti = LOWER(Etunimi) + '.' + LOWER(Sukunimi) + '@yritys.com' WHERE S�hk�posti IS NULL
UPDATE Henkilot SET S�hk�posti = LOWER(S�hk�posti)

--BEGIN TRANSACTION
--ROLLBACK
--COMMIT

SELECT * FROM Henkilot
SELECT * FROM Postitoimipaikat

ALTER TABLE Postitoimipaikat
ADD id INT IDENTITY(1000, 1) PRIMARY KEY

SELECT H.Henkil�_id, H.Etunimi, H.Sukunimi, H.Osoite, H.Postinumero, H.S�hk�posti, P.Postinumero, P.Postitoimipaikka FROM Henkilot as H LEFT JOIN Postitoimipaikat AS P ON H.Postinumero=P.Postinumero
SELECT H.Henkil�_id, H.Etunimi + ' ' + H.Sukunimi as Nimi, H.Osoite, H.Postinumero, H.S�hk�posti, P.Postinumero, P.Postitoimipaikka FROM Henkilot as H, Postitoimipaikat AS P WHERE H.Postinumero=P.Postinumero
SELECT H.Henkil�_id, H.Etunimi + ' ' + H.Sukunimi as Nimi, H.Osoite, H.Postinumero, H.S�hk�posti, P.Postinumero, P.Postitoimipaikka FROM Henkilot as H JOIN Postitoimipaikat AS P ON H.Postinumero=P.Postinumero

INSERT Postitoimipaikat VALUES ('00169', 'Helsinki'), ('00150', 'Helsinki')

--DELETE FROM Henkilot WHERE Henkil�_id IN ('1009', '1008') 