#! /bin/bash

./panoseti_stop_containers.sh

sudo docker rm -f panoseti-control
sudo docker rm -f panoseti-redis
sudo docker rm -f panoseti-influxdb
sudo docker rm -f panoseti-grafana
sudo docker rm -f panoseti-dns
