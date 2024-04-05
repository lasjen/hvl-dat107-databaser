-- -----------------------------
-- Geometric Datatypes
-- -----------------------------
drop table if exists test;

create table test (
   id integer,
   c  CIRCLE
);

insert into test values (1, circle(point(10,10),20));

select * from test;