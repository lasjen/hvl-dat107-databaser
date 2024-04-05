-- -----------------------------
-- View data
-- -----------------------------
select * from personer;

-- -----------------------------
-- JSON_BUILD_OBJECT
-- -----------------------------
select json_build_object('fornavn', p.fornavn)
from personer p;

-- -----------------------------
-- JSON_OBJECT
-- -----------------------------
select
   json_object(
      ARRAY['fornavn', 'etternavn'],
      ARRAY[p.fornavn,p.etternavn]
   )
from personer p;

-- -----------------------------
-- Putting this together
-- -----------------------------
select
   json_build_object(
      'person',
      json_object(
         ARRAY['fornavn', 'etternavn'],
         ARRAY[p.fornavn,p.etternavn]
      )
   )
from personer p
where 1=1
  and p.id = 1
;

-- -----------------------------
-- JSON_AGG
-- -----------------------------
select
   jsonb_build_object('personer',
                      json_agg(
                            jsonb_build_object(
                                  'person',
                                  jsonb_object(
                                        ARRAY ['id','fornavn', 'etternavn'],
                                        ARRAY [p.id::varchar, p.fornavn,p.etternavn]
                                     )
                               )
                         )
      )
from personer p;

-- -----------------------------
-- A little simpler
-- -----------------------------
SELECT json_build_object('personer',json_agg(p))
FROM personer p;