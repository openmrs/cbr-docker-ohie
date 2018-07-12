#!/bin/bash
#

INSTALLDIR=$1
VERSION=$2
echo "Executing post installation script"
echo "INSTALLDIR=$INSTALLDIR"
echo "VERSION=$VERSION"

OPENEMPIHOME=${INSTALLDIR}/openempi-entity-${VERSION}c/
H2DIR=${INSTALLDIR}/h2
H2CP=${H2DIR}/bin/h2*.jar
H2SQL=${OPENEMPIHOME}/conf/h2
H2URL="jdbc:h2:${OPENEMPIHOME}/openempidb"

echo "Will be replacing OPENEMPI_HOME with ${OPENEMPIHOME}"

echo "Fixing the openempi-admin.xml file"
sed -i "s^@OPENEMPIHOME@^${INSTALLDIR}^g" ${INSTALLDIR}/conf/Catalina/localhost/openempi-admin.xml

echo "Fixing the setenv.sh file"
sed -i "s^@OPENEMPIHOME@^${OPENEMPIHOME}^g" ${INSTALLDIR}/bin/setenv.sh

echo "Fixing executable permissions"
find ${INSTALLDIR}/bin -type f -name "*.sh" -exec chmod +x {} \;
find ${INSTALLDIR}/h2/bin -type f -name "*.sh" -exec chmod +x {} \;
find ${OPENEMPIHOME}/bin -type f -name "*.sh" -exec chmod +x {} \;

echo "Fix the mpi-config.xml file"
sed -i "s^data-directory.*^data-directory>${OPENEMPIHOME}</data-directory>^" ${OPENEMPIHOME}/conf/mpi-config.xml
sed -i "s^repository-directory.*^repository-directory>${OPENEMPIHOME}fileRepository</file-repository-directory>^" ${OPENEMPIHOME}/conf/mpi-config.xml

echo "Fixing the startup.sh script"
sed -i "s^@INSTALLDIR@^${INSTALLDIR}^g" ${INSTALLDIR}/bin/startup.sh
sed -i "s^@OPENEMPIHOME@^${OPENEMPIHOME}^g" ${INSTALLDIR}/bin/startup.sh

echo "Fixing the shutdown.sh script"
sed -i "s^@INSTALLDIR@^${INSTALLDIR}^g" ${INSTALLDIR}/bin/shutdown.sh
sed -i "s^@OPENEMPIHOME@^${OPENEMPIHOME}^g" ${INSTALLDIR}/bin/shutdown.sh

echo "Make the default fileRepository directory"
mkdir ${OPENEMPIHOME}/fileRepository

