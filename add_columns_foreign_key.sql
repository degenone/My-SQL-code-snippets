--begin transaction
--rollback
--commit
select * from Asiakkaat
select * from Henkilot

ALTER TABLE Asiakkaat
ADD Luottoraja numeric(8, 2)
ALTER TABLE Asiakkaat
ADD [www-sivut] nvarchar(200)

ALTER TABLE Asiakkaat
ADD Vastuumyyja int

ALTER TABLE [dbo].[Asiakkaat]
ADD CONSTRAINT [FK_Asiakkaat_Henkilot]
FOREIGN KEY ([Vastuumyyja]) REFERENCES [dbo].[Henkilot] ([Henkilo_id])