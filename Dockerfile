FROM centos

MAINTAINER Yongyu Lee <aleeyyu@gmail.com>

ENV ACTIVATOR_VERSION 1.2.10
ENV PATH $PATH:/app/activator-$ACTIVATOR_VERSION-minimal

RUN \
  yum install -y --nogpgcheck unzip java-1.7.0-openjdk-devel && \
  yum clean all

RUN \
  mkdir -p /app && \
  cd /app && \
  curl -sS http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION-minimal.zip -o typesafe-activator-$ACTIVATOR_VERSION-minimal.zip && \
  unzip typesafe-activator-$ACTIVATOR_VERSION-minimal.zip && \
  rm -f typesafe-activator-$ACTIVATOR_VERSION-minimal.zip

VOLUME ["/app/workspace"]
WORKDIR /app/workspace

CMD ["/bin/bash"]
