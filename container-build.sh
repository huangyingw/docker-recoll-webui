#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'USAGE: ./container-build.sh /full/path/to/your/data/collection'
    echo 'Nothing was done. Please provide your Path'
    exit 0
fi

docker build --label docker-recoll-webui --tag docker-recoll-webui https://github.com/viktor-c/docker-recoll-webui.git

#The passed parameter to this script should be the TOP path to your local collection of data. 
#This will pe passed on to docker, and the volume will be connected to the local mount-point
FULL_PATH=$(readlink -f $1)
echo "The path for the collection is " $FULL_PATH
docker run -d --mount src=$FULL_PATH,target=/data,type=bind docker-recoll-webui
