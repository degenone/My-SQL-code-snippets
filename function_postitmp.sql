CREATE FUNCTION dbo.F_Ptoimipaikka (@postinro varchar(5))
RETURNS varchar(50)
AS
BEGIN
	DECLARE @postmp varchar(50)
	SELECT @postmp = Postitoimipaikka FROM Postitoimipaikat WHERE Postinumero = @postinro
	RETURN ISNULL(@postmp, 'Ei löydy')
END
GO