#!/bin/bash

patron='ExecStartPre=/bin/sleep'
for i in /lib/systemd/system/docker.service
do
    linea=`grep -n $patron $i`
    if [ "${linea:-NULL}" = "NULL" ]; then
        sed -i '/[[]Service[]]/a ExecStartPre=\/bin\/sleep 60' /lib/systemd/system/docker.service
		docker restart $(docker ps -a -q)
    else
        echo "Puesta"
    fi
done
