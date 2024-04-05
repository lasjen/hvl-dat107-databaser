(: read persons with barn > 0 :)
let $personer := (doc("personer.xml")/personer/person)

return <results>
{
   for $x in $personer
   where $x/barn>0
   order by $x/barn
   return $x/fornavn
}
</results>