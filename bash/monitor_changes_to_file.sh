#Bash script to monitor changes to file
#!/bin/bash
checkUsage() # Note that U is in caps
{
while true
do
        sleep 15
        fileSize=$(stat -c%s $1)
        sleep 10;
        fileSizeNew=$(stat -c%s $1)

        if [ "$fileSize" == "$fileSizeNew" ]
        then
           echo -e  "[Notice : ] no changes noted in $1 : gracefully exiting"
           exit # previously this was kill -9 $$
           # changing this to exit would end the program gracefully.
           # use kill -9 to kill a process which is not under your control.
           # kill -9 sends the SIGKILL signal.
        fi

done
}
checkUsage $1 # I have added this to your script

#End of the script

#Save the script as checkusage and run it like:
#./checkusage /var/log/messages &

