#!/bin/bash

NAMES=("A" "B" "C")

echo "First name is:: ${NAMES[0]}"
echo "Second name is:: ${NAMES[1]}"
echo "Third name is:: ${NAMES[2]}"

echo "all names are:: ${NAMES[@]}"

echo "Total number of names:: ${NAMES[#]}"