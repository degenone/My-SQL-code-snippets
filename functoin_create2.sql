CREATE FUNCTION dbo.F_Nettopalkka(@Tuntipalkka numeric(4, 2), @Veropros int, @Tunnit int, @Tunnit50 int, @Tunnit100 int)
RETURNS numeric(10, 2)
AS
BEGIN
	DECLARE @Nettopalkka numeric(10, 2);
	SELECT @Nettopalkka = (1 - @Veropros / 100) * (@Tunnit * @Tuntipalkka + @Tunnit50 * 1.5 * @Tuntipalkka + @Tunnit100 * 2 * @Tuntipalkka)
	RETURN @Nettopalkka
END