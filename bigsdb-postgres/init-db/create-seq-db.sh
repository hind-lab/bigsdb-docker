createdb bigsdb_test_seqdef
psql -f /bigsdb/seqdef.sql bigsdb_test_seqdef

createdb pubmlst_bigsdb_neisseria_isolates
psql -f /bigsdb/isolatedb.sql pubmlst_bigsdb_neisseria_isolates