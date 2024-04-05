-- -----------------------------
-- Tabell: Personer
-- -----------------------------
select * from personer;

-- -----------------------------
-- Funksjon: COALESCE
-- -----------------------------
select fornavn,
       barn,
       coalesce(barn, 0)
from personer;
-- -----------------------------
-- XMLELEMENT example
-- -----------------------------
select xmlelement(name "person_no", p.person_no)
       ,xmlelement(name "navn", p.fornavn || ' ' || p.etternavn) navn
from personer p;

-- -----------------------------
-- XMLFOREST example
-- -----------------------------
select xmlforest(p.person_no, p.fornavn, p.etternavn, p.fodselsdato) person
from personer p;

-- -----------------------------
-- XMLFOREST example 2
-- -----------------------------
SELECT XMLForest(p.person_no, p.fornavn ||' '|| p.etternavn as "Navn" , p.barn) person
FROM personer p
WHERE p.id = 1;

-- -----------------------------
-- XMLAGG example
-- -----------------------------
select
   xmlagg(
      xmlelement(name "person",
                 xmlforest(p.person_no, p.fornavn, p.etternavn)
      )
   ) xml_data
from personer p;

-- -----------------------------
-- Full XML example (finn personer med barn)
-- -----------------------------
select
   xmlelement(name "personer",
              xmlagg(
                    xmlelement(name "person",
                               xmlforest(p.person_no, p.fornavn, p.etternavn, p.barn)
                       )
               )
      ) xml_data
from personer p
where coalesce(p.barn,0) > 0;

-- -----------------------------
-- TABLE_TO_XML
-- Arg1: Table name
-- Arg2: nulls? (boolean)
-- Arg3: tableforrest (boolean)
-- Arg4: targetns
-- -----------------------------
select table_to_xml('personer',true, false, 'http://home.hvl.no/databaser');
select table_to_xml('personer',true, true, 'http://home.hvl.no/databaser');

-- -----------------------------
-- QUERY_TO_XML
-- -----------------------------
select query_to_xml('select * from personer where id=1',true, false, 'http://home.hvl.no/databaser');

-- -----------------------------
-- QUERY_TO_XMLSCHEMA
-- -----------------------------
select table_to_xmlschema('personer',true, false, 'http://home.hvl.no/databaser');