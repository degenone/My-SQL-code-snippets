USE KouluKanta
SELECT * From Projektit
select * from Henkilot
select * from Tunnit
select GETDATE()

--proj 1000-1004, henk 1000-1007 1010,1011
insert into Tunnit values ('1001', '1003', GETDATE()-5, '4')
insert into Tunnit values ('1001', '1004', GETDATE()-3, '10')
insert into Tunnit values ('1002', '1005', GETDATE()-41, '2')
insert into Tunnit values ('1002', '1006', GETDATE()-4, '7')
insert into Tunnit values ('1003', '1007', GETDATE()-3, '8')
insert into Tunnit values ('1003', '1010', GETDATE()-7, '12')
insert into Tunnit values ('1003', '1011', GETDATE()-8, '1')
UPDATE Tunnit SET Projekti_id='1001' where Henkilo_id='1000'
select * from Tunnit where Henkilo_id='1003' AND Tunti_id='1004'
DELETE FROM Tunnit where Henkilo_id='1003' AND Tunti_id='1004'

--UPDATE Henkilot SET Esimies='1003' WHERE Esimies IS NULL

--INSERT Projektit VALUES ('Full-stack'), ('IoT'), ('Game dev'), ('Mobile dev')

SELECT p.Projekti_id, p.Nimi AS [Projekti nimi], h.Henkilö_id, h.Etunimi + ' ' + h.Sukunimi AS [Henkilön nimi], CONVERT(nvarchar,t.Pvm,102) AS Päivämäärä from Projektit as p right join Tunnit as t on p.Projekti_id = t.Projekti_id right join Henkilot as h on h.Henkilö_id = t.Henkilo_id
GO
ALTER VIEW V_ProjektiRaportti ([Projekti numero], [Projekti nimi], [Henkilönumero], [Henkilön nimi], [Päivämäärä], [Kellonaika], [Tapahtuman kesto])
AS
SELECT
p.Projekti_id,
p.Nimi,
h.Henkilö_id,
h.Etunimi + ' ' + h.Sukunimi,
CONVERT(nvarchar, t.Pvm , 102),
CONVERT(nvarchar, t.Pvm , 108),
[dbo].F_KA(t.tunnit)
FROM Tunnit t, Henkilot h, Projektit p
WHERE h.Henkilö_id = t.Henkilo_id AND p.Projekti_id = t.Projekti_id

--select * from V_ProjektiRaportti