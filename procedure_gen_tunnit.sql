CREATE PROCEDURE dbo.uspGenTunteja (@maara int)--Projecktiid int, Henkilo_id int, Pvm datetime, Tunnit int
AS
	DECLARE @Pid int, @Hid int, @Pvm datetime, @Tunnit int, @i int, @Stri varchar(10), @Pmax int, @Hmax int
	SET @i = 0
	SET @Pid = 1000
	SET @Hid = 1000
	SELECT @Pmax = MAX(projektiid) FROM Projektit
	SELECT @Hmax = MAX(Henkiloid) FROM Henkilot
	WHILE @i <= @maara
	BEGIN
		SET @Pvm = GETDATE() - @i
		SET @Tunnit = @i + 1
		IF @Pid > @Pmax
		BEGIN
			SET @Pid = 1000
		END
		IF @Hid > @Hmax
		BEGIN
			SET @Hid = 1000
		END
		INSERT Tunnit (Projekti_id, Henkilo_id, Pvm, Tunnit) VALUES (@Pid, @Hid, @Pvm, @Tunnit)
		SET @i = @i + 1
		SET @Hid = @Hid + 1
		SET @Pid = @Pid + 1
	END
	SET @Stri = CONVERT(varchar, @i)
	PRINT 'Lisätty ' + @Stri + ' riviä'
GO



--EXEC dbo.uspGenTunteja 50
--select * from Tunnit