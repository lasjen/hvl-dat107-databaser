drop table if exists personer;

CREATE TABLE personer (
   person_id integer,
   person_data xml NOT NULL,
   PRIMARY KEY (person_id)
) TABLESPACE pg_default;

