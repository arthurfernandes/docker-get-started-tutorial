#!/bin/bash

MACHINE=192.168.99.101:80
REQUESTS=5

while :
do
	for i in {0..10}
	do
		curl http://$MACHINE --no-proxy $MACHINE &
		echo $!
		echo "\n"
	done
	sleep 1
done
