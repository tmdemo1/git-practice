#!/bin/bash

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
        echo -e $R "Please login with SUDO" $N
        exit 1
    fi

}

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo -e $G "$2 is successful." $N
    else
        echo -e $R "$2 is failed.... please check" $N
        exit 1
    fi
}

USER=$(id -u)

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e $G "$package is not installed. Going to install $package." $N
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo -e $G "$package already installed. Nothing to do." $N
    fi
done