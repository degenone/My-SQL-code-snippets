SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.spMatchupEntires_GetByMatchup
	@MatchupId int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.MatchupEntries
	WHERE MatchupId = @MatchupId
END
GO

CREATE PROCEDURE dbo.spMatchups_GetByTournament
	@TournamentId int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT m.* FROM dbo.Matchups m
	INNER JOIN dbo.MatchupEntries me ON m.id = me.MatchupId
	INNER JOIN dbo.Teams t ON me.TeamCompetingId = t.id
	INNER JOIN dbo.TournamentEntries te ON te.TeamId = t.id
	WHERE te.TournamentId = @TournamentId
END
GO

CREATE PROCEDURE dbo.spPeople_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Person
END
GO

CREATE PROCEDURE dbo.spPrizes_GetByTournament
	@TournamentId int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.* FROM dbo.Prizes p
	INNER JOIN dbo.TournamentPrizes t on p.id = t.PrizeId
	WHERE t.TournamentId = @TournamentId
END
GO

CREATE PROCEDURE dbo.spTeam_GetByTournament
	@TournamentId int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT t.* FROM dbo.Teams t
	INNER JOIN dbo.TournamentEntries te ON te.TeamId = t.id
	WHERE TournamentId = @TournamentId
END
GO

CREATE PROCEDURE dbo.spTeamMembers_GetByTeam
	@TeamId int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.TeamMembers WHERE TeamId = @TeamId
END
GO

CREATE PROCEDURE dbo.spTournaments_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM dbo.Tournaments
END
GO