drop table if exists personer;
drop table if exists personer2;

-- ---------------------------------------------
-- Datatype: JSONB
-- ---------------------------------------------
CREATE TABLE personer (
  person_id integer,
  person_data jsonb NOT NULL,
  PRIMARY KEY (person_id)
) TABLESPACE pg_default;

-- ---------------------------------------------
-- Datatype: JSON
-- ---------------------------------------------
CREATE TABLE personer2 (
   person_id integer,
   person_data json NOT NULL,
   PRIMARY KEY (person_id)
) TABLESPACE pg_default;

