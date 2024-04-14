drop table if exists personer;

create table personer (
   id          integer constraint personer_pk primary key,
   person_no   varchar(11) not null,
   fornavn     varchar(20) not null,
   etternavn   varchar(50) not null,
   barn        integer,
   fodselsdato date,
   constraint personer_pno_length_ck check (length(person_no)=11),
   constraint personer_pno_number_ck check (to_number(person_no,'000000000000')>0)
);


