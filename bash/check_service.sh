#!/bin/bash
#check is service is up. if not, start it.

STATUS="$(systemctl is-active wildfly.service)"

if [ "${STATUS}" = "active" ]; then
    echo "Service is up! Nice."
else 
    echo "Service not running. Bringing it up. Wait a sec."
    sudo systemctl start wildfly.service
    sleep 30
    echo "Validating..."
    systemctl is-active wildfly.service
    echo "Service started and active. Keep an eye on it, pls."
    exit 1
fi