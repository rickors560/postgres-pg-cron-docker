#!/usr/bin/env bash
database_name="${PG_CRON_DB:='postgres'}"

pg_cron_conf=/var/lib/postgresql/data/pg_cron.conf

{
    echo "#pg_cron configuration"
    echo "shared_preload_libraries = 'pg_cron'"
    echo "cron.database_name = '$database_name'"
} >> $pg_cron_conf

pg_conf=/var/lib/postgresql/data/postgresql.conf

if ! grep -q "include = '$pg_cron_conf'" "$pg_conf"; then
    echo "include = '$pg_cron_conf'" >> $pg_conf
fi

echo "PG_CRON extension installed successfully!"