#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER &>>$LOG_FILE

USER=$(id -u)

#text colors
#31m -> Red
#31m -> Green
#33m -> Yellow

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
echo -e "$Y Script started execution at: $(date) $N" | tee -a $LOG_FILE
CHECK_ROOT(){
    if [ $USER -ne 0 ]
    then
        echo -e "$R Please run this script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi

}

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is $G successful. $N" &>>$LOG_FILE
    else
        echo -e "$2 is $R failed.... please check $N" | tee -a $LOG_FILE
        exit 1
    fi
}

USAGE(){
    echo -e "$R USAGE:: sudo sh 16-redirectors.sh package1 package2 ... $N"
    exit 1
}
CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed. Going to install $package. $N" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$Y $package already installed. Nothing to do. $N" &>>$LOG_FILE
    fi
done
echo -e "$Y Script completed execution at: $(date) $N" | tee -a $LOG_FILE