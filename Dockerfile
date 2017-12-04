FROM openjdk:8-jre

LABEL maintainer="the B9 Company <lab@b9company.fr>"

ARG HADOOP_VERSION
ARG HADOOP_MIRROR="http://apache.crihan.fr/dist/hadoop/common"
ARG HADOOP_ARCHIVE="${HADOOP_MIRROR}/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz"

ENV HADOOP_HOME /usr/local/hadoop

RUN ["bash", "-c", "set -o pipefail && wget -qO - \"${HADOOP_ARCHIVE}\" | tar zx -C /usr/local/"]
RUN ln -s `basename "${HADOOP_ARCHIVE}" .tar.gz` "${HADOOP_HOME}"

ENV PATH "$PATH:${HADOOP_HOME}/bin"

WORKDIR "${HADOOP_HOME}"
