SELECT person_id,
       unnest(XPath('/person/fornavn/text()', person_data)) fornavn
FROM personer
WHERE 1=1
  AND person_id=3
  --AND xpath_exists('/person[fornavn="Nils"]', person_data)
;

UPDATE personer
   SET person_data = '<person>
       <pnr>003</pnr>
       <fornavn>Nils</fornavn>
       <etternavn>Hansen</etternavn>
       <barn>2</barn>
       <fodselsdato>1989-11-23</fodselsdato>
   </person>'
   WHERE 1=1
    AND person_id = 3
    --AND xpath_exists('/person[fornavn="Nils"]', person_data)
;

SELECT person_id,
       unnest(XPath('/person/fornavn/text()', person_data)) fornavn
FROM personer
WHERE person_id=3;