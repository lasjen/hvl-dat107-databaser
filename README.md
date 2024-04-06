# hvl-dat107-databaser

Eksempler for NoSQL delen av DAT107 - databaser ved Høgskolen på Vestlandet.

## Del 1 - Mappen: sql_intro

Mappen "sql_intro" inneholder eksempler på XML-filer (personer*.xml), XML Schema (personer*.xsd), og stilark (personer*.xsl).

Øvinge:
Åpne et program/applikasjon som har funksjonalitet for å validere et XML dokument, f.eks. Eclipse, Visual Studio Code og/eller IntelliJ JetBrain.

Prøv å bryte reglene for et "velformet" XML dokument, og se hvordan applikasjonen håndterer dette (viktig at XML-en du jobber med er lagret med filformat .xml for at applikasjonen som du benytter skal vite hvilket type dokument du jobber med).

Se om det programmet du benytter har funksjonalitet for å validere om ditt xml-dokument er gyldig (NB! De ulike xml-filene i denne mappen er knyttet til ulike XML Schema definisjoner/filer).

### XML Schema
#### Fil: personer.xml (schema: personer.xsd)
Denne filen er knyttet til schema definert i "personer.xsd".
Se om du finner funksjonalitet i din editor, og se om den har funksjonalitet for å automatisk generere en XML Schema fil ut fra "personer.xml" filen (overskriv gjerne personer.xsd).

#### Fil: personer2.xml (schema: personer_fixed.xsd)
I denne XML-filen er "pnr" et ELEMENT under "person" elementet.

Denne filen er knyttet til schema definert i "personer_fixed.xsd".
I denne schema definisjonen navngir jeg ikke typer, men n�ster alle element definisjoner inne i hverandre. Jeg foretrekker nok selv den andre metoden (vist i personer_fixed2.xsd), der vi navngir simple og komplekse typer.

#### Fil: personer3.xml (schema: personer_fixed2.xsd)
Her har vi gjort om "pnr" til et ATTRIBUTT til "person" elementet. Samt at vi har definert "pnr" attributet som UNIKT for alle personer (Se filen "personer_fixed2.xsd").
I denne schema definisjonen gir jeg simple og komplekse datatyper navn. 
Jeg mener dette er mere oversiktelig (spesielt n�r filene blir store), og man kan benytte typene eventuelt flere steder i schema definisjonen.

### XML stilark (XSLT)

#### Fil: personer4.xml (stilark: personer.xsl)

Åpne denne XML-filen i en browser (f.eks. Chrome), og se hvordan XML data transformeres til HTML, og presenteres i din browser.

#### Fil: personer5.xml (stilark: personer-table.xsl)

Åpne denne XML-filen i en browser (f.eks. Chrome), og se hvordan XML data transformeres til HTML, og presenteres i din browser.
Her skal alle personene nå bli presentert i en tabell. 
Prøv å endre stilarket til å kun liste ut de personene med barn (barn>0). Legg til en person til med barn, og se at tabellen endrer seg (etter en REFRESH).
  
## Del 2 - XML Types  og Postgres

Filer: <repository>/sql/xml/*

Her må du benytte kontoen du har mot PostgreSQL databasen ved HVL.

Bruk f.eks. pgAdmin til å kjøre SQL-ene (eventuelt et annet verktøy). Jeg opprettet en database kobling direkte fra IntelliJ. Dette skal være mulig også med Eclipse.

### XML Type og XPath 

#### Fil: 01_create_table_xml_personer.sql 

Kjør disse kommandoene for å slette og opprette PERSONER tabellen på nytt.

#### Fil: 02_insert_data_xml_personer.sql

Kjør disse kommandoene for å legge inn data.

#### Fil: 03_select_data_xml_personer.sql

Test og modifiser de ulike SQL-ene for å bli kjent med de ulike funksjonalitetene rundt XML type og XPath i PostgreSQL.

### Del 3: Generer XML data fra relasjons tabeller

Filer: <repository>/rdbms/*

#### Fil: 11_create_table_personer.sql

Kjør script for å generer PERSONER tabell (relasjonell modell).

#### Fil: 12_insert_table_personer.sql

Kjør skript for å legge til data i PERSONER tabell.

#### Fil: 13_select_data_personer_xml.sql

Test og modifiser de ulike SQL-ene for å bli kjent med de ulike funksjonalitetene rundt funksjonalitet for å generer XML data fra relasjons tabeller.

#### Fil: 14_select_data_personer_json.sql

Test og modifiser de ulike SQL-ene for å bli kjent med de ulike funksjonalitetene rundt funksjonalitet for å generer JSON data fra relasjons tabeller.
 
 
## Del 3 - XQuery

Denne er ikke så veldig viktig, men gir en liten forståelse for hva XQuery er.

Se på filene:

- personer.xml
- personer.xqy
- XQueryTester.java
- run.sh

For at dette skal fungere, må du laste ned Saxon (Link: https://github.com/Saxonica/Saxon-HE/blob/main/12/Java/SaxonHE12-4J.zip)
Se hvilke filer du trenger i classpath i run.sh, og endre run.sh til å peke mot dine JAR-filer.

Kjør "sh run.sh" (eventuelt kopier og kjør kommando direkte i Windows).

## Del 4 - JSON

Filer: <repo>/json/*

Denne følger samme mal som filene under <repo>/xml (se del 2 over).
