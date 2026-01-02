#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
O="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=$1
DESTINATION_DIRECOTRY=$2
NUMBEROFDAYS=${3:-14}

mkdir -p /home/ec2-user/app-logs
mkdir -p /home/ec2-user/destination-logs

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

