#!/bin/bash

LOG_FILE=/var/log/seven/service-gateway-bank.log
SERVICE=gateway-bank.service

echo -e "Checking files..."
fileSize=$(stat -c%s "$LOG_FILE")
sleep 20;
fileSizeNew=$(stat -c%s "$LOG_FILE")

if [ "$fileSize" == "$fileSizeNew" ]
    then
        echo -e "Stopping service."
        sudo systemctl stop $SERVICE
        sleep 20
        echo -e "Starting service"
        sudo systemctl start $SERVICE
        exit 1
    else
        echo -e "All good here. See you later!"
        exit 0
fi