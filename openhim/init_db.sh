#!/bin/bash

set -e

echo "Loading initial data into OpenHIM database..."

mongorestore --gzip --archive=openhim_db.gz --nsInclude 'openhim.*'