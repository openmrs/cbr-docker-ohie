FROM tomcat:7-jre7-alpine

RUN apk add --no-cache curl

# Install dockerize
ENV DOCKERIZE_VERSION="v0.2.0"
ENV TOMCAT_HOME=/usr/local/tomcat

RUN curl -L "https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
    -o "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" && \
    tar -C /usr/local/bin -xzvf "/tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz"

WORKDIR ${TOMCAT_HOME}

CMD ["dockerize","-wait","tcp://opencbr-mysql:3306","-timeout","120s","/usr/local/tomcat/bin/catalina.sh", "run"]
