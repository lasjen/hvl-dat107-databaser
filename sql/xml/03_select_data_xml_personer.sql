SET search_path TO nosql01;

-- ---------------------------------------------
-- Div queries
-- ---------------------------------------------
select * from personer;

select * from personer where person_data IS DOCUMENT;

-- ---------------------------------------------
-- XPATH og text()
-- ---------------------------------------------
select XPath('/person/fornavn', person_data) fornavn1
       ,unnest(XPath('/person/fornavn', person_data)) fornavn2
       ,XPath('/person/fornavn/text()', person_data) fornavn3
       ,(XPath('/person/fornavn/text()', person_data))[1] fornavn4
       ,unnest(XPath('/person/fornavn/text()', person_data)) fornavn5
from personer;

-- ---------------------------------------------
-- XPATH_EXIST og concatination
-- ---------------------------------------------
select person_id,
       unnest(XPath('/person/fornavn/text()', person_data)) || ' ' ||
       unnest(XPath('/person/etternavn/text()', person_data)) navn,
       XPath('/person/barn/text()', person_data) barn1
       ,unnest(XPath('/person/barn/text()', person_data)) barn2
       ,(XPath('/person/barn/text()', person_data))[1] barn3
from personer
where xpath_exists('/person[fornavn="Nils"]', person_data)
;