#!/bin/bash

set -e

echo "Starting OpenEMPI..."

bin/startup.sh

echo "Configuring OpenEMPI database..."

#Run the script using dockerize so that we can wait for the DB to be ready
dockerize -wait tcp://localhost:9092 -timeout 15s \
    java -classpath /usr/share/openempi/h2/bin/h2*.jar org.h2.tools.RunScript \
    -url jdbc:h2:tcp://localhost/openempidb -user openempi -password openempi -script configure_db.sql &

sleep infinity
