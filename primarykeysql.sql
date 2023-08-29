select * from Henkilot_bak where Etunimi='Laura|1234'
select * from Henkilot_bak where Etunimi='Tero|1242'
select * from Henkilot_bak where Sukunimi='Saari|1348'
select * from Henkilot_bak where Osoite='Palomäenkatu 4'
select * from Henkilot_bak where Henkilö_id='35980'

select * from Tunnit

ALTER TABLE dbo.Henkilot ADD CONSTRAINT
	PK_Henkilot PRIMARY KEY CLUSTERED
	(
	Henkilo_id
	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE dbo.Projektit ADD CONSTRAINT
	PK_Projektit PRIMARY KEY CLUSTERED
	(
	Projekti_id
	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE dbo.Tunnit ADD CONSTRAINT
	PK_Tunnit PRIMARY KEY CLUSTERED
	(
	Tunti_id
	) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO