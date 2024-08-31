#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ] #-lt, -eq, -ge, -le, -ne
then
    echo "Given number: $NUMBER is greater than 20"
else
    echo "Given number: $NUMBER is less than 20"
fi