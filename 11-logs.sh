#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "scriptname: $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "Error:$2..$R  failed"
    exit 1
    else
    echo "$2 is $G sucess"
    fi
}

if [ $ID -ne 0 ]
then
echo "Error:please run with root user"
exit 1
else
echo "you are root user"
fi

yum install mysql -y &>>$LOGFILE 

VALIDATE $? "installing mysql"

yum install git -y &>>$LOGFILE

VALIDATE $? "installing git"