#! /bin/bash

sudo docker run -itd --name panoseti.control --net=panoseti-bridge --hostname headnode --device=/dev/ttyUSB5 -v /home/wei/headnode_data:/home/data panoseti_control:latest
sudo docker run --name panoseti.redis --net=panoseti-bridge -v /home/wei/database/redis:/data -d redis redis-server --save 60 1 --loglevel warning
sudo docker run -d --name panoseti.influxdb --net=panoseti-bridge -v /home/wei/database/influxdb:/var/lib/influxdb influxdb:1.8.10
sudo docker run -d --name panoseti.grafana --net=panoseti-bridge -d grafana/grafana
