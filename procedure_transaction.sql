USE [Projekti]
GO
/****** Object:  StoredProcedure [dbo].[uspGeneroiHenkilot]    Script Date: 24.1.2020 17.25.47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGeneroiHenkilotTransactio] @maara int, @etu varchar(50), @suku varchar(50), @osoite varchar(100), @postinro varchar(5), @esimies int
AS
	SET NOCOUNT ON
	DECLARE @i int =1
	DECLARE @Stri varchar(10)
	BEGIN TRANSACTION
	WHILE @i <= @maara
	BEGIN
		SET @Stri = CONVERT(varchar, @i)
		INSERT INTO Henkilot (Etunimi, Sukunimi, Osoite, Postinumero, Esimies)
		VALUES (@etu + @Stri, @suku + @Stri, @osoite + @Stri, @postinro,  @esimies)
		SET @i = @i + 1
		IF @i % 50 = 1
		BEGIN
			PRINT 'Transactio päättyy -- viety yhteensä ' + @Stri + ' riviä'
			COMMIT
			BEGIN TRANSACTION
		END
	END
	PRINT 'Luotiin ' + @Stri + ' riviä'
	COMMIT

--EXEC dbo.uspGeneroiHenkilotTransactio 130, 'Testi', 'Testaaja', 'Kokeilukuja ', '32200', 1000
--select * from Henkilot