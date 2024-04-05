-- ---------------------------------------------
-- INSERT 2 rader (tabell: personer2)
-- ---------------------------------------------
INSERT INTO personer2 VALUES (1, '{
  "person": {

    "pnr":     "001",
    "fornavn":         "Ola",
    "etternavn": "Nordmann",
    "barn": 1,
    "fodselsdato": "1980-01-01"
  }
}');
INSERT INTO personer2 VALUES (6, '{"person":{"pnr": "002",
    "fornavn": "Kari", "etternavn": "Pettersen",
    "fodselsdato": "1993-08-23"}}');

commit;