# Start db with ssl on
echo hostssl all keycloak 0.0.0.0/0 md5 clientcert=1 >> "$PGDATA/pg_hba.conf"
echo ssl = on >> "$PGDATA/postgresql.conf"
echo "ssl_cert_file = '/certs/server.crt'" >> "$PGDATA/postgresql.conf"
echo "ssl_key_file = '/certs/server.key'" >> "$PGDATA/postgresql.conf"