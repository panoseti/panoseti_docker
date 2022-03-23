#! /bin/bash

sudo docker run -itd --name panoseti-control --hostname panoseti-control --net=panoseti-bridge --device=/dev/ttyUSB5 -v /home/wei/headnode_data:/home/data panoseti_control:latest
sudo docker run -d --name panoseti-redis --hostname panoseti-redis --net=panoseti-bridge -v /home/wei/database/redis:/data redis redis-server --save 60 1 --loglevel warning
sudo docker run -d --name panoseti-influxdb --hostname panoseti-influxdb --net=panoseti-bridge -v /home/wei/database/influxdb:/var/lib/influxdb influxdb:1.8.10
sudo docker run -d --name panoseti-grafana --hostname panoseti-grafana --net=panoseti-bridge grafana/grafana
sudo docker run -itd --name panoseti-dns --hostname panoseti-dns --net=panoseti-bridge -v /var/run/docker.sock:/var/run/docker.sock -v /etc/resolv.conf:/etc/resolv.conf defreitas/dns-proxy-server
