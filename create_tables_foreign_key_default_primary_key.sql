create table Postitoimipaikat
(
	PostiNro char(5),
	Postitoimipaikka nvarchar(100)
 constraint PK_Postitoimipakat primary key clustered
 (
	PostiNro asc
 )
)
 go
 --drop table dbo.Tuotteet
 create table dbo.Tuotteet(
	TuoteId int identity(1000,1) not null,
	TuoteNimi nvarchar(100) not null,
	Hinta decimal(19, 4) not null,
	MaaraVarastossa int not null
	constraint PK_Tuotteet primary key clustered
	(
		TuoteId asc
	)
)
go

create table dbo.Asiakkaat(
	AsiakasId int identity(1, 1) not null,
	Etunimi nvarchar(50) not null,
	Sukunimi nvarchar(50) not null,
	PuhelinNumero varchar(10),
	Email nvarchar(100) not null,
	Osoite nvarchar(100),
	PostiNro char(5) foreign key references Postitoimipaikat(PostiNro)
	constraint PK_Asiakkaat primary key clustered
	(
		AsiakasId asc
	)
)
go

create table dbo.Tilaukset(
	TilausId int identity(1000, 1) not null,
	AsiakasId int foreign key references Asiakkaat(AsiakasId) not null,
	Osoite nvarchar(100) not null,
	PostiNro char(5) foreign key references Postitoimipaikat(PostiNro) not null,
	constraint PK_Tilaukset primary key clustered
	(
		TilausId asc
	)
)
go

create table dbo.Tilausrivit(
	TilausriviId int identity(1000,1) not null,
	TilausId int foreign key references Tilaukset(TilausId) not null,
	TuoteId int foreign key references Tuotteet(TuoteId) not null,
	TilausPvm datetime default getdate(),
	ToimitusPvm datetime,
	Maara int default 1,
	Hinta decimal(19,4) not null
	constraint PK_Tilausrivit primary key clustered
	(
		TilausriviId
	)
)
go