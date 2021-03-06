#!/bin/bash

BACKUPTIME=`date +%Y%m%d%H%M%S`

SOURCEFOLDER1=/etc/seven

SOURCEFOLDER2=/opt/seven

SOURCEFOLDER3=/opt/wildfly/standalone/deployments

DESTINATION=/backup/backup-$BACKUPTIME.tar.gz

tar -cpzf $DESTINATION $SOURCEFOLDER1 $SOURCEFOLDER2 $SOURCEFOLDER3