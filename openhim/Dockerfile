FROM jembi/openhim-core

RUN apt-get update && \
    apt-get install -y curl openjdk-7-jre

ENV JAVA_HOME "/usr/lib/jvm/java-7-openjdk-amd64"

# Install dockerize
ENV DOCKERIZE_VERSION="v0.2.0"
RUN curl -L "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \ 
    -o "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" && \
    tar -C /usr/local/bin -xzvf "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz"

# Install XDS mediator and add the OpenHIM certificate to the trust store
ENV MEDIATOR_HOME="mediator"
ENV MEDIATOR_FILE=${MEDIATOR_HOME}/openhim-mediator-xds-1.0.3.tar.gz
RUN mkdir -p "${MEDIATOR_HOME}" \
    && curl -L "https://drive.google.com/a/openmrs.org/uc?authuser=0&id=0B0MQgyHMZoOaY1Z5bzItS0RaQVU&export=download" \
            -o ${MEDIATOR_FILE} \
    && tar -zxvf ${MEDIATOR_FILE} -C ${MEDIATOR_HOME} --strip-components=1 \
    && rm ${MEDIATOR_FILE}

ADD xds-mediator.properties ${MEDIATOR_HOME}/xds-mediator.properties
ADD openhim.crt ${MEDIATOR_HOME}/openhim.crt
RUN keytool -storepass changeit -import -noprompt -trustcacerts -alias openhim -file ${MEDIATOR_HOME}/openhim.crt -keystore $JAVA_HOME/jre/lib/security/cacerts

ADD boot.sh boot.sh
RUN chmod +x boot.sh
ADD start-openhim.sh start-openhim.sh
RUN chmod +x start-openhim.sh
ADD start-mediator.sh ${MEDIATOR_HOME}/start-mediator.sh
RUN chmod +x ${MEDIATOR_HOME}/start-mediator.sh

CMD ["/bin/bash", "boot.sh"]
