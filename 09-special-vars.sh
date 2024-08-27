#!/bin/bash

echo "All variables passed to the script :: $@"

echo "No of varaibles passed to the script :: $#"

echo "Script name: $0"

echo "pwd is :: $PWD"

echo "User home dir is :: $HOME"

echo "PID is :: $$"

sleep 100 &

echo "PID of last background command :: $!"