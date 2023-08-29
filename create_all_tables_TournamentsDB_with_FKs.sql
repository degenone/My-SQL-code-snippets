use Tournaments

create table Tournaments
(
	id int not null identity(1, 1),
	TournamentName nvarchar(50) not null,
	EntryFee money not null
) 
go
alter table Tournaments
add constraint [PK_Tournament] primary key ([id])
go

create table Teams
(
	id int not null identity(1, 1),
	TeamName nvarchar(50) not null
) 
go
alter table Teams
add constraint [PK_Team] primary key ([id])
go

create table TournamentEntries
(
	id int not null identity(1, 1),
	TournamentId int not null,
	TeamId int not null
) 
go
alter table TournamentEntries
add constraint [PK_TournamentEntries] primary key ([id])
go

alter table TournamentEntries
add constraint [FK_TournamentEntries_Teams]
foreign key ([TeamId]) references [dbo].[Teams] ([id])
go

alter table TournamentEntries
add constraint [FK_TournamentEntries_Tournaments]
foreign key ([TournamentId]) references [dbo].[Tournaments] ([id])
go

create table Prizes
(
	id int not null identity(1, 1),
	PlaceNumber int not null,
	PlaceName nvarchar(50) not null,
	PrizeAmount money not null,
	PrizePercentage float not null
)
go
alter table Prizes
add constraint [PK_Prizes] primary key ([id])
go

create table TournamentPrizes
(
	id int not null identity(1, 1),
	TournamentId int not null,
	PrizeId int not null
)
go
alter table TournamentPrizes
add constraint [PK_TournamentPrizes] primary key ([id])
go

alter table TournamentPrizes
add constraint [FK_TournamentPrizes_Prizes]
foreign key ([PrizeId]) references [dbo].[Prizes] ([id])
go

alter table TournamentPrizes
add constraint [FK_TournamentPrizes_Tournaments]
foreign key ([TournamentId]) references [dbo].[Tournaments] ([id])
go

create table TeamMembers
(
	id int not null identity(1, 1),
	TeamId int not null,
	PersonId int not null
)
go
alter table TeamMembers
add constraint [PK_TeamMembers] primary key ([id])
go

create table Person
(
	id int not null identity(1, 1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	EmailAddress nvarchar(200) not null,
	CellphoneNumber varchar(20) null,
)
go
alter table Person
add constraint [PK_Person] primary key ([id])
go

alter table TeamMembers
add constraint [FK_TeamMembers_Person]
foreign key ([PersonId]) references [dbo].[Person] ([id])
go

alter table TeamMembers
add constraint [FK_TeamMembers_Teams]
foreign key ([TeamId]) references [dbo].[Teams] ([id])
go

create table Matchups
(
	id int not null identity(1, 1),
	WinnerId int null,
	MatchupRound int not null
)
go
alter table Matchups
add constraint [PK_Matchups] primary key ([id])
go

alter table Matchups
add constraint [FK_Matchups_Teams]
foreign key ([WinnerId]) references [dbo].[Teams] ([id])
go

create table MatchupEntries
(
	id int not null identity(1, 1),
	MatchupId int not null,
	ParentMatchupId int null,
	TeamCompetingId int not null,
	Score int null
)
go
alter table MatchupEntries
add constraint [PK_MatchupEntries] primary key ([id])
go

alter table MatchupEntries
add constraint [FK_MatchupEntries_Matchups]
foreign key ([MatchupId]) references [dbo].[Matchups] ([id])
go

alter table MatchupEntries
add constraint [FK_MatchupEntries_ParentMatchups]
foreign key ([ParentMatchupId]) references [dbo].[Matchups] ([id])
go

alter table MatchupEntries
add constraint [FK_MatchupEntries_Teams]
foreign key ([TeamCompetingId]) references [dbo].[Teams] ([id])
go
