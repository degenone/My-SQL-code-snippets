ALTER FUNCTION dbo.F_Sposti(@Etunimi varchar(50), @Sukunimi varchar(50))
RETURNS varchar(150)
AS
BEGIN
	DECLARE @Sposti varchar(150)
	SELECT @Sposti = LOWER(@Etunimi) + '.' + LOWER(@Sukunimi) + '@student.careeria.fi'
	RETURN @Sposti
END