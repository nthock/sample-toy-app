#!/bin/sh
# Docker entrypoint script

# Wait until Postgres is ready
# while ! pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER
# do
#   echo "$(date) - waiting for database to start"
# done

./prod/rel/api/bin/api eval Api.Release.migrate

./prod/rel/api/bin/api start
