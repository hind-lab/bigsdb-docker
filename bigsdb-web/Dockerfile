# base
FROM httpd

# arguments and environment
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
# core
RUN apt-get -y update && apt-get install -y \
        bioperl \
        build-essential \
        curl \
        emboss \ 
        exonerate \
        iputils-ping \
        less \
        libapache2-mod-perl2 \
        ncbi-blast+ \
        perl \
        python-pip \
        vim \
        wget \
        libfile-spec-native-perl \
        make \ 
        gcc \
        libperl-dev \
        xvfb && \
    perl -MCPAN -e 'install(Archive::Zip,Bio::Biblio,CGI,Config::Tiny,Crypt::Eksblowfish::Bcrypt,Data::UUID,DBD-Pg,DBI,Email::MIME,Email::Sender,Email::Valid,Error,Excel::Writer::XLSX,IO::String,JSON,List::MoreUtils,Log::Dispatch::File,Log::Log4perl,LWP::UserAgent,Net::Oauth,Parallel::ForkManager,Time::Duration,XML::Parser::perlSAX,Net::OAuth,Data::Random,Plack)' && \
    wget http://apache.mirrors.lucidnetworks.net/perl/mod_perl-2.0.10.tar.gz && \
    ln -s /usr/lib/x86_64-linux-gnu/libgdbm.so.3.0.0 /usr/lib/libgdbm.so && \
    tar -zxvf mod_perl-2.0.10.tar.gz && \
    rm mod_perl-2.0.10.tar.gz && \
    cd mod_perl-2.0.10 && \
    perl Makefile.PL MP_AP_PREFIX=/usr/local/apache2 && \
    make && \ 
    make install && \
    cd ../ && \
    rm -r mod_perl-2.0.10  && \
    apt-get remove -y build-essential make gcc libperl-dev

# other software
#RUN wget https://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz
#RUN wget http://ab.inf.uni-tuebingen.de/data/software/splitstree4/download/splitstree4_unix_4_14_6.sh


# install splitstree
#RUN chmod u+x splitstree4_unix_4_14_6.sh
#RUN echo 'o\n1\n\n\n\n\n\n\n' > install.txt
#RUN ./splitstree4_unix_4_14_6.sh < install.txt

# install muscle
# TODO

ENV BIGSDB_VERSION=1.20.1

# download bigsdb, unpack, and copy files to appropriate locations
RUN wget https://github.com/kjolley/BIGSdb/archive/v_$BIGSDB_VERSION.tar.gz && \
    gunzip v_$BIGSDB_VERSION.tar.gz && \
    tar xvf v_$BIGSDB_VERSION.tar && \
    mkdir /usr/local/apache2/perl/ && \
    cp BIGSdb-v_$BIGSDB_VERSION/*.pl /usr/local/apache2/cgi-bin/ && \
    chown -R www-data /usr/local/apache2/cgi-bin/ && \
    chmod +x /usr/local/apache2/cgi-bin/* && \
    mkdir /usr/local/lib/BIGSdb/ && \
    cp -R BIGSdb-v_$BIGSDB_VERSION/lib/* /usr/local/lib/ && \
    chown -R www-data /usr/local/lib/BIGSdb/ && \
    mkdir /etc/bigsdb/ && \
    cp -R BIGSdb-v_$BIGSDB_VERSION/conf/* /etc/bigsdb/ && \
    cp -R BIGSdb-v_$BIGSDB_VERSION/javascript /usr/local/apache2/htdocs/ && \
    cp -R BIGSdb-v_$BIGSDB_VERSION/css /usr/local/apache2/htdocs/ && \
    cp -R BIGSdb-v_$BIGSDB_VERSION/webfonts /usr/local/apache2/htdocs/ && \
    cp -R BIGSdb-v_$BIGSDB_VERSION/images /usr/local/apache2/htdocs/ && \
    touch /usr/local/apache2/logs/bigsdb.log && \
    chown www-data:www-data /usr/local/apache2/logs/bigsdb.log

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY conf/* /etc/bigsdb/
ENV DOCUMENT_ROOT=/tmp
COPY dbs/ /etc/bigsdb/dbases/
COPY header.html /etc/bigsdb
