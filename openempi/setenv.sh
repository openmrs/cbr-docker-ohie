#!/bin/bash

export OPENEMPI_HOME=/usr/share/openempi/openempi-entity-${OPENEMPI_VERSION}c
VMPARAMS="-Xms1024m -Xmx1024m"
export JAVA_OPTS="${VMPARAMS} -Dopenempi.home=${OPENEMPI_HOME} -Djava.security.egd=file:/dev/urandom"
