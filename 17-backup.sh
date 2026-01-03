#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
O="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=$1
DESTINATION_DIRECOTRY=$2
NUMBEROFDAYS=${3:-14}

ZIPFILEDEST=$DESTINATION_DIRECOTRY
ZIPFILENAME=$(echo $0 | cut -d "." $f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

mkdir -p /home/ec2-user/app-logs
mkdir -p /home/ec2-user/destination-logs

dnf list installed zip

if [ $? -ne 0 ]
then
    dnf install zip -y
else
    echo "zip is already installed"
fi

USAGE() {
    echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi


if [ ! -d $SOURCE_DIRECTORY ]
then
    USAGE
fi

if [ ! -d $DESTINATION_DIRECOTRY ]
then
    USAGE
fi


FINDFILES=$(find $SOURCE_DIRECTORY -type f -name "*.log" -mtime +$NUMBEROFDAYS)
echo "$FINDFILES"

if [ -n "$FINDFILES" ]
then

    ZIPFILEPATH="$ZIPFILEDEST/$ZIPFILENAME-$TIMESTAMP.zip"
    find $SOURCE_DIRECTORY -type f -name "*.log" -mtime +14 | zip -@ $ZIPFILEPATH
    if [ -e $ZIPFILEPATH ]
    then
        echo -e "Successfully created zip file for files older than $DAYS"
        while read -r filepath
        do
            echo "Files to be deleted : $filepath"
            rm -rf $filepath
        done <<< $FINDFILES
    fi
else
    echo "No files found older than $NUMBEROFDAYS"
fi
