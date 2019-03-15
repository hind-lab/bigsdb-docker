FROM postgres:11.2
ENV BIGSDB_VERSION=1.20.1

WORKDIR /tmp

RUN apt-get -y update && apt-get install -y wget bash

RUN wget https://github.com/kjolley/BIGSdb/archive/v_$BIGSDB_VERSION.tar.gz && \
    gunzip /tmp/v_$BIGSDB_VERSION.tar.gz && \
    tar xvf v_$BIGSDB_VERSION.tar && \
    ls -al BIGSdb-v_$BIGSDB_VERSION/sql && \
    mkdir /bigsdb && \
    cp -r BIGSdb-v_$BIGSDB_VERSION/sql/* /bigsdb

COPY init-db/* /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/