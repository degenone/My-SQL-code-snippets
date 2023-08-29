CREATE FUNCTION dbo.F_SahkoPosti (@etu varchar(50), @suku varchar(50), @domain varchar(50))
RETURNS varchar(152)
AS
BEGIN
	DECLARE @p varchar(1), @at varchar(1), @sPosti varchar(152), @email varchar(152)
	SET @p = '.'
	SET @at = CHAR(64)
	SET @sPosti = LOWER(@etu) + @p + LOWER(@suku) + @at + LOWER(@domain)
	SET @email = REPLACE(@sPosti, ' ', '') COLLATE SQL_Latin1_General_CP1253_CI_AI
	RETURN ISNULL(@email, 'virhe osoitteen käsittelyssä')
END

select dbo.F_SahkoPosti('Tero', 'Kilpeläinen ', 'gmail.com') as 'email'