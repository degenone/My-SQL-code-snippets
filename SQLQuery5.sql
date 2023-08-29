USE Northwind

DBCC CHECKDB (NORTHWIND)
 --Tarkistaa tietokannan loogisen ja fyysisen eheyden
 --Suorittaa yhdell� kertaa seuraavat tarkistukset: 
DBCC CHECKCATALOG (NORTHWIND)
DBCC CHECKALLOC (NORTHWIND)
DBCC CHECKTABLE (NORTHWIND)

EXEC sp_MSforeachtable @command1="print '?'", @command2="DBCC CHECKTABLE ('?')"


--Tarkistaa annetun tietokannan taulujen ja indeksien kunnon
SELECT * FROM sys.dm_db_index_physical_stats (DB_ID(N'Northwind'), NULL, NULL, NULL, NULL);
GO

--Tarkistaa em. esimerkiss� northwind -tietokannan datan ja indeksien fragmentoitumisasteen 
--Tulostaa tiedot taulukkoon per Object_id 
--Object_id:n voi tarkistaa komennolla 
SELECT DISTINCT OBJECT_NAME(757577737) FROM master.sys.objects 
--Yo. esimerkiss�k�ytetty object_id:n� 757577737


--Indeksien rebuildi 
--Orders �taulun kaikkien indeksien rebuildi 
ALTER INDEX ALL ON Orders REBUILD WITH (FILLFACTOR = 70, SORT_IN_TEMPDB = ON, ONLINE=OFF)
GO


--Tietokannan kaikkien taulujen kaikkien indeksien rebuildi 

EXEC sp_MSforeachtable @command1="print '?'", @command2="ALTER INDEX ALL ON ? REBUILD WITH (FILLFACTOR=70,ONLINE=Off)"