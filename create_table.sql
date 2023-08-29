CREATE TABLE Projektit
(
Projekti_id int NOT NULL IDENTITY(1000, 1),
Nimi nvarchar(100)
)

CREATE TABLE Tunnit
(
Tunti_id int NOT NULL IDENTITY(1000, 1),
Projekti_id int NULL,
Henkilo_id int NULL,
Pvm datetime NULL,
Tunnit int NULL
)

ALTER TABLE Tunnit DROP COLUMN Tunnit
ALTER TABLE Tunnit ADD Tunnit numeric(15,7) -- NOT NULL IDENTITY(1000, 1)

CREATE TABLE F_KA
(
desimaalitunnit numeric(15,7)
)
DROP TABLE F_KA