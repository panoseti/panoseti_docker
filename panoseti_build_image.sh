#! /bin/bash

sudo docker pull redis
sudo docker pull influxdb:1.8.10
sudo docker rmi panoseti_grafana:latest
sudo docker build -t panoseti_grafana:latest panoseti_grafana/
sudo docker pull defreitas/dns-proxy-server
sudo docker rmi panoseti_control:latest
sudo docker build -t panoseti_control:latest .
sudo docker network create panoseti-bridge