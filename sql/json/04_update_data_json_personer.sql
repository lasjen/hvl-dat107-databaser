-- -----------------------------
-- Oppdatere verdi i nøkkelpar
-- -----------------------------
UPDATE personer
  SET person_data = jsonb_set(person_data,'{person,fornavn}', '"Niel"')
  WHERE 1=1
    and person_id = 3
    --and person_data -> 'person' ->> 'fornavn' = 'Nils'
;

SELECT person_id,
       person_data -> 'person'->> 'fornavn' fornavn,
       person_data -> 'person'->> 'barn' barn
FROM personer
WHERE person_id=3;


-- -----------------------------
-- Slette nøkkel par
-- -----------------------------
UPDATE personer p
   SET person_data = p.person_data #- '{person,barn}'
   WHERE p.person_id=3;

SELECT p.person_id, p.person_data
FROM personer p
WHERE p.person_id=3;

-- -----------------------------
-- Legge til nøkkel par
-- -----------------------------
UPDATE personer
   SET person_data = jsonb_set(person_data,'{person,barn}', '2')
   WHERE person_id = 3;

SELECT p.person_id, p.person_data
FROM personer p
WHERE p.person_id=3;