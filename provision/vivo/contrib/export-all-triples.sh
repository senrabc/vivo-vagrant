#!/bin/bash

# using the custom mysql query in mysql-query-all-triples.sql this script will
# export all triples out in an N-triples format. This format was extrapolated from 
# matching the output of the "rdf export" in the site admin of the empty vagrant
mysql -uroot -pvivo vivodev < mysql-query-all-triples.sql > out.txt
