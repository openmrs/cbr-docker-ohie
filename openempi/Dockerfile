FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y nano net-tools

ENV OPENEMPI_VERSION=3.4.0
ENV OPENEMPI_ARCHIVE=openempi-entity-${OPENEMPI_VERSION}c-release.tar.gz
ENV OPENEMPI_HOME=/usr/share/openempi

RUN mkdir -p ${OPENEMPI_HOME}
WORKDIR ${OPENEMPI_HOME}

# Install dockerize
ENV DOCKERIZE_VERSION="v0.2.0"
RUN curl -L "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
    -o "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" && \
    tar -C /usr/local/bin -xzvf "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz"

RUN mkdir -p "${HOME_SHARE}/openxds/" \
    && curl -L "http://www.openempi.org/openempi-downloads/file_download/?username=odysseas@sysnetint.com&filename=${OPENEMPI_ARCHIVE}" \
            -o ${OPENEMPI_ARCHIVE} \
    && tar -zxvf ${OPENEMPI_ARCHIVE} -C . \
    && rm ${OPENEMPI_ARCHIVE}

RUN cp -R openempi-${OPENEMPI_VERSION}c/** . && \
    rm -R openempi-${OPENEMPI_VERSION}c

#The post-install script assume this exists, so create it to please it
RUN mkdir -p openempi-entity-${OPENEMPI_VERSION}c/bin

#The post-install script assumes this doesn't, so remove it to please it
RUN rm -R openempi-entity-${OPENEMPI_VERSION}c/fileRepository
ADD configure_db.sql configure_db.sql

ADD boot.sh boot.sh
ADD post-install.sh post-install.sh
ADD setenv.sh bin/setenv.sh
RUN chmod +x boot.sh && \
    chmod +x post-install.sh && \
    chmod +x bin/setenv.sh

RUN ./post-install.sh ${OPENEMPI_HOME} ${OPENEMPI_VERSION}

EXPOSE 9092
EXPOSE 8080
EXPOSE 3600

CMD ["./boot.sh", "run"]
#docker run --name=openempi -ti -p 8080:8080 3600:3600 openempi
