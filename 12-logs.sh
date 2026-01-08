#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
O="\e[33m"
N="\e[0m"

mkdir -p /var/log/expense-logs

LOGS_DIR="/var/log/expense-logs"
FILENAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d_%H:%M:%S)
LOGFILENAME="$LOGS_DIR/$FILENAME-$TIMESTAMP.log"


VALIDATE() {

    if [ $1 -ne 0 ]
    then
        echo -e "$2 .. $R FAILURE $N"
        exit 1
    else
        echo -e "$2 .. $G SUCCESS $N"
    fi

}


if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql &>> $LOGFILENAME

if [ $? -ne 0 ]
then
    dnf install mysql-server -y &>> $LOGFILENAME
    VALIDATE $? "Installing Mysql"
else
    echo -e  "Mysql is already $O installed $N"
fi

dnf list installed git &>> $LOGFILENAME

if [ $? -ne 0 ]
then
    dnf install git -y &>> $LOGFILENAME
    VALIDATE $? "Installing Git"
else
    echo -e "Git is already $O installed $N"
fi

dnf list installed ansible &>> $LOGFILENAME

if [ $? -ne 0 ]
then
    dnf install ansible -y &>> $LOGFILENAME
    VALIDATE $? "Installing Ansible"
else
    echo -e "Ansible is already $O installed $N"
fi
