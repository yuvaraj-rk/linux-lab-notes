#!/bin/bash

#https://labex.io/labs/shell-passing-arguments-to-the-script-388811?course=shell-for-beginners

echo "Total number of arguments: $#"
echo "All arguments:"

count=1
for arg in "$@"; do
    echo "Argument $count: $arg"
    count=$((count + 1))
done
