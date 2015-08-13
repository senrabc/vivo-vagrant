import rdflib


#notes: so formatting for the ntriples file is required
# sed -i 's/^^/^^</g' "7LINE-testCountry-Data.nt"
#	replace all "^^" with "^^<", elimnates parse error "rdflib.plugins.parsers.ntriples.ParseError: Invalid line: '^^http://www.w3.org/2001/XMLSchema#string . ' "


g = rdflib.Graph()
result = g.parse("7LINE-testCountry-Data.nt", format="nt")

print("graph has %s statements." % len(g))
# prints graph has x statements.

for subj, pred, obj in g:
   if (subj, pred, obj) not in g:
       raise Exception("It better be!")

s = g.serialize(format='n3')