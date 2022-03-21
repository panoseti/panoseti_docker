#! /bin/bash

sudo docker run -itd --name panoseti_control --hostname headnode --device=/dev/ttyUSB5 -v /home/wei/headnode_data:/home/data panoseti_control:latest
sudo docker run --name redis-server -v /home/wei/database/redis:/data -d redis redis-server --save 60 1 --loglevel warning
sudo docker run -d --name influxdb-server -v /home/wei/database/influxdb:/var/lib/influxdb influxdb:1.8.10
sudo docker run -d --name grafana -d grafana/grafana
