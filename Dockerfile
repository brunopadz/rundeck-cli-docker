FROM openjdk:11.0.4-jre-slim

USER root

RUN apt-get update -y && \
    apt-get install -y jq \
    curl \
    apt-transport-https \
    gnupg2

RUN echo "deb https://dl.bintray.com/rundeck/rundeck-deb /" | \
    tee -a /etc/apt/sources.list 

RUN curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" > \
    /tmp/bintray.gpg.key

RUN apt-key add - < /tmp/bintray.gpg.key

RUN apt-get update -y && \
    apt-get install -y rundeck-cli

