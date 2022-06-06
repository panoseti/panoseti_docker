#! /bin/bash

if [ $# != 1 ]; then
DATA_PATH="/home/$USER/panoseti_container_data"
else
DATA_PATH=$1
fi

HK_PORT=60002

mkdir -p $DATA_PATH/headnode_data
mkdir -p $DATA_PATH/database/redis
mkdir -p $DATA_PATH/database/influxdb
mkdir -p $DATA_PATH/database/grafana

ID=$(id -u)

sudo docker run -itd --name panoseti-control --hostname panoseti-control --net=panoseti-bridge -p $HK_PORT:$HK_PORT/udp --privileged -u root -v $DATA_PATH/headnode_data:/home/data panoseti_control:latest
sudo docker run -d --name panoseti-redis --hostname panoseti-redis --net=panoseti-bridge -v $DATA_PATH/database/redis:/data redis redis-server --save 60 1 --loglevel warning
sudo docker run -d --name panoseti-influxdb --hostname panoseti-influxdb --net=panoseti-bridge -v $DATA_PATH/database/influxdb:/var/lib/influxdb influxdb:1.8.10
sudo docker run -d --name panoseti-grafana --hostname panoseti-grafana --net=panoseti-bridge  --user $ID -v $DATA_PATH/database/grafana:/var/lib/grafana panoseti_grafana:latest
sudo docker run -itd --name panoseti-dns --hostname panoseti-dns --net=panoseti-bridge -v /var/run/docker.sock:/var/run/docker.sock -v /etc/resolv.conf:/etc/resolv.conf defreitas/dns-proxy-server
