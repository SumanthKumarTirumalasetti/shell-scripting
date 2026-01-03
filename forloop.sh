#!/bin/bash

LOGSDIR=/home/ec2-user/app-logs
FILESTOCREATE=("app.log" "bap.log" "console.log" "managment.log" "tomme.log" "sequce.log" "tomee.xml")

cd "$LOGSDIR" || exit 1

for i in "${FILESTOCREATE[@]}"
do
    touch -d 20140101 $i
done