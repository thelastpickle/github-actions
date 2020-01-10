FROM ubuntu:bionic

RUN apt-get update && apt-get install -y gnupg2
RUN apt-get install -y python-pip openjdk-8-jdk maven

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B05F25D762E3157 \
    && apt-get update \
    && apt-get install -y libjna-java wget nodejs npm sudo


ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y lsb-release ca-certificates \
    && adduser -q --disabled-password --gecos "postgres,postgres" --shell /bin/bash postgres \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' \
    && apt-get update \
    && apt-get install -y postgresql postgresql-contrib

RUN adduser -q --disabled-password --gecos "runner,github" --shell /bin/bash runner
RUN echo "runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER runner
WORKDIR /home/runner

COPY ./scripts/provision.sh ./scripts/provision.sh
RUN ./scripts/provision.sh

COPY files files

COPY ./scripts/configure-ccm.sh ./scripts/configure-ccm.sh
COPY ./scripts/configure-psql.sh ./scripts/configure-psql.sh
COPY ./scripts/run-tests.sh ./scripts/run-tests.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
