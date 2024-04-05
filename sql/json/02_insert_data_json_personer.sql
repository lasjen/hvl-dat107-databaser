-- ---------------------------------------------
-- INSERT 5 rader (tabell: personer)
-- ---------------------------------------------
INSERT INTO personer VALUES (1, '{
  "person": {
      "pnr": "001",
      "fornavn": "Ola",
      "etternavn": "Nordmann",
      "barn": 2,
      "telefon": [{"type": "priv", "nr": "90010123"},
                  {"type": "jobb", "nr": "90011334"}],
      "fodselsdato": "1980-01-01"
  }
}');
INSERT INTO personer VALUES (2, '{
   "person": {
      "pnr": "002",
      "fornavn": "Kari",
      "etternavn": "Pettersen",
      "telefon": [{"type": "priv", "nr": "90117124"},
                  {"type": "jobb", "nr": "90111337"}],
      "fodselsdato": "1999-08-23"
  }
}');
INSERT INTO personer VALUES (3, '{
  "person": {
    "pnr": "003",
    "fornavn": "Nils",
    "etternavn": "Hansen",
    "barn": 2,
    "fodselsdato": "1989-11-23"
  }
}');
-- Next two will fail
INSERT INTO personer VALUES (4, '{
   "person": {
      "pnr": "004",
      "fornavn": "Julia",
      "etternavn": "Bergan",
      "telefon": [{"type": "priv", "nr": "90117124"}],
      "fodselsdato": "1998-09-22"
  }
}');
INSERT INTO personer VALUES (5, '{
  "person": {
    "pnr": "005",
    "fornavn": "Luise",
    "etternavn": "Johnson",
    "barn": 2,
    "fodselsdato": "1989-11-23"
  }
}');
commit;
