USE [KouluKanta]
GO

/****** Object:  UserDefinedFunction [dbo].[F_KA]    Script Date: 14.4.2016 17:16:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* 
Laatinut: 14.4.2016, Juha Sonck
Parametri: Desimaaliluku
Toiminta: Funktio muuntaa desimaaliajan kellonajaksi

Funktion testaaminen
select dbo.F_KA(1.00001) as aika
select dbo.F_KA(-62.589999999876868) as aika

SQL-laskennan oikeellisuuden testaaminen: Excelissä voi muuntaa desimaaliluvun tunnit:minuutit:sekunnit -muotoon tällä kaavalla: =TEKSTI(C5/24;"[t]:mm:ss")

Huomautus, ottamalla pois --DEBUG-rivin kommentin, funktio palauttaa arvon perään yksittäisten laskennassa käytettyjen muuttujien arvot

*/

ALTER FUNCTION [dbo].[F_KA] (@desimaalitunnit numeric(15,7))
RETURNS varchar(1000)
AS
BEGIN
	DECLARE @paluuarvo varchar(1000)
	DECLARE @etumerkki varchar(1)
	DECLARE @desimaaliminuutit numeric(15,7)
	DECLARE @desimaalisekunnit numeric(15,7)

	DECLARE @itunnit int
	DECLARE @iminuutit int
	DECLARE @isekunnit int

	DECLARE @ctunnit varchar(2)
	DECLARE @cminuutit varchar(2)
	DECLARE @csekunnit varchar(2)

	SET @desimaaliminuutit = (ABS(@desimaalitunnit) - FLOOR(ABS(@desimaalitunnit))) * 60
	SET @desimaalisekunnit = (ABS(@desimaaliminuutit) - FLOOR(ABS(@desimaaliminuutit))) * 60

	SET @itunnit = FLOOR(@desimaalitunnit)
	SET @iminuutit = FLOOR(@desimaaliminuutit)
	SET @isekunnit = CONVERT(int,ROUND(@desimaalisekunnit,0))

	IF (@isekunnit = 60) 
	BEGIN
		SET @isekunnit = 0
		SET @iminuutit = @iminuutit+1
	END

	IF (@iminuutit >= 60) 
	BEGIN
		SET @iminuutit = @iminuutit-60
		SET @itunnit = @itunnit+1
	END
	
	SET @ctunnit = RIGHT('00'+convert(varchar,@itunnit),2)
	SET @cminuutit = RIGHT('00'+convert(varchar,@iminuutit),2)
	SET @csekunnit = RIGHT('00'+convert(varchar,@isekunnit),2)

	IF (@desimaalitunnit < 0)  SET @etumerkki = '-' ELSE SET @etumerkki =''

	SET @paluuarvo = @etumerkki+@ctunnit +':'+ @cminuutit + ':' + @csekunnit
	--DEBUG SET @paluuarvo = @paluuarvo + ' DEBUG:'+' TUNNIT='+convert(varchar,@desimaalitunnit)+' MINUUTIT='+convert(varchar,@desimaaliminuutit) +' SEKUNNIT='+convert(varchar,@desimaalisekunnit)
	RETURN @paluuarvo
END


GO


