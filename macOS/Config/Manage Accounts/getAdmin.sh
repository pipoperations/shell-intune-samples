#!/usr/bin/env bash

############################################################################################
##
## Script to find all admin users
##
###########################################

scriptname="Get Admin Users"
log="/var/log/getadminusers.log"
logandmetadir="/Library/IntuneScripts/getadminusers"
log="$logandmetadir/getadminusers.log"

## Check if the log directory has been created and start logging
if [ -d $logandmetadir ]; then
    ## Already created
    echo "# $(date) | Log directory already exists - $logandmetadir"
else
    ## Creating Metadirectory
    echo "# $(date) | creating log directory - $logandmetadir"
    mkdir -p $logandmetadir
fi

# start logging

exec 1>> $log 2>&1

# Begin Script Body

echo ""
echo "##############################################################"
echo "# $(date) | Starting $scriptname"
echo "############################################################"
echo ""

dscacheutil -q group -a name admin
