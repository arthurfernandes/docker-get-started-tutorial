#!/bin/sh

VM=$1

PROXY=10.67.120.43:3128
HTTP_PROXY=http://$PROXY
HTTPS_PROXY=https://$PROXY
NO_PROXY=localhost,10.0.0.0/8,*.eb.mil.br,192.168.99.0/24,127.0.0.1,127.0.1.1

EXPORT="export http_proxy=$HTTP_PROXY HTTP_PROXY=$HTTP_PROXY https_proxy=$HTTPS_PROXY HTTPS_PROXY=$HTTPS_PROXY no_proxy=$NO_PROXY NO_PROXY=$NO_PROXY"

if [ "$#" -eq "0" ]
  then
    echo "No virtual machine name provided"
    exit 1
fi

docker-machine create -d virtualbox --engine-env HTTP_PROXY=$HTTP_PROXY --engine-env HTTPS_PROXY=$HTTPS_PROXY --engine-env NO_PROXY=$NO_PROXY --engine-env http_proxy=$HTTP_PROXY --engine-env https_proxy=$HTTPS_PROXY --engine-env no_proxy=$NO_PROXY $VM

if [ "$?" -eq "0" ]
  then
    docker-machine ssh $VM "echo $EXPORT >> .profile"
  else
    echo "Couldn't create virtual machine $VM"
    exit 1
fi

