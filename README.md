# PANOSETI-Docker
## Descriptions
&ensp; These scripts are used for setting up a head node for the PANOSETI control system.  
&ensp; The architecture of the docker system is shown below:  
<img src=./Figures/panoseti-docker-system.png width=700 height=350>  
&ensp; There are 5 containers:  
* panoseti-control: This is the container for the control scripts. 
* panoseti-redis: This is the container for the redis database.
* panoseti-influxdb: This is the container for the influxdb database.
* panoseti-grafana: This is the container for the grafana.
* panoseti-dns: This container is working as a dns server, so all the containers can talk to each other via 
hostname.  

&ensp; All the useful data are stored in the Persistent Volume on the physical machine, so we will not lose data, even though the containers stop working.  

&ensp; Before using the scripts, please make sure docker has been installed.  
&ensp; If it's not installed, please follow the instructions [here](https://docs.docker.com/engine/install/).
## How to use it
1. Clone the repository  
```
    git clone https://github.com/liuweiseu/panoseti_docker.git
```
2. Build images  
```shell
    ./panoseti_build_image.sh
```
&ensp; All the necessary images will be pulled from docker hub.  
&ensp; The panoseti_control image will be built based on the Dockerfile.  
&ensp; ***Note***: This script only needs to be ran one time normally.  

3. Create containers  
```shell
    ./panoseti_create_containers.sh
```
&ensp; All the containers will be created.  
&ensp; Now, all of the containers should be running!  
&ensp; ***Note***: This script only needs to be ran one time normally. 

&ensp; By default, the all the useful data, including housekeeping data, redis data, influxdb data and grafana data, will be stored under /home/$USER/panoseti_container_data.  

&ensp; You can use 
```
    ./panoseti_create_containers.sh {data path}
```
&ensp; to specify where you want to store all of the data.  

4. Open a termial for using panoseti control script
```shell
    ./panoseti_terminal.sh
```
&ensp; You should have a termial now!  
&ensp; All of the python control scripts are there.  

&ensp; Some times, you may need to use
```
    git pull origin master
```
to get the latest code.

## Access to grafana
&ensp; As all of the containers are running, you should be able to access grafana.  
&ensp; Just type in
```
    panoseti-grafana:3000
```
&ensp; in your browser, then you should see  
![panoseti-grafana](./Figures/panoseti-grafana.png)  

&ensp; If you can't access grafana successfully, try the following command:
```shell
    sudo systemctl stop systemd-resolved.service 
```

## Start and Stop Containers
&ensp; By default, the containers are running after you create them.   
&ensp; You can run 
```shell
    ./panoseti_stop_containers.sh
```
&ensp; to stop all the containers. (Normally, we don't need to do this.)  
&ensp; When you plan to restart the containers or you restarted the physical machine, you just need to run
```shell
    ./panoseti_start_containers.sh
```

## Delete Containers
&ensp; Sometimes, you may want to delete all of the containers to make the machine clean.  
&ensp; You just need to run
```
    ./panoseti_del_containers.sh
```
