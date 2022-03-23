#! /bin/bash

sudo docker start panoseti.control
sudo docker start panoseti.redis
sudo docker start panoseti.influxdb
sudo docker start panoseti.grafana
sudo docker start panoseti.dns
