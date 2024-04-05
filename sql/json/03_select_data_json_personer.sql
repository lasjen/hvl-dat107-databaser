SET search_path TO nosql01;

-- ---------------------------------------------
-- Div queries
-- ---------------------------------------------
select * from personer;
select * from personer2;

-- Dropping personer2 (foretrekker JSONB datatype)
drop table if exists personer2;

-- ---------------------------------------------
-- Hente ut objektverdier
-- ---------------------------------------------
select
   person_data -> 'person' person
   ,person_data -> 'person' ->> 'fornavn' fornavn
   ,person_data -> 'person' ->> 'etternavn' etternavn
   ,person_data -> 'person' -> 'telefon' telefon
from personer;

-- ---------------------------------------------
-- Tilsvarende XPATH with JSON
-- JSON_PATH_QUERY returns setof JSONB
-- Bruker egentlig JSONB_PATH_QUERY når i skal filtrere
-- $        root element to query
-- .key     to access a field of a json object
-- .*       to access all properties
-- [n]      Use square brackets ([]) to access an array element by its index (n), or [*] to access all array elements.
-- @        Represent the current node being processed by a filter predicate.
-- ?(exp)   Filter expression that evaluates to a boolean value.
-- ---------------------------------------------
select jsonb_path_query("person_data",'$.person')  person
       ,jsonb_path_query("person_data",'$.person.fornavn')  fornavn1
       ,jsonb_path_query("person_data",'$.person.fornavn')->>0  fornavn2
       ,jsonb_path_query("person_data",'$.person.etternavn')  etternavn
       ,jsonb_path_query(person_data, '$.person.telefon[*] ? (@.type == "priv")') tlf_priv
       ,jsonb_path_query(person_data, '$.person.telefon[*] ? (@.type == "jobb")') tlf_arb
       ,jsonb_path_query(jsonb_path_query(person_data, '$.person.telefon[*] ? (@.type == "jobb")'),'$.nr') ->>0 tlf_arb_nr
from personer;

-- ---------------------------------------------
-- JSONB_PATH_QUERY
-- Tilsvarende XPATH with JSON ("fjerne gåseøyne" - get json object field as text)
-- ---------------------------------------------
select jsonb_path_query("person_data",'$.person.fornavn') ->>0 fornavn,
       jsonb_path_query("person_data",'$.person.etternavn') ->>0 etternavn
from personer;

-- ---------------------------------------------
-- JSONB_PATH_EXISTS (finn alle med registrerte barn)
-- ---------------------------------------------
select person_id,
       person_data
from personer
where 1=1
  and jsonb_path_exists("person_data",'$.person.barn')
;

select person_id,
       person_data
from personer
where 1=1
  and jsonb_path_exists(person_data, '$.person.fornavn ? (@[*] == "Kari")')
;

-- ---------------------------------------------
-- JSONB Operators (finn alle med fornavn Nils)
-- -> Get JSON Object
-- ->> Get JSON Object field as text
-- ---------------------------------------------
select person_id,
       person_data -> 'person' ->> 'fornavn' fornavn,
       person_data -> 'person' person_json
from personer
where person_data -> 'person'->> 'fornavn' = 'Nils'
;

-- ---------------------------------------------
-- jsonb_path_query and JSONB Operators (finn alle med 2 eller flere telefonnumre)
-- ---------------------------------------------
with my_data as (
   select p.*,
          to_number(jsonb_path_query("person_data",'$.person.telefon.size()') ->>0,'99999') ant_tlf
   from personer p)
 select *
 from my_data m
 where ant_tlf >=2
;

