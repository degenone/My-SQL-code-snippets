create table Opettajat
(
	OpettajaID int primary key identity(1000,1) not null,
	Etunimi nvarchar(15) not null,
	Sukunimi nvarchar(25) not null,
	Email nvarchar(250) not null unique,
	Puhelin varchar(15) not null unique
)

alter table Kurssit add OpettajaID int
alter table kurssit add foreign key (OpettajaID) references Opettajat(OpettajaID)

insert into dbo.Opettajat (Etunimi, Sukunimi, Email, Puhelin)
values ('Jussi', 'Jokunen', 'jussi.jokunen@careeria.fi', '040 842 1239')
update dbo.Kurssit set OpettajaID = @@IDENTITY where KurssiID = 3