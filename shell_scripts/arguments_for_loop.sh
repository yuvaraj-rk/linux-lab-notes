#!/bin/bash

#https://labex.io/labs/shell-passing-arguments-to-the-script-388811?course=shell-for-beginners

echo "Total number of arguments: $#"
echo "All arguments:"

count=1
for arg in "$@"; do
    echo "Argument $count: $arg"
    count=$((count + 1))
done

# Loop through an array of names
echo "Looping through an array:"
NAMES=("Alice" "Bob" "Charlie" "David")
for name in "${NAMES[@]}"; do
  echo "Hello, $name!"
done

echo # Print an empty line for readability

# Loop through a range of numbers
echo "Looping through a range of numbers:"
for i in {1..5}; do
  echo "Number: $i"
done

# Simple countdown using a while loop
count=5
echo "Countdown:"
while [ $count -gt 0 ]; do
  echo $count
  count=$((count - 1))
  sleep 1 # Wait for 1 second
done
echo "Blast off!"

# Count up to 5 using an until loop
count=1
echo "Counting up to 5:"
until [ $count -gt 5 ]; do
  echo $count
  count=$((count + 1))
  sleep 1 # Wait for 1 second
done