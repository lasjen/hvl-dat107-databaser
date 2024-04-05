-- ---------------------------------------------
-- INSERT UGYLDIGE rader (tabell: personer og personer2)
-- ---------------------------------------------
INSERT INTO personer VALUES (6, '"person":{"pnr": "002",
    "fornavn": "Kari", "etternavn": "Pettersen",
    "fodselsdato": "1993-08-23"}');
INSERT INTO personer2 VALUES (7, '"person"');

INSERT INTO personer2 VALUES (6, '"person":{"pnr": "002",
"fornavn": "Kari", "etternavn": "Pettersen",
"fodselsdato": "1993-08-23"}');

commit;
-- ---------------------------------------------
-- Clean
-- ---------------------------------------------
delete from personer2 where person_id=7;

select * from personer;
select * from personer2;