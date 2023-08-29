use KouluKanta
CREATE NONCLUSTERED INDEX Henkilot_Etunimi_ix1 ON Henkilot (Etunimi ASC)

CREATE NONCLUSTERED INDEX Henkilot_bak_Etunimi_ix1 ON Henkilot_bak (Etunimi ASC) WITH (FILLFACTOR = 75)

CREATE INDEX Henkilot_bak_Sukunimi_ix ON Henkilot_bak (Sukunimi) WITH (FILLFACTOR = 75)

CREATE CLUSTERED INDEX Henkilot_bak_Osoite_ix ON Henkilot_bak (Osoite) WITH (FILLFACTOR = 75)

CREATE INDEX Henkilot_bak_Henikilö_id_ix ON Henkilot_bak (Henkilö_id) WITH (FILLFACTOR = 75)

CREATE INDEX Tunnit_Pvm_ix2 ON Tunnit (Pvm) WITH (FILLFACTOR = 75)

--DROP INDEX Henkilot.Henkilot_Etunimi_ix1
--DROP INDEX Tunnit.Tunnit_Pvm_ix2
--DROP INDEX Henkilot_bak.Henkilot_bak_Etunimi_ix1
--DROP INDEX Henkilot_bak.Henkilot_bak_Sukunimi_ix
--DROP INDEX Henkilot_bak.Henkilot_bak_Osoite_ix
--DROP INDEX Henkilot_bak.Henkilot_bak_Henikilö_id_ix