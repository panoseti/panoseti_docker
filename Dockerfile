FROM ubuntu:18.04

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
    snmp-mibs-downloader

RUN cd /home && \
    git clone -b container https://github.com/liuweiseu/panoseti.git && \
    cd panoseti && \
    pip3 install -r requirements.txt

WORKDIR /home/panoseti