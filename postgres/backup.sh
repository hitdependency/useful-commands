#!/bin/bash

# Set backup home
PG_HOME=/var/lib/postgresql/backup

# Get database list except % grep -v % names and templates
psql -Atc "SELECT datname FROM pg_database \
           WHERE datistemplate = false;" | \
       cut -d '|' -f2 | \
       grep -v rspp-egrul | \
       grep -v scsto-fias   \
       > $PG_HOME/db_list.latest

# Taking backup from database list file
while read p; \
      do \
         mkdir -p $PG_HOME/dumps/$p
         pg_dump -Fc $p -f $PG_HOME/dumps/${p}/${p}.$(date '+%Y-%m-%d-%H-%M-%S').dump && \
         echo "$(date) $p done" \
         >> $PG_HOME/logs.latest ; \
      done < db_list.latest

# Remove files older than 7 days 
find $PG_HOME/dumps -type f -mtime +4 -name '*.dump' -execdir rm -- '{}' \;
