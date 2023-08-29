use TilausDB
CREATE TABLE Kayttajat 
(
	KayttajaId int NOT NULL IDENTITY (1000, 1),
	KayttajaNimi nvarchar(50) NOT NULL,
	PassWord nvarchar(50) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	Rooli int NOT NULL,
	CONSTRAINT [PK_Kayttaja] PRIMARY KEY CLUSTERED
	(
	KayttajaId ASC
	)
	WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Roolit
(
	RooliId int NOT NULL IDENTITY (1, 1),
	Rooli nvarchar(50) NOT NULL,
	CONSTRAINT [PK_Roolit] PRIMARY KEY CLUSTERED
	(
	RooliId ASC
	)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Kayttajat]  
WITH CHECK ADD CONSTRAINT [FK_Kayttajat_Roolit] 
FOREIGN KEY([Rooli]) REFERENCES [dbo].[Roolit] ([RooliId])
GO

--begin transaction
--rollback
--commit

SELECT * INTO login_apu FROM Logins
DROP TABLE Logins
SELECT * FROM login_apu