FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"] 

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y iputils-ping \
    net-tools \
    vim \
    git \
    build-essential \
    python3 \
    python3-pip \
    bash-completion \
    sudo \
    libsnmp-dev \
    curl \ 
    snmp \ 
    snmpd \
    snmp-mibs-downloader \
    autoconf \
    automake \
    libtool \
    libffi-dev


RUN cd /opt &&\
    git clone http://astro.berkeley.edu/~davidm/hashpipe.git &&\
    git clone https://github.com/liuweiseu/hashpipe_makefile.git &&\
    cd hashpipe/src &&\
    autoreconf -is &&\
    ./configure &&\
    cp ../../hashpipe_makefile/Makefile ./ &&\
    make &&\
    make install


RUN cd /home && \
    git clone -b container https://github.com/liuweiseu/panoseti.git && \
    cd panoseti && \
    pip3 install -r requirements.txt

WORKDIR /home/panoseti