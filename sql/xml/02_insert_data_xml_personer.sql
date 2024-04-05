INSERT INTO personer VALUES (1, XMLPARSE(DOCUMENT '<person>
        <pnr>001</pnr>
        <fornavn>Ola</fornavn>
        <etternavn>Nordmann</etternavn>
        <barn>1</barn>
        <fodselsdato>1980-01-01</fodselsdato>
    </person>'));
INSERT INTO personer VALUES (2, XMLPARSE(CONTENT '<person>
        <pnr>002</pnr>
        <fornavn>Kari</fornavn>
        <etternavn>Pettersen</etternavn>
        <fodselsdato>1993-08-23</fodselsdato>
    </person>'));
INSERT INTO personer VALUES (3, '<person>
        <pnr>003</pnr>
        <fornavn>Nils</fornavn>
        <etternavn>Hansen</etternavn>
        <barn>2</barn>
        <fodselsdato>1989-11-23</fodselsdato>
    </person>');
-- Next two will fail
INSERT INTO personer VALUES (4, XMLPARSE(DOCUMENT '<person>
        <pnr>004</pnr>
        <fornavn>Julia</fornavn>
        <etternavn>Bergan</etternavn>
        <fodselsdato>1998-09-22</fodselsdato>
    </person>'));
INSERT INTO personer VALUES (5, '<person>
        <pnr>005</pnr>
        <fornavn>Luise</fornavn>
        <etternavn>Johnson</etternavn>
        <barn>2</barn>
        <fodselsdato>1989-11-23</fodselsdato>
    </person>');
commit;
