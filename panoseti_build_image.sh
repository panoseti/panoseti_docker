#! /bin/bash

sudo docker pull redis
sudo docker pull influxdb:1.8.10
sudo docker pull grafana/grafana
sudo docker pull defreitas/dns-proxy-server
sudo docker rmi panoseti_control:latest
sudo docker build -t panoseti_control:latest .
