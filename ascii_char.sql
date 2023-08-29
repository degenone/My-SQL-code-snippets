SET TEXTSIZE 0
DECLARE @pos int, @str char(8)
SET @pos = 1
SET @str = 'Good*p@ssSana'
while @pos <= DATALENGTH(@str)
	BEGIN
	SELECT ASCII(SUBSTRING(@str, @pos, 1)) AS 'ASCII #', CHAR(ASCII(SUBSTRING(@str, @pos, 1))) AS 'Character'
	SET @pos = @pos + 1
	END
GO