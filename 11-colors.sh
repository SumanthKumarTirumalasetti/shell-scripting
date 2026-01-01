#!/bin/bash

#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
O="\e[33m"
N="\e[0m"


VALIDATE() {

    if [ $1 -ne 0 ]
    then
        echo -e "$2 .. $R FAILURE $N"
        exit1
    else
        echo "$2 .. $G SUCCESS $N"
    fi

}


if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql-server -y
    VALIDATE $? "Installing Mysql"
else
    echo -e  "$O Mysql is already installed $N"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "$O Git is already installed $N"
fi

dnf list installed ansible

if [ $? -ne 0 ]
then
    dnf install ansible -y
    VALIDATE $? "Installing Ansible"
else
    echo -e "$O Ansible is already installed $N"
fi
