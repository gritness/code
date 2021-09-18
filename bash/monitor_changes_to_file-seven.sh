#!/bin/bash
checkUsage() # Note that U is in caps
{
while true
do
        echo -e "Checking files..."
        fileSize=$(stat -c%s /var/log/seven/service-gateway-bank.log)
        sleep 20;
        fileSizeNew=$(stat -c%s /var/log/seven/service-gateway-bank.log)

        if [ "$fileSize" == "$fileSizeNew" ]
        then
            echo -e "Stopping service."
            sudo systemctl stop gssproxy.service
            sleep 20
            echo -e "Starting service"
            sudo systemctl start gssproxy.service
            exit 0
        else
            echo -e "All right here. Hasta!"
            exit 0
        fi
done
}
checkUsage