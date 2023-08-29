use Projekti
INSERT Henkilot (Etunimi, Sukunimi, Osoite, Esimies, Postinumero) 
VALUES ('Ville','Helvilä','Nakkikatu 111',1000,'59100')
INSERT Henkilot (Etunimi, Sukunimi, Osoite, Esimies, Postinumero) 
VALUES ('Tero','Kilpelä','Kotikatu 1',1001,'45100')
UPDATE Henkilot SET Sukunimi = 'Kilpeläinen' WHERE Henkiloid = 1001
UPDATE Henkilot SET Esimies = 1002 WHERE Henkiloid = 1000
--SELECT * FROM Henkilot
--SELECT * FROM Lokitaulu

INSERT Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit)
VALUES (1001,2000,getdate()-2,7.5)
INSERT Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit)
VALUES (1002,1000,getdate()-1,17.5)
--SELECT * FROM Tunnit

INSERT Projektit (Nimi) VALUES ('Putkiremontti')
--SELECT * FROM Projektit


INSERT Postitoimipaikat (Postinumero, Postitoimipaikka)
VALUES ('53810','Lappeenranta')
INSERT Postitoimipaikat (Postinumero, Postitoimipaikka)
VALUES ('59100','Parikkala')
--SELECT * FROM Postitoimipaikat
delete Postitoimipaikat where Postinumero = '59100'

SELECT dbo.F_Sposti('Tero', 'Kilpeläinen')
SELECT dbo.F_Nettopalkka(15.4, 45, 80, 10, 8)