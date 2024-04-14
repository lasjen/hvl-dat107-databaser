do $$
<<clean_block>>
DECLARE
   rec   record;
BEGIN
   FOR rec IN
      select * from pg_tables where schemaname='nosql01'
   LOOP
      execute 'DROP TABLE if exists ' || quote_ident(rec.schemaname) || '.' || quote_ident(rec.tablename) || ' CASCADE';
      RAISE NOTICE 'Table: % (dropped)', rec.tablename ;
   END LOOP;
END
clean_block $$;