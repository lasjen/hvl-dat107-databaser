-- ---------------------------------------------
-- Query Locations
-- - Proprieter lagring
-- ---------------------------------------------
select * from locations;

-- ---------------------------------------------
-- Pakke ut data
-- ---------------------------------------------
select l.id, l.time, ST_AsText(l.point) as location
from locations l;


-- ---------------------------------------------
-- Distance mellom første og punkt nr 30
-- ---------------------------------------------
select st_distance( (select l.point from locations l where id='c66b3f07-3122-4c8b-ab31-c75fc0360675'),
                    (select l.point from locations l where id='aa97de77-4a37-47c3-84f3-622a555c2ad7'))
       as avstand_i_meter;

-- ---------------------------------------------
-- Distance mellom første og siste punkt
-- ---------------------------------------------
select st_distance( (select l.point from locations l where id='c66b3f07-3122-4c8b-ab31-c75fc0360675'),
                    (select l.point from locations l where id='dc69be85-af29-431d-823c-dd8eb1462870'))
       as avstand_i_meter;

