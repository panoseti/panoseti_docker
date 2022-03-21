#! /bin/bash

sudo docker start panoseti_control
sudo docker start redis-server
sudo docker start influxdb-server
sudo docker start grafana
