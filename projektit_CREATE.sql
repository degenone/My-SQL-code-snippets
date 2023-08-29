CREATE TABLE Projektit
(
	Projekti_id int IDENTITY (1000, 1) NOT NULL,
	Nimi nvarchar(100) NULL
)

--DROP TABLE Projektit

CREATE TABLE Henkilot
(
	Henkilo_id int NULL,
	Etunimi nvarchar(50) NULL,
	Sukunimi nvarchar(50) NULL,
	Osoite nvarchar(100) NULL,
	Esimies int NULL
)

--Sarakkeen poisto (tarvittaessa)
ALTER TABLE Henkilot DROP COLUMN Henkilo_id
--Sarakkeen lisäys
ALTER TABLE Henkilot ADD Henkilo_id int NOT NULL IDENTITY (1000, 1) 
ALTER TABLE Henkilot ADD Postinumero varchar(5) NOT NULL
--Select * from henkilot



CREATE TABLE Tunnit
(
	Tunti_id int IDENTITY (1000, 1) NOT NULL,
	Projekti_id int NULL,
	Henkilo_id int NULL,
	Pvm datetime NULL,
	Tunnit int NULL
)


CREATE TABLE [dbo].[Postitoimipaikat](
	[Postinumero] [varchar](50) NULL,
	[Postitoimipaikka] [varchar](50) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Lokitaulu](
	Taulunnimi varchar(50) NULL,
	Kentannimi varchar(50) NULL,
	Vanhatieto varchar(max) NULL,
	Uusitieto varchar(max) NULL,
	Paivityspvm datetime,
	Paivityskayttaja varchar(100) NULL

) ON [PRIMARY]

GO
