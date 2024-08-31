#!/bin/bash

LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

#text colors
#31m -> Red
#31m -> Green
#33m -> Yellow

R="\e[31m"
G="\e[32m"
N="\e[0m"


CHECK_ROOT(){
    if [ $USER -ne 0 ]
    then
        echo -e $R "Please run this script with root privileges" $N &>>$LOG_FILE
        exit 1
    fi

}

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e $G "$2 is successful." $N &>>$LOG_FILE
    else
        echo -e $R "$2 is failed.... please check" $N &>>$LOG_FILE
        exit 1
    fi
}

USER=$(id -u)

CHECK_ROOT

mkdir -p $LOGS_FOLDER

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e $G "$package is not installed. Going to install $package." $N &>>$LOG_FILE
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo -e $G "$package already installed. Nothing to do." $N &>>$LOG_FILE
    fi
done