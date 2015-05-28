# this is what i got from the slow_querys_log when I ran "select ?s ?p ?0 {where ?s ?p ?o.}"
# in the VIVO sparql query admin interface 

#R_1.lex AS V_1_lex, R_1.datatype AS V_1_datatype, R_1.lang AS V_1_lang, R_1.type AS V_1_type, 
#R_2.lex AS V_2_lex, R_2.datatype AS V_2_datatype, R_2.lang AS V_2_lang, R_2.type AS V_2_type, 
#R_3.lex AS V_3_lex, R_3.datatype AS V_3_datatype, R_3.lang AS V_3_lang, R_3.type AS V_3_type



SELECT                                   -- V_1=?s V_2=?p V_3=?o
  CONCAT("<", R_1.lex, ">") AS V_1_lex,  
  CONCAT("<", R_2.lex, ">") AS V_2_lex, 
  CONCAT('"', R_3.lex, '"^^', R_3.datatype, ' . ') AS V_3_lex
FROM
    ( SELECT DISTINCT                    -- <urn:x-arq:DefaultGraphNode> ?s ?p ?o
                                         -- ?p:(Q_1.p=>S_1.X_1) ?o:(Q_1.o=>S_1.X_2) ?s:(Q_1.s=>S_1.X_3)
        Q_1.p AS X_1, Q_1.o AS X_2, Q_1.s AS X_3
      FROM Quads AS Q_1                  -- <urn:x-arq:DefaultGraphNode> ?s ?p ?o
    ) AS S_1                             -- <urn:x-arq:DefaultGraphNode> ?s ?p ?o
                                         -- ?p:(Q_1.p=>S_1.X_1) ?o:(Q_1.o=>S_1.X_2) ?s:(Q_1.s=>S_1.X_3)
  LEFT OUTER JOIN
    Nodes AS R_1                         -- Var: ?s
  ON ( S_1.X_3 = R_1.hash )
  LEFT OUTER JOIN
    Nodes AS R_2                         -- Var: ?p
  ON ( S_1.X_1 = R_2.hash )
  LEFT OUTER JOIN
    Nodes AS R_3                         -- Var: ?o
  ON ( S_1.X_2 = R_3.hash );

