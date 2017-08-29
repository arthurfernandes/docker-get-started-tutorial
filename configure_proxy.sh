#!/bin/bash

VM=$1

PROXY=10.67.120.43:3128
HTTP_PROXY=http://$PROXY
HTTPS_PROXY=https://$PROXY
NO_PROXY='localhost,10.0.0.0/8,*.eb.mil.br'

EXPORT="export http_proxy=$HTTP_PROXY HTTP_PROXY=$HTTP_PROXY https_proxy=$HTTPS_PROXY HTTPS_PROXY=$HTTPS_PROXY no_proxy=$NO_PROXY NO_PROXY=$NO_PROXY"

docker-machine ssh $VM "echo $EXPORT >> .profile"
#docker-machine ssh $VM "sudo echo $EXPORT >> /var/lib/boot2docker/profile"
