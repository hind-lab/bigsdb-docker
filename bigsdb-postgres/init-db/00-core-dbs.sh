createuser apache

echo "ALTER ROLE apache WITH PASSWORD 'remote';" | psql

createdb bigsdb_auth
psql -f /bigsdb/auth.sql bigsdb_auth
createdb bigsdb_prefs
psql -f /bigsdb/prefs.sql bigsdb_prefs
createdb bigsdb_refs
psql -f /bigsdb/refs.sql bigsdb_refs